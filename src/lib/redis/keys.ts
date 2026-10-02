export const REDIS_KEYS = {
  VOTES_STREAM: 'votes_stream',

  pairStats: (lo: string, hi: string) => {
    // Ensure consistent ordering
    const [first, second] = [lo, hi].sort();
    return `pair:${first}:${second}`;
  },

  seenSet: (ownerKey: string) => `seen:${ownerKey}`,

  streak: (ownerKey: string) => `streak:${ownerKey}`,
  xp: (ownerKey: string) => `xp:${ownerKey}`,
  taste: (ownerKey: string, categoryId: string) => `taste:${ownerKey}:${categoryId}`,

  idempotency: (clientVoteId: string) => `idem:${clientVoteId}`,

  rateLimit: (key: string) => `rl:${key}`,

  activeUsersHLL: (yyyymmddhh: string) => `hll:active:${yyyymmddhh}`,

  pool: (categoryId: string, locale: string) => `pool:${categoryId}:${locale}`,
};
