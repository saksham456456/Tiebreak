'use client';

import { getSupabaseBrowser } from './client';

export interface RealtimeBroadcastPayload<T = unknown> {
  channel: string;
  event: string;
  payload: T;
}

/**
 * Client-Side Realtime Broadcast Helper
 *
 * User Constraint Rule:
 * NEVER attempt to broadcast to Supabase WebSockets (channel.send()) from inside
 * a Next.js serverless API route or edge function. The environment will terminate
 * the execution before the socket establishes. Instead, return the payload in the
 * API response and let the client browser handle the broadcast via getSupabaseBrowser().
 */
export async function broadcastClientEvent<T>(
  channelName: string,
  event: string,
  payload: T
): Promise<void> {
  if (typeof window === 'undefined') {
    throw new Error(
      'Violation of Next.js Serverless & Realtime Rules: Cannot broadcast to WebSockets from serverless/edge environments. Broadcasts must only be executed client-side via getSupabaseBrowser().'
    );
  }

  const supabase = getSupabaseBrowser();
  const channel = supabase.channel(channelName);

  await channel.subscribe();
  await channel.send({
    type: 'broadcast',
    event,
    payload,
  });
}

/**
 * Helper to subscribe to a matchup realtime channel in React components
 */
export function subscribeToChannel<T>(
  channelName: string,
  event: string,
  callback: (payload: T) => void
) {
  if (typeof window === 'undefined') {
    throw new Error('Realtime subscriptions can only be established in client environments.');
  }

  const supabase = getSupabaseBrowser();
  const channel = supabase.channel(channelName);

  channel
    .on('broadcast', { event }, (response) => {
      callback(response.payload as T);
    })
    .subscribe();

  return () => {
    supabase.removeChannel(channel);
  };
}
