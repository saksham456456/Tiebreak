import Link from 'next/link';

export default function HomePage() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center p-6 text-center">
      <div className="max-w-3xl space-y-6">
        <div className="inline-flex items-center gap-2 rounded-full border border-border bg-card/60 px-4 py-1.5 backdrop-blur">
          <span className="h-2 w-2 animate-pulse rounded-full bg-rating-up" />
          <span className="font-mono text-xs font-medium text-muted-foreground">
            Tiebreak V1 is Live!
          </span>
        </div>

        <h1 className="font-display text-5xl font-bold tracking-tight sm:text-6xl md:text-7xl">
          Tie<span className="text-primary">break</span>
        </h1>

        <p className="font-sans text-lg text-muted-foreground sm:text-xl">
          The global pairwise-voting ranking engine. Settle the greatest tech debates of all time
          with Elo-calibrated community consensus.
        </p>

        <div className="flex flex-wrap items-center justify-center gap-4 pt-4">
          <Link
            href="/dev-tools"
            className="rounded-lg bg-primary px-6 py-3 font-display text-sm font-bold text-primary-foreground shadow-glow-primary transition-all hover:bg-primary/90"
          >
            Enter the Arena &apos;
          </Link>
          <Link
            href="/leaderboard/dev-tools"
            className="rounded-lg border border-border bg-secondary px-6 py-3 font-mono text-sm font-semibold text-secondary-foreground transition-all hover:bg-accent"
          >
            View Leaderboards
          </Link>
        </div>

        <div className="mt-12 grid grid-cols-1 gap-4 pt-8 text-left sm:grid-cols-3">
          <div className="rounded-xl border border-border bg-card p-5 shadow-card">
            <span className="font-mono text-xs font-bold text-contender-a">01 // PAIRWISE</span>
            <h3 className="mt-2 font-display text-lg font-bold">Binary Matchups</h3>
            <p className="mt-1 font-sans text-xs text-muted-foreground">
              Vote on direct 1v1 matchups to eliminate voter bias and build accurate Elo tiers.
            </p>
          </div>

          <div className="rounded-xl border border-border bg-card p-5 shadow-card">
            <span className="font-mono text-xs font-bold text-contender-b">02 // REALTIME</span>
            <h3 className="mt-2 font-display text-lg font-bold">Dynamic Scoring</h3>
            <p className="mt-1 font-sans text-xs text-muted-foreground">
              Instant rating adjustments powered by Upstash Redis and server-side crons.
            </p>
          </div>

          <div className="rounded-xl border border-border bg-card p-5 shadow-card">
            <span className="font-mono text-xs font-bold text-rank-gold">03 // DNA</span>
            <h3 className="mt-2 font-display text-lg font-bold">Taste Profiles</h3>
            <p className="mt-1 font-sans text-xs text-muted-foreground">
              Unlock streaks, badges, and discover your personal Dev Tools DNA via ML clustering.
            </p>
          </div>
        </div>
      </div>
    </main>
  );
}
