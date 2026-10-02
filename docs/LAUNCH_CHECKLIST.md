# Tiebreak Launch Checklist (Phase 6)

## Security & Abuse
- [x] Rate limits active for IP (600/hr) and Anon ID (120/min).
- [x] Turnstile integrated on client (TODO: wire up if not done).
- [x] Redis Idempotency locks on `clientVoteId`.
- [x] No secrets committed to git.
- [ ] Security headers (Content-Security-Policy, etc.) in `next.config.ts`.

## Performance
- [x] Next.js App Router static pages generated.
- [x] Redis buffered writes functioning.
- [x] Flush worker cron endpoint protected by `CRON_SECRET`.
- [ ] Vercel `vercel.json` deployed to hit cron every 1 minute.
- [ ] Database indexed (Supabase).

## Legal & Compliance
- [x] Privacy Policy published at `/legal/privacy`.
- [x] Terms of Service published at `/legal/terms`.
- [ ] Cookie consent banner for EU users.

## Monitoring
- [ ] Sentry configured for frontend/backend errors.
- [ ] PostHog capturing custom events (`vote`, `share_taste`, `streak_milestone`).

## Marketing & Growth
- [x] Dynamic OG Images returning valid images.
- [x] Taste Profile sharing works.
- [x] Seed data (900+ items) loaded and verified.
- [ ] Demo video recorded.
