import { NextResponse } from 'next/server';
import { isRedisConfigured, getRedisClient } from '@/lib/redis/client';

export const dynamic = 'force-dynamic';
export const revalidate = 0;

export async function GET() {
  const timestamp = new Date().toISOString();
  const uptime = process.uptime();

  // Inspect Redis connectivity gracefully
  let redisStatus: 'connected' | 'unconfigured' | 'error' = 'unconfigured';
  if (isRedisConfigured()) {
    try {
      const client = getRedisClient();
      if (client) {
        await client.ping();
        redisStatus = 'connected';
      }
    } catch {
      redisStatus = 'error';
    }
  }

  // Inspect Supabase status gracefully
  const isSupabaseConfigured = Boolean(
    process.env.NEXT_PUBLIC_SUPABASE_URL &&
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY &&
    !process.env.NEXT_PUBLIC_SUPABASE_URL.includes('placeholder')
  );
  const supabaseStatus: 'configured' | 'unconfigured' = isSupabaseConfigured
    ? 'configured'
    : 'unconfigured';

  return NextResponse.json(
    {
      status: 'ok',
      timestamp,
      version: process.env.npm_package_version || '0.1.0',
      uptime: Math.round(uptime * 100) / 100,
      environment: process.env.NODE_ENV || 'development',
      services: {
        redis: redisStatus,
        supabase: supabaseStatus,
      },
    },
    { status: 200 }
  );
}
