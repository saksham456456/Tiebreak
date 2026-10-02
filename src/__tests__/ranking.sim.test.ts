import { describe, it, expect, beforeAll, afterAll } from 'vitest';
import { calculateEloUpdate, calculateDisplayScore } from '@/lib/ranking/elo';
import { pickWeightedByRD, getItemsWithinRating, PoolItem } from '@/lib/ranking/pairs';

// Simple Linear Congruential Generator for seeded randomness
class PRNG {
  private seed: number;
  constructor(seed: number) {
    this.seed = seed;
  }
  next() {
    this.seed = (this.seed * 1664525 + 1013904223) % 4294967296;
    return this.seed / 4294967296;
  }
}

function kendallTau(arr1: number[], arr2: number[]) {
  if (arr1.length !== arr2.length || arr1.length <= 1) return 0;
  let concordant = 0;
  let discordant = 0;
  const n = arr1.length;
  for (let i = 0; i < n - 1; i++) {
    for (let j = i + 1; j < n; j++) {
      const dir1 = Math.sign(arr1[i] - arr1[j]);
      const dir2 = Math.sign(arr2[i] - arr2[j]);
      if (dir1 === 0 || dir2 === 0) continue;
      if (dir1 === dir2) concordant++;
      else discordant++;
    }
  }
  return (concordant - discordant) / ((n * (n - 1)) / 2);
}

interface SimItem extends PoolItem {
  trueStrength: number;
}

function runSimulation(seed: number) {
  const NUM_ITEMS = 200;
  const NUM_VOTES = 50000;
  const rng = new PRNG(seed);

  const items: SimItem[] = Array.from({ length: NUM_ITEMS }, (_, i) => ({
    id: String(i),
    trueStrength: 1000 + rng.next() * 1000,
    rating: 1500,
    rd: 350,
    vote_count: 0
  }));

  for (let i = 0; i < NUM_VOTES; i++) {
    // Pick A using weighted RD
    const itemA = pickWeightedByRD(items) as SimItem;
    if (!itemA) continue;
    
    // Pick B within rating tolerance
    let candidates = getItemsWithinRating(items, itemA, 250); // Need to tune tolerance maybe?
    if (candidates.length === 0) {
      // Fallback
      let idxB = Math.floor(rng.next() * NUM_ITEMS);
      while (items[idxB].id === itemA.id) {
        idxB = Math.floor(rng.next() * NUM_ITEMS);
      }
      candidates = [items[idxB]];
    }
    
    // Pick random from candidates
    const itemB = candidates[Math.floor(rng.next() * candidates.length)] as SimItem;

    // Win probability based on true strength
    const probA = 1 / (1 + Math.pow(10, (itemB.trueStrength - itemA.trueStrength) / 400));
    const aWins = rng.next() < probA;

    const winner = aWins ? itemA : itemB;
    const loser = aWins ? itemB : itemA;

    const result = calculateEloUpdate(winner, loser, 1.0);

    winner.rating = result.newA.rating;
    winner.rd = result.newA.rd;
    winner.vote_count++;
    
    loser.rating = result.newB.rating;
    loser.rd = result.newB.rd;
    loser.vote_count++;
  }

  const finalItems = items.map((i) => ({
    ...i,
    displayScore: calculateDisplayScore(i.rating, i.rd),
  }));

  const trueOrder = [...finalItems].sort((a, b) => b.trueStrength - a.trueStrength).map((i) => parseInt(i.id));
  const estimatedOrder = [...finalItems].sort((a, b) => b.displayScore - a.displayScore).map((i) => parseInt(i.id));

  const rankByTrue = new Array(NUM_ITEMS).fill(0);
  const rankByEst = new Array(NUM_ITEMS).fill(0);

  for (let i = 0; i < NUM_ITEMS; i++) {
    rankByTrue[trueOrder[i]] = i;
    rankByEst[estimatedOrder[i]] = i;
  }

  return kendallTau(rankByTrue, rankByEst);
}

describe('Ranking Simulation', () => {
  let oldRandom: () => number;
  let currentRng: PRNG | null = null;

  beforeAll(() => {
    oldRandom = Math.random;
    Math.random = () => currentRng ? currentRng.next() : oldRandom();
  });

  afterAll(() => {
    Math.random = oldRandom;
  });

  it('Kendall tau should be at least 0.9 across 5 seeds', () => {
    const seeds = [42, 123, 999, 5555, 12345];
    for (const seed of seeds) {
      currentRng = new PRNG(seed);
      const tau = runSimulation(seed);
      console.log(`Seed ${seed} -> Tau: ${tau}`);
      expect(tau).toBeGreaterThanOrEqual(0.9);
    }
  });
});
