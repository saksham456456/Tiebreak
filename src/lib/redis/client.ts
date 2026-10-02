import { Redis } from '@upstash/redis';

let redisClient: Redis | null = null;

export function isRedisConfigured(): boolean {
  return Boolean(
    process.env.UPSTASH_REDIS_REST_URL &&
    process.env.UPSTASH_REDIS_REST_TOKEN &&
    !process.env.UPSTASH_REDIS_REST_URL.includes('placeholder')
  );
}

export function getRedisClient(): Redis | null {
  if (!isRedisConfigured()) {
    return null;
  }
  if (!redisClient) {
    redisClient = new Redis({
      url: process.env.UPSTASH_REDIS_REST_URL!,
      token: process.env.UPSTASH_REDIS_REST_TOKEN!,
    });
  }
  return redisClient;
}

/**
 * Proxy export for redis that prevents build-time evaluation crashes.
 * In development/test without credentials, operations gracefully return null or mock responses.
 * In production without credentials, accessing operations throws a descriptive error.
 */
export const redis: Redis = new Proxy({} as Redis, {
  get(_target, prop: string | symbol) {
    const client = getRedisClient();
    if (!client) {
      if (process.env.NODE_ENV !== 'production') {
        // Return a mock async resolver in dev/test to avoid crashing tests or mock pages
        return async () => null;
      }
      throw new Error(
        'Upstash Redis is unconfigured. Set UPSTASH_REDIS_REST_URL and UPSTASH_REDIS_REST_TOKEN.'
      );
    }
    const val = (client as unknown as Record<string | symbol, unknown>)[prop];
    return typeof val === 'function' ? val.bind(client) : val;
  },
});
