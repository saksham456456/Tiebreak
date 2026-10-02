import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { createClient } from '@supabase/supabase-js';
import { getAnonId } from '@/lib/auth/anon';
import { limits } from '@/lib/abuse/limits';

const SubmitSchema = z.object({
  name: z.string().min(1).max(50),
  descriptor: z.string().min(1).max(100),
  categoryId: z.string().uuid(),
});

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';
const supabase = createClient(supabaseUrl, supabaseKey);

export async function POST(request: NextRequest) {
  try {
    const anonId = await getAnonId();
    if (!anonId) {
      return NextResponse.json({ ok: false, error: 'Unauthorized' }, { status: 401 });
    }

    const rlRes = await limits.voteAnon.limit(anonId); // Reuse anon limits or create specific submit limits
    if (!rlRes.success) {
      return NextResponse.json({ ok: false, error: 'Rate limited' }, { status: 429 });
    }

    const body = await request.json();
    const parsed = SubmitSchema.safeParse(body);
    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    const { name, descriptor, categoryId } = parsed.data;

    // Create a slug
    const slug = name
      .toLowerCase()
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/(^-|-$)/g, '');

    // Insert as pending
    const { error } = await supabase.from('items').insert({
      category_id: categoryId,
      name,
      slug,
      descriptor,
      status: 'pending',
      image_url: 'https://via.placeholder.com/400x400.png?text=' + encodeURIComponent(name),
      metadata: { submitted_by: anonId },
    });

    if (error) {
      if (error.code === '23505') {
        // Unique violation
        return NextResponse.json({ ok: false, error: 'Item already exists' }, { status: 409 });
      }
      throw error;
    }

    return NextResponse.json({ ok: true });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
