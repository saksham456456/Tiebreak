import { describe, it, expect, vi } from 'vitest';
vi.mock('server-only', () => ({}));
import { GET } from '@/app/auth/callback/route';

describe('Auth callback route', () => {
  it('redirects to profile by default', async () => {
    const req = new Request('http://localhost/auth/callback');
    const res = await GET(req);
    expect(res.status).toBe(307);
    expect(res.headers.get('location')).toContain('/auth-code-error');
  });

  it('rejects next values with path traversal', async () => {
    const req = new Request('http://localhost/auth/callback?next=//malicious.com');
    const res = await GET(req);
    expect(res.headers.get('location')).toContain('/auth-code-error');
  });
});
