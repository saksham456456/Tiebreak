import { ArenaClient } from '@/components/arena/ArenaClient';
import { notFound } from 'next/navigation';

export default async function EmbedPage({ params }: { params: Promise<{ category: string }> }) {
  const { category } = await params;

  if (!category) {
    return notFound();
  }

  return (
    <main className="relative flex h-screen w-full flex-col overflow-hidden bg-transparent">
      <div className="relative z-20 w-full flex-1">
        {/* We reuse the ArenaClient but inside a constrained embed layout */}
        <ArenaClient category={category} />
      </div>

      <div className="absolute bottom-2 right-4 z-50">
        <a
          href={`https://tiebreak.com/(arena)/${category}`}
          target="_blank"
          rel="noopener noreferrer"
          className="rounded border bg-background/80 px-2 py-1 text-[10px] font-bold uppercase tracking-wider text-muted-foreground shadow-sm backdrop-blur-sm transition-colors hover:text-foreground"
        >
          Powered by Tiebreak
        </a>
      </div>
    </main>
  );
}
