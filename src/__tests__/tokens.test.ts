// @vitest-environment node
import { describe, it, expect } from 'vitest';
import { fontSpaceGrotesk, fontInter, fontJetBrainsMono } from '@/lib/fonts';
import { isRedisConfigured, getRedisClient, redis } from '@/lib/redis/client';
import { broadcastClientEvent } from '@/lib/supabase/realtime';

describe('Design Tokens & Base Client Architecture', () => {
  it('exports valid Next.js fonts with CSS variable bindings', () => {
    expect(fontSpaceGrotesk.variable).toBe('--font-space-grotesk');
    expect(fontInter.variable).toBe('--font-inter');
    expect(fontJetBrainsMono.variable).toBe('--font-jetbrains-mono');
  });

  it('handles Upstash Redis lazy access gracefully when unconfigured', async () => {
    expect(isRedisConfigured()).toBe(false);
    expect(getRedisClient()).toBeNull();

    // Lazy Proxy returns mock resolver in test environment rather than throwing
    const result = await redis.get('test-key');
    expect(result).toBeNull();
  });

  it('enforces User Constraint: Realtime broadcast throws if invoked on server', async () => {
    // In node/vitest server environment without browser window
    await expect(broadcastClientEvent('test-channel', 'vote', { id: 1 })).rejects.toThrow(
      /Violation of Next\.js Serverless & Realtime Rules/
    );
  });
});
