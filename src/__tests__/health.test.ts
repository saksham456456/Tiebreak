import { describe, it, expect } from 'vitest';
import { GET } from '@/app/api/health/route';

describe('GET /api/health Route Handler', () => {
  it('returns HTTP 200 with ok status and health telemetry', async () => {
    const response = await GET();
    expect(response.status).toBe(200);

    const body = await response.json();
    expect(body.status).toBe('ok');
    expect(typeof body.timestamp).toBe('string');
    expect(typeof body.uptime).toBe('number');
    expect(body.environment).toBeDefined();
    expect(body.version).toBeDefined();
    expect(body.services).toBeDefined();
    expect(['connected', 'unconfigured', 'error']).toContain(body.services.redis);
    expect(['configured', 'unconfigured']).toContain(body.services.supabase);
  });
});
