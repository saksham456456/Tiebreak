import { describe, it, expect } from 'vitest';
import { calculateVoteWeight } from '@/lib/ranking/weights';

describe('Vote weights', () => {
  it('handles fast decisions', () => {
    const fast = calculateVoteWeight({ decisionMs: 100, trustScore: 0.6, unfamiliar: false, rateLimited: false });
    const normal = calculateVoteWeight({ decisionMs: 500, trustScore: 0.6, unfamiliar: false, rateLimited: false });
    expect(fast).toBeLessThan(normal);
  });

  it('handles unfamiliar items', () => {
    const familiar = calculateVoteWeight({ decisionMs: 3000, trustScore: 0.6, unfamiliar: false, rateLimited: false });
    const unfamiliar = calculateVoteWeight({ decisionMs: 3000, trustScore: 0.6, unfamiliar: true, rateLimited: false });
    expect(unfamiliar).toBeLessThan(familiar);
  });

  it('handles rate-limited votes', () => {
    const normal = calculateVoteWeight({ decisionMs: 3000, trustScore: 0.6, unfamiliar: false, rateLimited: false });
    const limited = calculateVoteWeight({ decisionMs: 3000, trustScore: 0.6, unfamiliar: false, rateLimited: true });
    expect(limited).toBeLessThan(normal);
    expect(limited).toBe(0);
  });
});
