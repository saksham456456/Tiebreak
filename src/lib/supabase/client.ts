import { createBrowserClient } from '@supabase/ssr';
import type { SupabaseClient } from '@supabase/supabase-js';

let browserClient: SupabaseClient | null = null;

/**
 * Returns a singleton Supabase client for browser contexts.
 * Used for authentication state, client-side queries, and Realtime WebSockets broadcasting.
 */
export function getSupabaseBrowser(): SupabaseClient {
  if (typeof window === 'undefined') {
    throw new Error('getSupabaseBrowser must only be invoked in browser environments.');
  }

  if (!browserClient) {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://placeholder.supabase.co';
    const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'placeholder-anon-key';
    browserClient = createBrowserClient(url, anonKey);
  }

  return browserClient;
}
