import { ArenaClient } from '@/components/arena/ArenaClient';
import { notFound } from 'next/navigation';

export default async function ArenaPage({ params }: { params: Promise<{ category: string }> }) {
  const { category } = await params;

  if (!category) {
    return notFound();
  }

  return (
    <main className="relative flex min-h-screen flex-col items-center justify-center overflow-hidden bg-background p-4">
      <div className="pointer-events-none absolute top-8 z-10 w-full text-center">
        <h1 className="font-heading text-2xl font-bold">Tiebreak: {category}</h1>
        <p className="mt-1 text-sm text-muted-foreground">Which one is better?</p>
      </div>

      <div className="relative z-20 mx-auto h-[70vh] w-full max-w-4xl">
        <ArenaClient category={category} />
      </div>
    </main>
  );
}
