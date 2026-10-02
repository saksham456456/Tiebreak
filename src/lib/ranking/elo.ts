export interface ItemRating {
  rating: number;
  rd: number;
}

export interface VoteUpdateResult {
  newA: ItemRating;
  newB: ItemRating;
}

function clamp(val: number, min: number, max: number): number {
  return Math.max(min, Math.min(max, val));
}

/**
 * Calculates new ratings for a matchup where A beats B (or draws/skips if specified).
 * Note: The prompt says draws/skips are not rating events. This function assumes A won over B.
 */
export function calculateEloUpdate(
  itemA: ItemRating,
  itemB: ItemRating,
  weight: number = 1.0
): VoteUpdateResult {
  const K_base = 48;
  const K_min = 6;
  const K_max = 48;

  const expected_A = 1 / (1 + Math.pow(10, (itemB.rating - itemA.rating) / 400));

  const K_A = clamp(K_base * (itemA.rd / 350), K_min, K_max);
  const K_B = clamp(K_base * (itemB.rd / 350), K_min, K_max);

  const newRatingA = itemA.rating + K_A * (1 - expected_A) * weight;
  const newRatingB = itemB.rating + K_B * (0 - (1 - expected_A)) * weight; // 0 because B lost

  const newRdA = Math.max(40, itemA.rd * 0.995);
  const newRdB = Math.max(40, itemB.rd * 0.995);

  return {
    newA: { rating: newRatingA, rd: newRdA },
    newB: { rating: newRatingB, rd: newRdB },
  };
}

export function calculateDisplayScore(rating: number, rd: number): number {
  const rd_scaled = rd / 2;
  return rating - 2 * rd_scaled;
}
