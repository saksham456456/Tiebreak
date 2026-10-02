import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { getAnonId, setAnonId, hashIp } from '@/lib/auth/anon';
import { limits } from '@/lib/abuse/limits';
import { isRedisConfigured, redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { calculateVoteWeight } from '@/lib/ranking/weights';
import { verifyPairToken } from '@/lib/auth/pair-token';

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
  pairToken: z.string(),
});

async function verifyTurnstile(token: string, ip: string) {
  const secret = process.env.TURNSTILE_SECRET_KEY;
  if (!secret) return process.env.NODE_ENV !== 'production';
  const res = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
    method: 'POST',
    body: `secret=${encodeURIComponent(secret)}&response=${encodeURIComponent(token)}&remoteip=${encodeURIComponent(ip)}`,
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
  });
  const data = await res.json();
  return data.success;
}

export async function POST(request: NextRequest) {
  try {
    if (!isRedisConfigured() && process.env.NODE_ENV === 'production') {
      return NextResponse.json({ ok: false, error: 'Service Unavailable' }, { status: 503 });
    }

    const body = await request.json();
    const parsed = VoteSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    const data = parsed.data;
    
    if (data.itemA === data.itemB) {
      return NextResponse.json({ ok: false, error: 'Invalid pair' }, { status: 400 });
    }

    const ip = (request.headers.get('x-forwarded-for') || '127.0.0.1').split(',')[0].trim();
    const ipHash = hashIp(ip);

    // 1. Verify identity
    let anonId = await getAnonId();
    if (!anonId) {
      anonId = crypto.randomUUID();
      await setAnonId(anonId);
    }

    // 2. Rate limit
    if (isRedisConfigured()) {
      const rlAnon = await limits.voteAnon.limit(anonId);
      const rlIp = await limits.voteIp.limit(ipHash);
      if (!rlAnon.success || !rlIp.success) {
        return NextResponse.json({ ok: false, error: 'Rate limited' }, { status: 429 });
      }
    }

    // 3. Token verification
    const { valid: isTokenValid, categoryId: tokenCategoryId } = verifyPairToken(
      data.pairToken,
      data.itemA,
      data.itemB,
      anonId
    );
    if (!isTokenValid || !tokenCategoryId) {
      return NextResponse.json({ ok: false, error: 'Invalid or expired pair token' }, { status: 403 });
    }
    const categoryId = tokenCategoryId;

    // Turnstile check
    if (isRedisConfigured()) {
      const votedKey = `session:${anonId}:voted`;
      const hasVoted = await redis.get(votedKey);
      
      // We will define high risk simply if they haven't voted yet (first vote).
      if (!hasVoted) {
        if (!data.turnstileToken) {
          if (process.env.NODE_ENV === 'production') {
            return NextResponse.json({ ok: false, error: 'Missing captcha' }, { status: 403 });
          }
        } else {
          const isValid = await verifyTurnstile(data.turnstileToken, ip);
          if (!isValid && process.env.NODE_ENV === 'production') {
            return NextResponse.json({ ok: false, error: 'Invalid captcha' }, { status: 403 });
          }
        }
        await redis.set(votedKey, '1', { ex: 60 * 60 * 24 });
      }
    }

    // 4. Idempotency (atomic)
    if (isRedisConfigured()) {
      const idemKey = REDIS_KEYS.idempotency(data.clientVoteId);
      const isNew = await redis.set(idemKey, '1', { nx: true, ex: 600 });
      if (!isNew) {
        return NextResponse.json({ ok: false, error: 'Duplicate vote' }, { status: 409 });
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
        category_id: categoryId,
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
      },
    });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
