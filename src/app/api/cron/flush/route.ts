import { NextResponse } from 'next/server';
import { redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { getServiceClient } from '@/lib/supabase/admin';
import { calculateEloUpdate } from '@/lib/ranking/elo';

const supabase = getServiceClient();

export async function GET(request: Request) {
  const authHeader = request.headers.get('authorization');
  if (!process.env.CRON_SECRET || authHeader !== `Bearer ${process.env.CRON_SECRET}`) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  if (!redis) return NextResponse.json({ error: 'Redis unconfigured' }, { status: 500 });

  const LOCK_KEY = 'lock:flush';
  const STREAM_KEY = REDIS_KEYS.VOTES_STREAM;
  const GROUP_NAME = 'flushers';
  const CONSUMER_NAME = 'worker-1';

  try {
    const locked = await redis.set(LOCK_KEY, '1', { nx: true, px: 55000 });
    if (!locked) {
      return NextResponse.json({ ok: false, msg: 'Lock held' });
    }

    try {
      // @ts-expect-error Redis types for streams vary slightly
      await redis.xgroup('CREATE', STREAM_KEY, GROUP_NAME, '0', { MKSTREAM: true });
    } catch (e: any) {
      if (!e.message.includes('BUSYGROUP')) {
        throw e;
      }
    }

    const result = (await redis.xreadgroup(GROUP_NAME, CONSUMER_NAME, STREAM_KEY, '>', {
      count: 5000,
    })) as any;

    if (!result || result.length === 0) {
      await redis.del(LOCK_KEY);
      return NextResponse.json({ ok: true, msg: 'No events' });
    }

    const stream = result[0];
    const messages = stream[1];

    if (messages.length === 0) {
      await redis.del(LOCK_KEY);
      return NextResponse.json({ ok: true, msg: 'No events' });
    }

    const itemIds = new Set<string>();
    const eventsToProcess = [];

    for (const msg of messages) {
      const id = msg[0] as string;
      const fields = msg[1] as string[];
      const obj: any = {};
      for (let i = 0; i < fields.length; i += 2) {
        obj[fields[i]] = fields[i + 1];
      }
      eventsToProcess.push({ streamId: id, ...obj });
      itemIds.add(obj.item_a);
      itemIds.add(obj.item_b);
    }

    const { data: currentItems, error } = await supabase
      .from('items')
      .select('id, rating, rd, vote_count, win_count, loss_count')
      .in('id', Array.from(itemIds));

    if (error) throw error;

    const itemMap = new Map<string, any>();
    currentItems.forEach((item) => itemMap.set(item.id, { ...item }));

    const votesToInsert = [];
    const pairDeltas = new Map<string, { lo_wins: number; hi_wins: number }>();

    for (const event of eventsToProcess) {
      if (event.outcome !== 'skip') {
        const itemA = itemMap.get(event.item_a);
        const itemB = itemMap.get(event.item_b);

        if (itemA && itemB) {
          const weight = parseFloat(event.weight || '1');

          let winner = itemA;
          let loser = itemB;
          let winnerId = event.item_a;

          if (event.outcome === 'b') {
            winner = itemB;
            loser = itemA;
            winnerId = event.item_b;
          }

          const { newA, newB } = calculateEloUpdate(winner, loser, weight);

          winner.rating = newA.rating;
          winner.rd = newA.rd;
          winner.vote_count += 1;
          winner.win_count += 1;

          loser.rating = newB.rating;
          loser.rd = newB.rd;
          loser.vote_count += 1;
          loser.loss_count += 1;

          const [lo, hi] = [event.item_a, event.item_b].sort();
          const pairKey = `${lo}:${hi}`;
          if (!pairDeltas.has(pairKey)) pairDeltas.set(pairKey, { lo_wins: 0, hi_wins: 0 });
          const delta = pairDeltas.get(pairKey)!;
          if (winnerId === lo) delta.lo_wins++;
          else delta.hi_wins++;
        }
      }

      votesToInsert.push({
        client_vote_id: event.client_vote_id,
        item_a: event.item_a,
        item_b: event.item_b,
        winner: event.winner || null,
        outcome: event.outcome,
        category_id: event.category_id,
        anon_id: event.anon_id || null,
        weight: parseFloat(event.weight || '1'),
        decision_ms: parseInt(event.decision_ms || '0'),
        unfamiliar_a: event.unfamiliar_a === 'true',
        unfamiliar_b: event.unfamiliar_b === 'true',
        source: event.source,
        ip_hash: event.ip_hash,
      });
    }

    const { error: insertError } = await supabase.from('votes').insert(votesToInsert);
    if (insertError && !insertError.message.includes('duplicate key value')) {
      throw insertError;
    }

    const itemsToUpdate = Array.from(itemMap.values()).map((item) => ({
      id: item.id,
      rating: item.rating,
      rd: item.rd,
      vote_count: item.vote_count,
      win_count: item.win_count,
      loss_count: item.loss_count,
      last_voted_at: new Date().toISOString(),
    }));
    await supabase.from('items').upsert(itemsToUpdate);

    const pairsToUpdate = Array.from(pairDeltas.entries()).map(([key, stats]) => {
      const [lo, hi] = key.split(':');
      return { item_lo: lo, item_hi: hi, lo_wins: stats.lo_wins, hi_wins: stats.hi_wins };
    });

    if (pairsToUpdate.length > 0) {
      await supabase.rpc('increment_pair_stats', { payloads: pairsToUpdate });
    }

    const streamIds = eventsToProcess.map((e) => e.streamId);
    if (streamIds.length > 0) {
      // @ts-expect-error Upstash typescript lacks full tuple support for spread arguments
      await redis.xack(STREAM_KEY, GROUP_NAME, ...streamIds);
    }

    await redis.del(LOCK_KEY);

    return NextResponse.json({ ok: true, processed: streamIds.length });
  } catch (err) {
    await redis.del(LOCK_KEY);
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
