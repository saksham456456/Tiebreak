import { describe, it, expect, vi, beforeEach } from 'vitest';
vi.mock('server-only', () => ({}));
import { POST } from '@/app/api/vote/route';
import { NextRequest } from 'next/server';
import { signPairToken } from '@/lib/auth/pair-token';

// We mock some imports using vi.mock in a separate setup if needed.
vi.mock('next/headers', () => ({
  cookies: vi.fn(() => ({
    get: vi.fn().mockReturnValue(undefined),
    set: vi.fn()
  })),
  headers: vi.fn(() => new Map()),
}));

vi.mock('@/lib/auth/anon', () => ({
  getAnonId: vi.fn().mockResolvedValue('00000000-0000-0000-0000-000000000000'),
  hashIp: vi.fn().mockReturnValue('mocked-hash'),
  setAnonId: vi.fn(),
}));

vi.mock('@/lib/redis/client', () => ({
  isRedisConfigured: () => true,
  redis: {
    set: vi.fn().mockResolvedValue('OK'),
    get: vi.fn().mockResolvedValue('1'),
    xadd: vi.fn(),
    hincrby: vi.fn(),
    hmget: vi.fn().mockResolvedValue(['0', '0']),
    expire: vi.fn(),
  },
  getRedisClient: vi.fn()
}));

vi.mock('@/lib/abuse/limits', () => ({
  limits: {
    voteAnon: { limit: vi.fn().mockResolvedValue({ success: true }) },
    voteIp: { limit: vi.fn().mockResolvedValue({ success: true }) },
  }
}));

describe('Vote route', () => {
  beforeEach(() => {
    vi.clearAllMocks();
  });

  const validItemA = crypto.randomUUID();
  const validItemB = crypto.randomUUID();
  const catId = crypto.randomUUID();
  const anonId = crypto.randomUUID();
  const validToken = signPairToken(validItemA, validItemB, catId, anonId, Date.now() + 600000);

  it('rejects same item twice', async () => {
    const req = new NextRequest('http://localhost/api/vote', {
      method: 'POST',
      body: JSON.stringify({
        itemA: validItemA,
        itemB: validItemA,
        outcome: 'a',
        decisionMs: 1000,
        clientVoteId: crypto.randomUUID(),
        pairToken: validToken,
      })
    });
    const res = await POST(req);
    expect(res.status).toBe(400);
  });

  it('rejects bad pair token', async () => {
    const req = new NextRequest('http://localhost/api/vote', {
      method: 'POST',
      body: JSON.stringify({
        itemA: validItemA,
        itemB: validItemB,
        outcome: 'a',
        decisionMs: 1000,
        clientVoteId: crypto.randomUUID(),
        pairToken: 'bad.token.here',
      })
    });
    const res = await POST(req);
    expect(res.status).toBe(403);
  });
});
