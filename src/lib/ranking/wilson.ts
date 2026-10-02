/**
 * Wilson lower bound for binomial proportion
 * @param p_hat The observed proportion of successes (wins / total)
 * @param n Total number of trials (votes)
 * @param z Z-score for the desired confidence level (default 1.96 for 95%)
 */
export function wilsonLowerBound(p_hat: number, n: number, z: number = 1.96): number {
  if (n === 0) return 0;
  const z2 = z * z;
  const den = 1 + z2 / n;
  const num = p_hat + z2 / (2 * n) - z * Math.sqrt((p_hat * (1 - p_hat) + z2 / (4 * n)) / n);
  return num / den;
}
