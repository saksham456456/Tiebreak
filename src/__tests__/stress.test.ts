import { describe, it, expect } from 'vitest';
import { GET, dynamic, revalidate } from '@/app/api/health/route';
import { llmNumber, llmString, llmArray, llmMatchupAnalysisSchema } from '@/lib/validations/llm';
import { isRedisConfigured, getRedisClient, redis } from '@/lib/redis/client';
import { broadcastClientEvent, subscribeToChannel } from '@/lib/supabase/realtime';

// =============================================================================
// 1. /api/health ROUTE HANDLER STRESS & BOUNDARY TESTS
// =============================================================================
describe('Empirical Challenge: /api/health Route Handler', () => {
  it('strictly defines Next.js route caching directives', () => {
    expect(dynamic).toBe('force-dynamic');
    expect(revalidate).toBe(0);
  });

  it('returns HTTP 200 with valid ISO timestamp, positive uptime, and unconfigured telemetry by default', async () => {
    const res = await GET();
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.status).toBe('ok');

    // ISO 8601 validation
    const date = new Date(data.timestamp);
    expect(Number.isNaN(date.getTime())).toBe(false);
    expect(data.timestamp).toMatch(/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}/);

    // Freshness validation (within 30 seconds)
    expect(Math.abs(Date.now() - date.getTime())).toBeLessThan(30000);

    // Telemetry validation
    expect(typeof data.uptime).toBe('number');
    expect(data.uptime).toBeGreaterThanOrEqual(0);
    expect(data.environment).toBeDefined();
    expect(data.version).toBeDefined();

    // In clean test env without keys:
    expect(data.services.redis).toBe('unconfigured');
    expect(data.services.supabase).toBe('unconfigured');
  });

  it('handles simulated Redis outage gracefully without crashing route or 500 error', async () => {
    const origUrl = process.env.UPSTASH_REDIS_REST_URL;
    const origToken = process.env.UPSTASH_REDIS_REST_TOKEN;

    try {
      // Set to an immediately refusing local endpoint to test catch block in GET()
      process.env.UPSTASH_REDIS_REST_URL = 'http://127.0.0.1:59999';
      process.env.UPSTASH_REDIS_REST_TOKEN = 'mock-test-token';

      const res = await GET();
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(data.status).toBe('ok');
      expect(data.services.redis).toBe('error');
    } finally {
      if (origUrl) process.env.UPSTASH_REDIS_REST_URL = origUrl;
      else delete process.env.UPSTASH_REDIS_REST_URL;
      if (origToken) process.env.UPSTASH_REDIS_REST_TOKEN = origToken;
      else delete process.env.UPSTASH_REDIS_REST_TOKEN;
    }
  }, 10000);

  it('correctly discriminates between placeholder and valid Supabase credentials', async () => {
    const origUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const origKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

    try {
      // Placeholder test
      process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://placeholder.supabase.co';
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'placeholder-key';
      let res = await GET();
      let data = await res.json();
      expect(data.services.supabase).toBe('unconfigured');

      // Valid test
      process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://valid-project.supabase.co';
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'valid-anon-key';
      res = await GET();
      data = await res.json();
      expect(data.services.supabase).toBe('configured');
    } finally {
      if (origUrl) process.env.NEXT_PUBLIC_SUPABASE_URL = origUrl;
      else delete process.env.NEXT_PUBLIC_SUPABASE_URL;
      if (origKey) process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = origKey;
      else delete process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
    }
  });
});

