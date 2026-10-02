import { createClient } from '@/lib/supabase/server';
import Link from 'next/link';
import { ChallengeButton } from '@/components/versus/ChallengeButton';

export default async function VersusPage({
  params,
}: {
  params: Promise<{ lo: string; hi: string }>;
}) {
  const supabase = await createClient();
  const { lo, hi } = await params;

  const { data: items } = await supabase.from('items').select('*').in('slug', [lo, hi]);

  if (!items || items.length !== 2) {
    return (
      <main className="flex min-h-screen items-center justify-center p-4 text-center">
        <div>
          <h1 className="text-2xl font-bold">Matchup not found</h1>
          <p className="mt-2 text-muted-foreground">
            Could not find {lo} vs {hi}
          </p>
          <Link href="/" className="mt-4 text-primary hover:underline">
            Go Home
          </Link>
        </div>
      </main>
    );
  }

  const itemA = items[0];
  const itemB = items[1];

  return (
    <main className="min-h-screen bg-background p-4 pt-12 md:p-8">
      <div className="mx-auto max-w-5xl">
        <header className="mb-12 text-center">
          <h1 className="font-heading text-4xl font-black uppercase tracking-tight text-foreground md:text-6xl">
            Tale of the Tape
          </h1>
          <p className="mt-4 text-lg text-muted-foreground">Detailed head-to-head statistics</p>
        </header>

        <div className="relative grid items-stretch gap-8 md:grid-cols-2">
          <div className="pointer-events-none absolute inset-0 z-10 hidden items-center justify-center md:flex">
            <div className="flex h-16 w-16 items-center justify-center rounded-full border-4 border-foreground bg-background text-xl font-black italic text-foreground shadow-2xl">
              VS
            </div>
          </div>

          <div className="flex flex-col items-center rounded-3xl border-4 border-contender-a bg-card p-8 text-center shadow-[0_0_40px_rgba(var(--contender-a),0.15)]">
            <h2 className="font-heading text-3xl font-bold">{itemA.name}</h2>
            <p className="mt-2 text-muted-foreground">{itemA.descriptor}</p>

            <div className="mt-8 grid w-full grid-cols-2 gap-4">
              <div className="rounded-xl bg-muted p-4">
                <div className="mb-1 text-sm font-bold uppercase tracking-wider text-muted-foreground">
                  Rating
                </div>
                <div className="font-mono text-3xl font-bold text-foreground">
                  {Math.round(itemA.display_score)}
                </div>
              </div>
              <div className="rounded-xl bg-muted p-4">
                <div className="mb-1 text-sm font-bold uppercase tracking-wider text-muted-foreground">
                  Win Rate
                </div>
                <div className="font-mono text-3xl font-bold text-foreground">
                  {itemA.win_count + itemA.loss_count > 0
                    ? Math.round((itemA.win_count / (itemA.win_count + itemA.loss_count)) * 100)
                    : 0}
                  %
                </div>
              </div>
            </div>
          </div>

          <div className="flex flex-col items-center rounded-3xl border-4 border-contender-b bg-card p-8 text-center shadow-[0_0_40px_rgba(var(--contender-b),0.15)]">
            <h2 className="font-heading text-3xl font-bold">{itemB.name}</h2>
            <p className="mt-2 text-muted-foreground">{itemB.descriptor}</p>

            <div className="mt-8 grid w-full grid-cols-2 gap-4">
              <div className="rounded-xl bg-muted p-4">
                <div className="mb-1 text-sm font-bold uppercase tracking-wider text-muted-foreground">
                  Rating
                </div>
                <div className="font-mono text-3xl font-bold text-foreground">
                  {Math.round(itemB.display_score)}
                </div>
              </div>
              <div className="rounded-xl bg-muted p-4">
                <div className="mb-1 text-sm font-bold uppercase tracking-wider text-muted-foreground">
                  Win Rate
                </div>
                <div className="font-mono text-3xl font-bold text-foreground">
                  {itemB.win_count + itemB.loss_count > 0
                    ? Math.round((itemB.win_count / (itemB.win_count + itemB.loss_count)) * 100)
                    : 0}
                  %
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="mt-12 rounded-2xl border bg-card p-8 shadow-sm">
          <h3 className="mb-6 text-xl font-bold">Head-to-Head History</h3>
          <div className="flex h-8 overflow-hidden rounded-full bg-muted">
            <div className="h-full w-[65%] bg-contender-a" />
            <div className="h-full w-[35%] bg-contender-b" />
          </div>
          <div className="mt-4 flex justify-between font-mono text-lg font-bold">
            <span className="text-contender-a">65%</span>
            <span className="text-contender-b">35%</span>
          </div>

          <div className="mt-8 flex justify-center">
            <ChallengeButton lo={lo} hi={hi} />
          </div>
        </div>
      </div>
    </main>
  );
}
