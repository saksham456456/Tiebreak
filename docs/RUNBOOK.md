# Incident Runbook

## 1. Redis Flush Worker Stalling
**Symptom**: `votes_stream` length exceeds 10,000. PostgreSQL items are not updating.
**Action**:
1. Check Vercel logs for `/api/cron/flush`.
2. Look for `BUSYGROUP` or `OOM` errors.
3. If locked, manually delete `lock:flush` in Upstash UI.
4. If Postgres is rejecting bulk inserts, check for deadlocks in `supabase.rpc('increment_pair_stats')`.

## 2. Vote Abuse / Brigade Attack
**Symptom**: Sudden spike in votes for a specific item (e.g. 5,000 votes in 10 minutes).
**Action**:
1. Identify the `ip_hash` or `anon_id` in Supabase `votes` table.
2. If distributed, check the `source` and `decision_ms`. Filter out votes where `decision_ms < 100`.
3. Increase Upstash rate limit strictness in `limits.ts` temporarily.
4. Run the recalculation script offline to subtract the fraudulent votes from Elo scores.

## 3. Database CPU Spike (Supabase)
**Symptom**: Supabase dashboard shows 100% CPU. API starts timing out.
**Action**:
1. Check `pg_stat_activity` for long-running queries (typically `/api/stats` or leaderboards without caching).
2. Ensure Vercel `Cache-Control` on `/api/stats` is working.
3. Temporarily disable the public `/leaderboard` route until indexed or cached properly.
