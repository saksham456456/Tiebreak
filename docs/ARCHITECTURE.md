# Architecture

Tiebreak is built on a high-throughput, serverless architecture.

```mermaid
flowchart LR
  B[Browser] -->|POST /api/vote| V[Vote route]
  V -->|XADD| S[(Redis stream)]
  V -->|HINCRBY| C[(Pair counters)]
  V -->|% agree, instantly| B
  S -->|every minute| F[Cron flush worker]
  F -->|Elo updates + bulk write| P[(Postgres / Supabase)]
  P --> L[Leaderboards, item and versus pages]
```

## Components
- **Next.js App Router**: Handles React Server Components and Edge API routes.
- **Upstash Redis**: Absorbs the high-velocity writes during viral voting events.
- **Supabase**: Handles Google Auth, persistent storage, and relational queries for the leaderboards. Row-Level Security (RLS) protects all user data (In Progress).
