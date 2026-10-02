import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ category: string }> }
) {
  const supabase = await createClient();
  try {
    const { category } = await params;
    const url = new URL(request.url);
    const limit = parseInt(url.searchParams.get('limit') || '10');

    const { data: catData } = await supabase
      .from('categories')
      .select('id, name')
      .eq('slug', category)
      .single();
    if (!catData) {
      return NextResponse.json({ error: 'Category not found' }, { status: 404 });
    }

    const { data: items } = await supabase
      .from('items')
      .select('id, name, slug, descriptor, display_score, win_count, loss_count')
      .eq('category_id', catData.id)
      .eq('status', 'active')
      .order('display_score', { ascending: false })
      .limit(Math.min(limit, 100));

    // Expose a sanitized, stable JSON schema for V1 API
    const formatted = items?.map((item, index) => ({
      rank: index + 1,
      id: item.id,
      name: item.name,
      slug: item.slug,
      description: item.descriptor,
      rating: Math.round(item.display_score),
      winRate:
        item.win_count + item.loss_count > 0
          ? item.win_count / (item.win_count + item.loss_count)
          : 0,
      totalMatches: item.win_count + item.loss_count,
    }));

    return NextResponse.json(
      {
        meta: {
          category: catData.name,
          slug: category,
          count: formatted?.length || 0,
          timestamp: new Date().toISOString(),
        },
        data: formatted || [],
      },
      {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Cache-Control': 'public, s-maxage=60, stale-while-revalidate=300',
        },
      }
    );
  } catch (err) {
    console.error(err);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}
