import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { getAnonId, setAnonId } from '@/lib/auth/anon';
import { limits } from '@/lib/abuse/limits';
import { redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { createClient } from '@/lib/supabase/server';

const PairQuerySchema = z.object({
  category: z.string(),
  count: z.coerce.number().default(20),
  locale: z.string().default('en'),
});

export async function GET(request: NextRequest) {
  const supabase = await createClient();
  try {
    const url = new URL(request.url);
    const parsed = PairQuerySchema.safeParse({
      category: url.searchParams.get('category'),
      count: url.searchParams.get('count'),
      locale: url.searchParams.get('locale'),
    });

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    const { category, count, locale: _locale } = parsed.data;

    let anonId = await getAnonId();
    if (!anonId) {
      anonId = crypto.randomUUID();
      await setAnonId(anonId);
    }

    if (redis) {
      const rlRes = await limits.pairs.limit(anonId);
      if (!rlRes.success) {
        return NextResponse.json(
          { ok: false, error: 'Rate limited' },
          {
            status: 429,
            headers: { 'Retry-After': rlRes.reset.toString() },
          }
        );
      }
    }

    const { data: categoryData } = await supabase
      .from('categories')
      .select('id')
      .eq('slug', category)
      .single();

    if (!categoryData) {
      return NextResponse.json({ ok: false, error: 'Category not found' }, { status: 404 });
    }

    const { data: items } = await supabase
      .from('items')
      .select('id, name, descriptor, image_url')
      .eq('category_id', categoryData.id)
      .eq('status', 'active')
      .limit(count * 2);

    if (!items || items.length < 2) {
      return NextResponse.json({ ok: false, error: 'Not enough items' }, { status: 400 });
    }

    const shuffled = items.sort(() => 0.5 - Math.random());
    const pairs = [];

    const seenSetKey = REDIS_KEYS.seenSet(anonId);
    const seenPairs = redis ? await redis.smembers(seenSetKey) : [];
    const seenSet = new Set(seenPairs);

    for (let i = 0; i < shuffled.length - 1; i += 2) {
      if (pairs.length >= count) break;
      const a = shuffled[i];
      const b = shuffled[i + 1];
      const pairId = REDIS_KEYS.pairStats(a.id, b.id);

      if (!seenSet.has(pairId)) {
        pairs.push({
          pairId,
          a,
          b,
          hot: false,
        });
        if (redis) {
          await redis.sadd(seenSetKey, pairId);
        }
      }
    }

    if (redis) {
      await redis.expire(seenSetKey, 60 * 60 * 24 * 7);
    }

    return NextResponse.json({ ok: true, data: pairs });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
