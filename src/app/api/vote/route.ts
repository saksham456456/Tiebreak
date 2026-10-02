import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { getAnonId, setAnonId, hashIp } from '@/lib/auth/anon';
import { limits } from '@/lib/abuse/limits';
import { redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { calculateVoteWeight } from '@/lib/ranking/weights';

const VoteSchema = z.object({
  itemA: z.string().uuid(),
  itemB: z.string().uuid(),
  outcome: z.enum(['a', 'b', 'skip']),
  decisionMs: z.coerce.number().min(0).max(60000),
  predicted: z.enum(['a', 'b']).optional(),
  unfamiliarA: z.boolean().default(false),
  unfamiliarB: z.boolean().default(false),
  source: z.enum(['arena', 'daily', 'challenge', 'embed', 'api']).default('arena'),
  turnstileToken: z.string().optional(),
  clientVoteId: z.string(),
  categoryId: z.string().uuid().optional(),
});

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const parsed = VoteSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: parsed.error }, { status: 400 });
    }

    const data = parsed.data;
    const ip = request.headers.get('x-forwarded-for') || '127.0.0.1';
    const ipHash = hashIp(ip);

    let anonId = await getAnonId();
    if (!anonId) {
      anonId = crypto.randomUUID();
      await setAnonId(anonId);
    }

    if (redis) {
      const idemKey = REDIS_KEYS.idempotency(data.clientVoteId);
      const isNew = await redis.setnx(idemKey, '1');
      if (!isNew) {
        return NextResponse.json({ ok: false, error: 'Duplicate vote' }, { status: 409 });
      }
      await redis.expire(idemKey, 600);
    }

    if (redis) {
      const rlAnon = await limits.voteAnon.limit(anonId);
      const rlIp = await limits.voteIp.limit(ipHash);
      if (!rlAnon.success || !rlIp.success) {
        return NextResponse.json({ ok: false, error: 'Rate limited' }, { status: 429 });
      }
    }

    const trustScore = 0.6;
    const weight = calculateVoteWeight({
      trustScore,
      unfamiliar: data.unfamiliarA || data.unfamiliarB,
      decisionMs: data.decisionMs,
      rateLimited: false,
    });

    const isSkip = data.outcome === 'skip';
    let aWins = 0;
    let bWins = 0;

    if (redis) {
      const event = {
        client_vote_id: data.clientVoteId,
        item_a: data.itemA,
        item_b: data.itemB,
        winner: data.outcome === 'a' ? data.itemA : data.outcome === 'b' ? data.itemB : null,
        outcome: data.outcome,
        category_id: data.categoryId || '00000000-0000-0000-0000-000000000000',
        anon_id: anonId,
        weight: weight,
        decision_ms: data.decisionMs,
        unfamiliar_a: data.unfamiliarA ? 'true' : 'false',
        unfamiliar_b: data.unfamiliarB ? 'true' : 'false',
        source: data.source,
        ip_hash: ipHash,
        created_at: new Date().toISOString(),
      };

      await redis.xadd(REDIS_KEYS.VOTES_STREAM, '*', event);

      const pairKey = REDIS_KEYS.pairStats(data.itemA, data.itemB);
      const [lo] = [data.itemA, data.itemB].sort();
      const outcomeField = isSkip
        ? 'skip'
        : data.outcome === 'a'
          ? data.itemA === lo
            ? 'lo_wins'
            : 'hi_wins'
          : data.itemB === lo
            ? 'lo_wins'
            : 'hi_wins';

      await redis.hincrby(pairKey, outcomeField, 1);

      const counts = await redis.hmget(pairKey, 'lo_wins', 'hi_wins');
      const loCount = counts ? parseInt((counts[0] as string) || '0') : 0;
      const hiCount = counts ? parseInt((counts[1] as string) || '0') : 0;

      aWins = data.itemA === lo ? loCount : hiCount;
      bWins = data.itemB === lo ? loCount : hiCount;

      await redis.hincrby(REDIS_KEYS.streak(anonId), 'current', 1);
      await redis.hincrby(REDIS_KEYS.xp(anonId), 'total', 1);
    }

    const total = aWins + bWins;
    const agreePct =
      total > 0 ? (data.outcome === 'a' ? (aWins / total) * 100 : (bWins / total) * 100) : 50;

    return NextResponse.json({
      ok: true,
      data: {
        agreePct: Math.round(agreePct),
        aWins,
        bWins,
        total,
        upset: false,
        streak: 1,
        xpGained: 1,
      },
    });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
