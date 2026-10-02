import { Ratelimit } from '@upstash/ratelimit';
import { redis } from '../redis/client';

// Cache for rate limits
const cache = new Map();

// If redis isn't configured, we use a fallback or throw. The redis proxy will handle it.

export const limits = {
  voteAnon: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(120, '1 m'),
    ephemeralCache: cache,
    prefix: 'rl:vote:anon',
  }),

  voteIp: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(600, '1 h'),
    ephemeralCache: cache,
    prefix: 'rl:vote:ip',
  }),

  voteAccount: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(3000, '1 d'),
    ephemeralCache: cache,
    prefix: 'rl:vote:acct',
  }),

  pairs: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(60, '1 m'),
    ephemeralCache: cache,
    prefix: 'rl:pairs',
  }),

  submissions: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(5, '1 d'),
    ephemeralCache: cache,
    prefix: 'rl:submissions',
  }),

  reports: new Ratelimit({
    redis,
    limiter: Ratelimit.slidingWindow(20, '1 d'),
    ephemeralCache: cache,
    prefix: 'rl:reports',
  }),
};
