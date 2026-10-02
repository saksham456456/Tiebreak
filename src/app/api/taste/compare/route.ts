import { NextRequest, NextResponse } from 'next/server';
import { z } from 'zod';
import { createClient } from '@supabase/supabase-js';

const CompareSchema = z.object({
  targetKey: z.string(), // e.g. "u:uuid" or "a:uuid"
  userKey: z.string(), // the signed in user
});

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';
const supabase = createClient(supabaseUrl, supabaseKey);

function computeCosineSimilarity(
  vecA: Record<string, number>,
  vecB: Record<string, number>
): number {
  let dotProduct = 0;
  let normA = 0;
  let normB = 0;

  const allKeys = new Set([...Object.keys(vecA), ...Object.keys(vecB)]);

  for (const key of allKeys) {
    const a = vecA[key] || 0;
    const b = vecB[key] || 0;
    dotProduct += a * b;
    normA += a * a;
    normB += b * b;
  }

  if (normA === 0 || normB === 0) return 0;
  return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
}

export async function POST(request: NextRequest) {
  const start = performance.now();
  try {
    const body = await request.json();
    const parsed = CompareSchema.safeParse(body);

    if (!parsed.success) {
      return NextResponse.json({ ok: false, error: 'Invalid parameters' }, { status: 400 });
    }

    const { targetKey, userKey } = parsed.data;

    // Fetch both taste profiles from Postgres
    const { data, error } = await supabase
      .from('taste_profiles')
      .select('owner_key, vector')
      .in('owner_key', [targetKey, userKey]);

    if (error) throw error;

    if (!data || data.length < 2) {
      return NextResponse.json({ ok: false, error: 'Profiles not found' }, { status: 404 });
    }

    const profileA = data.find((d) => d.owner_key === targetKey);
    const profileB = data.find((d) => d.owner_key === userKey);

    if (!profileA || !profileB) {
      return NextResponse.json({ ok: false, error: 'Profiles missing' }, { status: 404 });
    }

    // In production, vector is stored as JSONB
    const vecA =
      typeof profileA.vector === 'string' ? JSON.parse(profileA.vector) : profileA.vector;
    const vecB =
      typeof profileB.vector === 'string' ? JSON.parse(profileB.vector) : profileB.vector;

    // Calculate similarity (-1 to 1) -> normalized to (0 to 100%)
    const rawSim = computeCosineSimilarity(vecA, vecB);
    const matchPct = Math.round(((rawSim + 1) / 2) * 100);

    const duration = performance.now() - start;

    return NextResponse.json({
      ok: true,
      data: {
        matchPct,
        durationMs: Math.round(duration),
      },
    });
  } catch (err) {
    console.error(err);
    return NextResponse.json({ ok: false, error: 'Internal error' }, { status: 500 });
  }
}
