interface WeightParams {
  trustScore: number;
  unfamiliar: boolean;
  decisionMs: number;
  rateLimited?: boolean;
  brigadeFlagged?: boolean;
}

export function calculateVoteWeight({
  trustScore,
  unfamiliar,
  decisionMs,
  rateLimited = false,
  brigadeFlagged = false,
}: WeightParams): number {
  if (rateLimited || brigadeFlagged) return 0;

  const base = 1.0;

  // trustScore should be clamped between 0.1 and 1.0 upstream, but we ensure it here
  const trust = Math.max(0.1, Math.min(1.0, trustScore));

  const familiarity = unfamiliar ? 0.5 : 1.0;

  const speed_factor = decisionMs < 250 ? 0.3 : 1.0;

  return base * trust * familiarity * speed_factor;
}
