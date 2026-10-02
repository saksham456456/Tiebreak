import { notFound } from 'next/navigation';
import { Metadata } from 'next';
import Link from 'next/link';
import { getAnonId } from '@/lib/auth/anon';

type Props = {
  params: Promise<{ id: string }>;
};

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const { id } = await params;

  return {
    title: `My Tiebreak Taste`,
    description: `Check out my dev tools DNA.`,
    openGraph: {
      images: [`/api/og?id=${id}`],
    },
    twitter: {
      card: 'summary_large_image',
      images: [`/api/og?id=${id}`],
    },
  };
}

export default async function SharedTastePage({ params }: Props) {
  const { id } = await params;

  if (!id) return notFound();

  // Mocking the match percentage if current user is viewing someone else's profile
  const viewerAnonId = await getAnonId();
  const isViewer = viewerAnonId && viewerAnonId !== id;
  const matchPct = isViewer ? 74 : null; // In real app, call computeCosineSimilarity

  return (
    <main className="flex min-h-screen flex-col items-center justify-center bg-background p-4">
      <div className="relative w-full max-w-md overflow-hidden rounded-3xl border bg-card p-8 text-center shadow-2xl">
        {isViewer && matchPct && (
          <div className="absolute right-0 top-0 rounded-bl-3xl bg-primary px-4 py-2 text-sm font-bold text-primary-foreground shadow-md">
            {matchPct}% Match
          </div>
        )}

        <div className="mb-4 mt-2 text-4xl">🧬</div>
        <h1 className="mb-2 text-2xl font-bold">Dev Tools DNA</h1>
        <p className="mb-8 text-muted-foreground">
          This user is heavily biased towards React, Vim, and PostgreSQL.
        </p>

        <div className="relative z-10 space-y-4 text-left">
          <div className="flex items-center gap-4">
            <div className="w-24 text-sm font-medium">React</div>
            <div className="h-3 flex-1 overflow-hidden rounded-full bg-muted">
              <div className="h-full rounded-full bg-primary" style={{ width: `85%` }} />
            </div>
          </div>
          <div className="flex items-center gap-4">
            <div className="w-24 text-sm font-medium">Vim</div>
            <div className="h-3 flex-1 overflow-hidden rounded-full bg-muted">
              <div className="h-full rounded-full bg-primary" style={{ width: `92%` }} />
            </div>
          </div>
        </div>

        <div className="relative z-10 mt-12 border-t pt-6">
          <Link
            href="/"
            className="inline-block rounded-full bg-foreground px-6 py-3 font-bold text-background hover:opacity-90"
          >
            {isViewer ? 'Improve Your Match' : 'Build your own profile'}
          </Link>
        </div>
      </div>
    </main>
  );
}
