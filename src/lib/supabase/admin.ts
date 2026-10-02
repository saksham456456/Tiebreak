import 'server-only';
import { createClient, type SupabaseClient } from '@supabase/supabase-js';

let adminClient: SupabaseClient | null = null;

/**
 * Creates an elevated Supabase admin client using the service role secret.
 * Bypasses Row Level Security (RLS).
 * Guarded with 'server-only' so Next.js build will fail if mistakenly imported on client.
 */
export function getSupabaseAdmin(): SupabaseClient {
  return getServiceClient();
}

export function getServiceClient(): SupabaseClient {
  if (!adminClient) {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

    if (!url || !serviceRoleKey) {
      if (process.env.NODE_ENV === 'production') {
        throw new Error('Supabase environment variables missing in production');
      }
    }

    adminClient = createClient(
      url || 'http://localhost:8000',
      serviceRoleKey || 'anon',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false,
        },
      }
    );
  }

  return adminClient;
}