// =============================================================================
// 2. LLM VALIDATION RULES: ZOD COERCION & DEFAULTS STRESS TESTS
// =============================================================================
describe('Empirical Challenge: LLM Validation Rules (z.coerce.number() & Defaults)', () => {
  const numberSchema = llmNumber();
  const stringSchema = llmString();
  const arraySchema = llmArray(llmString());

  describe('llmNumber() Coercion Boundaries', () => {
    it('coerces standard and non-standard numeric string representations', () => {
      expect(numberSchema.parse('42')).toBe(42);
      expect(numberSchema.parse('-99')).toBe(-99);
      expect(numberSchema.parse('1520.45')).toBe(1520.45);
      expect(numberSchema.parse('0')).toBe(0);
      expect(numberSchema.parse('-0')).toBe(-0);
      expect(numberSchema.parse('.75')).toBe(0.75);
      expect(numberSchema.parse('100.')).toBe(100);
      expect(numberSchema.parse('1e3')).toBe(1000);
      expect(numberSchema.parse('2.5e-3')).toBe(0.0025);
    });

    it('coerces strings with surrounding whitespace or tabs/newlines', () => {
      expect(numberSchema.parse('  42  ')).toBe(42);
      expect(numberSchema.parse('\t100\n')).toBe(100);
    });

    it('empirically audits JavaScript Number() coercion quirks', () => {
      // JS Number("") is 0, Number(null) is 0, Number(true) is 1, Number(false) is 0
      expect(numberSchema.parse('')).toBe(0);
      expect(numberSchema.parse('   ')).toBe(0);
      expect(numberSchema.parse(null)).toBe(0);
      expect(numberSchema.parse(false)).toBe(0);
      expect(numberSchema.parse(true)).toBe(1);
    });

    it('strictly throws ZodError on non-coercible inputs', () => {
      expect(() => numberSchema.parse('abc')).toThrow();
      expect(() => numberSchema.parse('42px')).toThrow();
      expect(() => numberSchema.parse('1.2.3.4')).toThrow();
      expect(() => numberSchema.parse('NaN')).toThrow();
      expect(() => numberSchema.parse('undefined')).toThrow();
      expect(() => numberSchema.parse({})).toThrow();
      expect(() => numberSchema.parse({ value: 10 })).toThrow();
      expect(() => numberSchema.parse([1, 2])).toThrow();
      expect(() => numberSchema.parse(undefined)).toThrow();
    });
  });

  describe('llmString() and llmArray() Defaults Boundaries', () => {
    it('supplies defaults on undefined and missing keys', () => {
      expect(stringSchema.parse(undefined)).toBe('');
      expect(arraySchema.parse(undefined)).toEqual([]);
    });

    it('preserves valid user-provided empty or populated values', () => {
      expect(stringSchema.parse('')).toBe('');
      expect(stringSchema.parse('Tiebreak Champion')).toBe('Tiebreak Champion');
      expect(arraySchema.parse([])).toEqual([]);
      expect(arraySchema.parse(['grand-slam', 'atp'])).toEqual(['grand-slam', 'atp']);
    });

    it('audits null behavior: throws ZodError for null because Zod .default() triggers only on undefined', () => {
      // In Zod contract: default values apply when value is undefined, not null
      expect(() => stringSchema.parse(null)).toThrow();
      expect(() => arraySchema.parse(null)).toThrow();
    });
  });

  describe('llmMatchupAnalysisSchema Complex Payload Fuzzing', () => {
    it('fails when required numeric fields are omitted', () => {
      // confidenceScore is required and has no default
      expect(() => llmMatchupAnalysisSchema.parse({})).toThrow();
    });

    it('succeeds on minimal payload where LLM returns only confidenceScore as a string', () => {
      const parsed = llmMatchupAnalysisSchema.parse({
        confidenceScore: '94.5',
      });
      expect(parsed.confidenceScore).toBe(94.5);
      expect(parsed.summary).toBe('');
      expect(parsed.tags).toEqual([]);
      expect(parsed.keyDifferentiators).toEqual([]);
    });

    it('handles deep adversarial payloads with mixed numeric string formats', () => {
      const payload = {
        summary: 'Deep analysis test',
        confidenceScore: '1e2', // 100
        tags: ['wimbledon', 'grass'],
        keyDifferentiators: [
          { attribute: 'First Serve %', scoreAdvantage: '  12.5  ' },
          { attribute: 'Break Points Saved', scoreAdvantage: '-3.2' },
          { attribute: 'Unforced Errors', scoreAdvantage: '0' },
        ],
      };

      const parsed = llmMatchupAnalysisSchema.parse(payload);
      expect(parsed.confidenceScore).toBe(100);
      expect(parsed.keyDifferentiators[0].scoreAdvantage).toBe(12.5);
      expect(parsed.keyDifferentiators[1].scoreAdvantage).toBe(-3.2);
      expect(parsed.keyDifferentiators[2].scoreAdvantage).toBe(0);
    });
  });
});

