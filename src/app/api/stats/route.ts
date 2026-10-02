import { NextResponse } from 'next/server';
import { redis } from '@/lib/redis/client';
import { createClient } from '@/lib/supabase/server';

export async function GET() {
  const supabase = await createClient();
  try {
    const [{ count: items }, { count: categories }, { count: totalVotes }] = await Promise.all([
      supabase.from('items').select('*', { count: 'exact', head: true }),
      supabase.from('categories').select('*', { count: 'exact', head: true }),
      supabase.from('votes').select('*', { count: 'exact', head: true }),
    ]);

    let activeNow = 0;
    if (redis) {
      const yyyymmddhh = new Date().toISOString().slice(0, 13).replace(/[-T]/g, '');
      activeNow = await redis.pfcount(`hll:active:${yyyymmddhh}`);
    }

    return NextResponse.json(
      {
        ok: true,
        data: {
          totalVotes: totalVotes || 0,
          votesToday: 0,
          items: items || 0,
          categories: categories || 0,
          activeNow,
        },
      },
      {
        headers: {
          'Cache-Control': 's-maxage=30, stale-while-revalidate',
        },
      }
    );
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
