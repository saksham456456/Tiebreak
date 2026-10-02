import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';

const UndoSchema = z.object({
  clientVoteId: z.string(),
});

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const parsed = UndoSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    if (!redis) {
      return NextResponse.json({ ok: false, error: 'Redis unconfigured' }, { status: 500 });
    }

    const event = {
      client_vote_id: `undo_${parsed.data.clientVoteId}`,
      original_vote_id: parsed.data.clientVoteId,
      outcome: 'undo',
      weight: 0,
      created_at: new Date().toISOString(),
    };

    await redis.xadd(REDIS_KEYS.VOTES_STREAM, '*', event);

    return NextResponse.json({ ok: true, msg: 'Undo processed' });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