// =============================================================================
// 3. UPSTASH REDIS LAZY PROXY STRESS TESTS
// =============================================================================
describe('Empirical Challenge: Upstash Redis Lazy Client Proxy', () => {
  it('correctly reports unconfigured state when environment variables are omitted', () => {
    const origUrl = process.env.UPSTASH_REDIS_REST_URL;
    const origToken = process.env.UPSTASH_REDIS_REST_TOKEN;

    try {
      delete process.env.UPSTASH_REDIS_REST_URL;
      delete process.env.UPSTASH_REDIS_REST_TOKEN;

      expect(isRedisConfigured()).toBe(false);
      expect(getRedisClient()).toBeNull();
    } finally {
      if (origUrl) process.env.UPSTASH_REDIS_REST_URL = origUrl;
      else delete process.env.UPSTASH_REDIS_REST_URL;
      if (origToken) process.env.UPSTASH_REDIS_REST_TOKEN = origToken;
      else delete process.env.UPSTASH_REDIS_REST_TOKEN;
    }
  });

  it('returns resolving mock nulls for arbitrary methods in non-production', async () => {
    const origUrl = process.env.UPSTASH_REDIS_REST_URL;
    const origToken = process.env.UPSTASH_REDIS_REST_TOKEN;
    const origEnv = process.env.NODE_ENV;

    try {
      delete process.env.UPSTASH_REDIS_REST_URL;
      delete process.env.UPSTASH_REDIS_REST_TOKEN;
      (process.env as Record<string, string | undefined>).NODE_ENV = 'test';

      expect(await redis.get('arbitrary-key')).toBeNull();
      expect(await redis.set('arbitrary-key', 'value')).toBeNull();
      expect(await redis.del('arbitrary-key')).toBeNull();
      expect(await redis.ping()).toBeNull();
      expect(
        await (redis as unknown as Record<string, () => Promise<unknown>>).unknownMethod()
      ).toBeNull();
    } finally {
      if (origUrl) process.env.UPSTASH_REDIS_REST_URL = origUrl;
      else delete process.env.UPSTASH_REDIS_REST_URL;
      if (origToken) process.env.UPSTASH_REDIS_REST_TOKEN = origToken;
      else delete process.env.UPSTASH_REDIS_REST_TOKEN;
      (process.env as Record<string, string | undefined>).NODE_ENV = origEnv;
    }
  });

  it('throws descriptive error in production environment when unconfigured', async () => {
    const origUrl = process.env.UPSTASH_REDIS_REST_URL;
    const origToken = process.env.UPSTASH_REDIS_REST_TOKEN;
    const origEnv = process.env.NODE_ENV;

    try {
      delete process.env.UPSTASH_REDIS_REST_URL;
      delete process.env.UPSTASH_REDIS_REST_TOKEN;
      (process.env as Record<string, string | undefined>).NODE_ENV = 'production';

      expect(() => redis.get('test')).toThrowError(
        /Upstash Redis is unconfigured\. Set UPSTASH_REDIS_REST_URL and UPSTASH_REDIS_REST_TOKEN\./
      );
    } finally {
      if (origUrl) process.env.UPSTASH_REDIS_REST_URL = origUrl;
      else delete process.env.UPSTASH_REDIS_REST_URL;
      if (origToken) process.env.UPSTASH_REDIS_REST_TOKEN = origToken;
      else delete process.env.UPSTASH_REDIS_REST_TOKEN;
      (process.env as Record<string, string | undefined>).NODE_ENV = origEnv;
    }
  });
});

// =============================================================================
// 4. USER CONSTRAINT: SERVERLESS REALTIME WEBSOCKETS ENFORCEMENT
// =============================================================================
describe('Empirical Challenge: Realtime WebSockets User Constraint', () => {
  it('strictly throws when broadcastClientEvent is called server-side', async () => {
    const originalWindow = globalThis.window;
    try {
      // Simulate server-side runtime where window is undefined
      // @ts-expect-error simulating Node server environment
      delete globalThis.window;
      await expect(broadcastClientEvent('channel', 'event', {})).rejects.toThrow(
        /Violation of Next\.js Serverless & Realtime Rules/
      );
    } finally {
      globalThis.window = originalWindow;
    }
  });

  it('strictly throws when subscribeToChannel is called server-side', () => {
    const originalWindow = globalThis.window;
    try {
      // Simulate server-side runtime where window is undefined
      // @ts-expect-error simulating Node server environment
      delete globalThis.window;
      expect(() => subscribeToChannel('channel', 'event', () => {})).toThrow(
        /Realtime subscriptions can only be established in client environments/
      );
    } finally {
      globalThis.window = originalWindow;
    }
  });
});
