import { describe, it, expect } from 'vitest';
import { calculateEloUpdate, calculateDisplayScore } from '@/lib/ranking/elo';

describe('Elo system', () => {
  it('increases winner rating and decreases loser rating', () => {
    const itemA = { rating: 1500, rd: 350 };
    const itemB = { rating: 1500, rd: 350 };
    
    const result = calculateEloUpdate(itemA, itemB, 1.0);
    expect(result.newA.rating).toBeGreaterThan(1500);
    expect(result.newB.rating).toBeLessThan(1500);
  });

  it('moves fresh items more than established ones', () => {
    const freshA = { rating: 1500, rd: 350 };
    const freshB = { rating: 1500, rd: 350 };
    const resultFresh = calculateEloUpdate(freshA, freshB, 1.0);
    
    const establishedA = { rating: 1500, rd: 50 };
    const establishedB = { rating: 1500, rd: 50 };
    const resultEst = calculateEloUpdate(establishedA, establishedB, 1.0);
    
    const freshDiff = resultFresh.newA.rating - 1500;
    const estDiff = resultEst.newA.rating - 1500;
    
    expect(freshDiff).toBeGreaterThan(estDiff);
  });

  it('calculates display score correctly based on Wilson bound', () => {
    const score = calculateDisplayScore(1500, 350);
    // 1500 - 2 * (350 / 2) = 1500 - 350 = 1150
    expect(score).toBe(1150);
  });
});
