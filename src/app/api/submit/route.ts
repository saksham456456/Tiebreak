import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { getServiceClient } from '@/lib/supabase/admin';
import { getAnonId } from '@/lib/auth/anon';
import { limits } from '@/lib/abuse/limits';

const SubmitSchema = z.object({
  name: z.string().min(1).max(50),
  descriptor: z.string().min(1).max(100),
  categoryId: z.string().uuid(),
});

function cleanText(text: string) {
  return text
    .normalize('NFKC')
    .replace(/<[^>]*>/g, '') // strip HTML
    .replace(/https?:\/\/[^\s]+/g, '') // strip URLs
    .trim();
}

export async function POST(request: NextRequest) {
  try {
    const supabase = getServiceClient();
    const anonId = await getAnonId();
    if (!anonId) {
      return NextResponse.json({ ok: false, error: 'Unauthorized' }, { status: 401 });
    }

    const rlRes = await limits.submissions.limit(anonId);
    if (!rlRes.success) {
      return NextResponse.json({ ok: false, error: 'Rate limited' }, { status: 429 });
    }

    const body = await request.json();
    const parsed = SubmitSchema.safeParse(body);
    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    const name = cleanText(parsed.data.name);
    const descriptor = cleanText(parsed.data.descriptor);
    const categoryId = parsed.data.categoryId;

    if (!name || !descriptor) {
      return NextResponse.json({ ok: false, error: 'Empty text after cleaning' }, { status: 400 });
    }

    // Verify category exists
    const { data: catData, error: catError } = await supabase.from('categories').select('id').eq('id', categoryId).single();
    if (catError || !catData) {
      return NextResponse.json({ ok: false, error: 'Category not found' }, { status: 404 });
    }

    // Create a slug
    let baseSlug = name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '');
      
    if (!baseSlug) baseSlug = 'item';

    let slug = baseSlug;
    let attempts = 0;
    
    while (attempts < 10) {
      const { error } = await supabase.from('items').insert({
        category_id: categoryId,
        name,
        slug,
        descriptor,
        status: 'pending',
        image_url: null,
        submitted_by_anon: anonId,
      });

      if (!error) {
        return NextResponse.json({ ok: true });
      }

      if (error.code === '23505') {
        attempts++;
        slug = `${baseSlug}-${attempts + 1}`;
      } else {
        throw error;
      }
    }

    return NextResponse.json({ ok: false, error: 'Failed to generate unique slug' }, { status: 409 });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
