import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { isRedisConfigured, redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';

const UndoSchema = z.object({
  clientVoteId: z.string(),
  itemA: z.string().uuid(),
  itemB: z.string().uuid(),
  outcome: z.enum(['a', 'b', 'skip']),
});

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const parsed = UndoSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    if (!isRedisConfigured()) {
      return NextResponse.json({ ok: false, error: 'Redis unconfigured' }, { status: 500 });
    }

    const idemKey = REDIS_KEYS.idempotency(parsed.data.clientVoteId);
    const voteTimeStr = (await redis.get(idemKey)) as string | null;
    if (!voteTimeStr || typeof voteTimeStr !== 'string') {
      return NextResponse.json({ ok: false, error: 'Vote not found or window passed' }, { status: 400 });
    }

    const voteTime = parseInt(voteTimeStr, 10);
    if (Date.now() - voteTime > 10000) {
      return NextResponse.json({ ok: false, error: 'Undo window of 10 seconds has passed' }, { status: 400 });
    }

    // Set undo key
    const undoKey = `undo:${parsed.data.clientVoteId}`;
    await redis.set(undoKey, '1', { ex: 120 });

    const isSkip = parsed.data.outcome === 'skip';
    if (!isSkip) {
      const pairKey = REDIS_KEYS.pairStats(parsed.data.itemA, parsed.data.itemB);
      const [lo] = [parsed.data.itemA, parsed.data.itemB].sort();
      const outcomeField = parsed.data.outcome === 'a'
        ? (parsed.data.itemA === lo ? 'lo_wins' : 'hi_wins')
        : (parsed.data.itemB === lo ? 'lo_wins' : 'hi_wins');
        
      await redis.hincrby(pairKey, outcomeField, -1);
    } else {
      const pairKey = REDIS_KEYS.pairStats(parsed.data.itemA, parsed.data.itemB);
      await redis.hincrby(pairKey, 'skip', -1);
    }

    return NextResponse.json({ ok: true, msg: 'Undo processed' });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
