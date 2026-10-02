import { NextResponse } from 'next/server';
import crypto from 'crypto';
import { z } from 'zod';
import { isRedisConfigured, redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { getServiceClient } from '@/lib/supabase/admin';
import { calculateEloUpdate } from '@/lib/ranking/elo';

const EventSchema = z.object({
  client_vote_id: z.string(),
  item_a: z.string().uuid(),
  item_b: z.string().uuid(),
  outcome: z.enum(['a', 'b', 'skip']),
  winner: z.string().nullable().optional(),
  category_id: z.string().uuid().optional(),
  anon_id: z.string().uuid().nullable().optional(),
  weight: z.coerce.number().default(1),
  decision_ms: z.coerce.number().default(0),
  unfamiliar_a: z.string().transform(v => v === 'true').optional(),
  unfamiliar_b: z.string().transform(v => v === 'true').optional(),
  source: z.string().optional(),
  ip_hash: z.string().optional(),
  created_at: z.string().optional(),
});

function timingSafeCompare(a: string, b: string) {
  if (a.length !== b.length) return false;
  return crypto.timingSafeEqual(Buffer.from(a), Buffer.from(b));
}

export async function GET(request: Request) {
  const supabase = getServiceClient();
  const authHeader = request.headers.get('authorization');
  const expectedAuth = `Bearer ${process.env.CRON_SECRET || ''}`;
  
  if (!process.env.CRON_SECRET || !authHeader || !timingSafeCompare(authHeader, expectedAuth)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  if (!isRedisConfigured()) {
    return NextResponse.json({ error: 'Redis unconfigured' }, { status: 500 });
  }

  const LOCK_KEY = 'lock:flush';
  const STREAM_KEY = REDIS_KEYS.VOTES_STREAM;
  const GROUP_NAME = 'flushers';
  const CONSUMER_NAME = 'worker-1';

  const lockToken = crypto.randomUUID();
  const locked = await redis.set(LOCK_KEY, lockToken, { nx: true, px: 55000 });
  if (!locked) {
    return NextResponse.json({ ok: false, msg: 'Lock held' });
  }

  try {
    try {
      await (redis as unknown as Record<string, (...args: unknown[]) => unknown>).xgroup('CREATE', STREAM_KEY, GROUP_NAME, '0', { MKSTREAM: true });
    } catch (e: unknown) {
      if (e instanceof Error && !e.message.includes('BUSYGROUP')) {
        throw e;
      }
    }

    let totalProcessed = 0;
    
    for (let batch = 0; batch < 5; batch++) {
      let messages: Array<[string, string[]]> = [];
      let isAutoclaim = false;
      
      // 1. Try XAUTOCLAIM first
      const autoclaimRes = await (redis as unknown as Record<string, (...args: unknown[]) => unknown>).xautoclaim(STREAM_KEY, GROUP_NAME, CONSUMER_NAME, 60000, '0', { count: 1000 });
      if (autoclaimRes && Array.isArray(autoclaimRes) && autoclaimRes.length >= 2) {
        messages = autoclaimRes[1] as Array<[string, string[]]>;
      }

      if (messages.length > 0) {
        isAutoclaim = true;
      } else {
        // 2. Try XREADGROUP
        const result = await redis.xreadgroup(GROUP_NAME, CONSUMER_NAME, STREAM_KEY, '>', { count: 1000 }) as Array<[string, Array<[string, string[]]>]> | null;
        if (result && Array.isArray(result) && result.length > 0) {
          const stream = result[0];
          messages = stream[1];
        }
      }

      if (!messages || messages.length === 0) {
        break; // No more messages in this stream
      }

      const eventsToProcess: Array<{ streamId: string; data: z.infer<typeof EventSchema> }> = [];
      const itemIds = new Set<string>();
      const deadIds: string[] = [];

      for (const msg of messages) {
        const id = msg[0];
        const fields = msg[1];
        const rawObj: Record<string, string> = {};
        for (let i = 0; i < fields.length; i += 2) {
          rawObj[fields[i]] = fields[i + 1];
        }

        const parsed = EventSchema.safeParse(rawObj);
        if (!parsed.success) {
          await redis.lpush('dead:votes', JSON.stringify({ streamId: id, raw: rawObj, error: parsed.error }));
          deadIds.push(id);
          console.error(`Invalid event shape for ${id}`);
          continue;
        }

        // Check undo
        const undoKey = `undo:${parsed.data.client_vote_id}`;
        const hasUndo = await redis.get(undoKey);
        if (hasUndo) {
          deadIds.push(id);
          continue; // skip and ack
        }

        eventsToProcess.push({ streamId: id, data: parsed.data });
        itemIds.add(parsed.data.item_a);
        itemIds.add(parsed.data.item_b);
      }

      if (itemIds.size === 0 && deadIds.length > 0) {
        await (redis as unknown as Record<string, (...args: unknown[]) => unknown>).xack(STREAM_KEY, GROUP_NAME, ...deadIds);
        totalProcessed += deadIds.length;
        continue;
      } else if (itemIds.size === 0) {
        continue;
      }

      // Fetch items
      const { data: currentItems, error: itemsError } = await supabase
        .from('items')
        .select('id, rating, rd, vote_count, win_count, loss_count, last_voted_at')
        .in('id', Array.from(itemIds));

      if (itemsError) throw itemsError;

      const itemMap = new Map<string, typeof currentItems[0]>();
      currentItems.forEach((item) => itemMap.set(item.id, { ...item }));

      const p_votes: Record<string, unknown>[] = [];
      const p_pairs = new Map<string, { item_lo: string; item_hi: string; lo_wins: number; hi_wins: number }>();
      const p_anons = new Map<string, { anon_id: string; last_seen: string }>();

      const ackIds: string[] = [...deadIds];

      for (const eventObj of eventsToProcess) {
        const id = eventObj.streamId;
        const data = eventObj.data;
        
        const itemA = itemMap.get(data.item_a);
        const itemB = itemMap.get(data.item_b);

        if (!itemA || !itemB) {
          await redis.lpush('dead:votes', JSON.stringify({ streamId: id, reason: 'unknown item' }));
          ackIds.push(id);
          console.error(`Unknown item in event ${id}`);
          continue;
        }

        if (data.outcome !== 'skip') {
          let winner = itemA;
          let loser = itemB;
          let winnerId = data.item_a;

          if (data.outcome === 'b') {
            winner = itemB;
            loser = itemA;
            winnerId = data.item_b;
          }

          const { newA, newB } = calculateEloUpdate(winner, loser, data.weight);

          winner.rating = newA.rating;
          winner.rd = newA.rd;
          winner.vote_count += 1;
          winner.win_count += 1;
          winner.last_voted_at = data.created_at || new Date().toISOString();

          loser.rating = newB.rating;
          loser.rd = newB.rd;
          loser.vote_count += 1;
          loser.loss_count += 1;
          loser.last_voted_at = data.created_at || new Date().toISOString();

          const [lo, hi] = [data.item_a, data.item_b].sort();
          const pairKey = `${lo}:${hi}`;
          if (!p_pairs.has(pairKey)) {
            p_pairs.set(pairKey, { item_lo: lo, item_hi: hi, lo_wins: 0, hi_wins: 0 });
          }
          const delta = p_pairs.get(pairKey)!;
          if (winnerId === lo) delta.lo_wins++;
          else delta.hi_wins++;
        }

        p_votes.push({
          client_vote_id: data.client_vote_id,
          item_a: data.item_a,
          item_b: data.item_b,
          winner: data.outcome === 'skip' ? null : (data.outcome === 'a' ? data.item_a : data.item_b),
          outcome: data.outcome,
          category_id: data.category_id || '00000000-0000-0000-0000-000000000000',
          user_id: null,
          anon_id: data.anon_id || null,
          weight: data.weight,
          decision_ms: data.decision_ms,
          predicted_winner: null,
          unfamiliar_a: data.unfamiliar_a || false,
          unfamiliar_b: data.unfamiliar_b || false,
          source: data.source || 'arena',
          ip_hash: data.ip_hash || null,
          country: null,
          created_at: data.created_at || new Date().toISOString()
        });

        if (data.anon_id) {
          p_anons.set(data.anon_id, { anon_id: data.anon_id, last_seen: data.created_at || new Date().toISOString() });
        }

        ackIds.push(id);
      }

      const p_items = Array.from(itemMap.values()).map(item => ({
        id: item.id,
        rating: item.rating,
        rd: item.rd,
        vote_count: item.vote_count,
        win_count: item.win_count,
        loss_count: item.loss_count,
        last_voted_at: item.last_voted_at
      }));
      const p_pairs_arr = Array.from(p_pairs.values());
      const p_anons_arr = Array.from(p_anons.values());

      if (p_votes.length > 0 || p_items.length > 0) {
        const { error: rpcError } = await supabase.rpc('apply_flush', {
          p_votes: p_votes.length > 0 ? p_votes : null,
          p_items: p_items.length > 0 ? p_items : null,
          p_pairs: p_pairs_arr.length > 0 ? p_pairs_arr : null,
          p_anons: p_anons_arr.length > 0 ? p_anons_arr : null,
        });

        if (rpcError) {
          throw rpcError;
        }
      }

      if (ackIds.length > 0) {
        await (redis as unknown as Record<string, (...args: unknown[]) => unknown>).xack(STREAM_KEY, GROUP_NAME, ...ackIds);
        totalProcessed += ackIds.length;
      }

      // If we didn't read a full batch, we can break early
      if (messages.length < 1000 && !isAutoclaim) {
        break;
      }
    }

    let lag = 0;
    try {
      const groupsInfo = await (redis as unknown as Record<string, (...args: unknown[]) => unknown>).xinfo('GROUPS', STREAM_KEY);
      if (Array.isArray(groupsInfo)) {
        for (const info of groupsInfo) {
          if (Array.isArray(info)) {
            let isTargetGroup = false;
            let currentLag = 0;
            for (let i = 0; i < info.length; i += 2) {
              if (info[i] === 'name' && info[i + 1] === GROUP_NAME) isTargetGroup = true;
              if (info[i] === 'lag') currentLag = info[i + 1] as number;
            }
            if (isTargetGroup) {
              lag = currentLag;
              break;
            }
          }
        }
      }
    } catch (_) {
      // Ignore xinfo errors
    }

    console.log(`Flush worker completed. Processed: ${totalProcessed}. Lag: ${lag}`);
    return NextResponse.json({ ok: true, processed: totalProcessed, lag });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  } finally {
    // Release lock if we still hold it
    const currentToken = await redis.get(LOCK_KEY);
    if (currentToken === lockToken) {
      await redis.del(LOCK_KEY);
    }
  }
}
