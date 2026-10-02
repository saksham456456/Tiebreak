import { describe, it, expect, vi } from 'vitest';
vi.mock('server-only', () => ({}));
import { GET } from '@/app/api/cron/flush/route';

describe('Flush worker', () => {
  it('returns 401 if CRON_SECRET is missing or wrong', async () => {
    // Missing auth header
    const req1 = new Request('http://localhost/api/cron/flush');
    const res1 = await GET(req1);
    expect(res1.status).toBe(401);

    // Wrong auth header
    const req2 = new Request('http://localhost/api/cron/flush', {
      headers: { authorization: 'Bearer wrong-secret' }
    });
    const res2 = await GET(req2);
    expect(res2.status).toBe(401);
  });
});
