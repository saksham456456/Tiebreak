import { notFound } from 'next/navigation';
import { LeaderboardClient } from '@/components/arena/LeaderboardClient';
import { createClient } from '@/lib/supabase/server';

export default async function LeaderboardPage({
  params,
}: {
  params: Promise<{ category: string }>;
}) {
  const supabase = await createClient();
  const { category } = await params;

  if (!category) return notFound();

  const { data: catData } = await supabase
    .from('categories')
    .select('id, name')
    .eq('slug', category)
    .single();
  if (!catData) return notFound();

  const { data: items } = await supabase
    .from('items')
    .select('id, name, descriptor, image_url, display_score, rd, win_count, loss_count, slug')
    .eq('category_id', catData.id)
    .order('display_score', { ascending: false })
    .limit(100);

  return (
    <main className="min-h-screen bg-background">
      <div className="mx-auto max-w-4xl p-4 pt-12 md:p-8">
        <header className="mb-8">
          <h1 className="font-heading text-4xl font-black text-foreground">Top {catData.name}</h1>
          <p className="mt-2 text-lg text-muted-foreground">
            The definitive crowd-sourced ranking.
          </p>
        </header>

        <div className="overflow-hidden rounded-2xl border bg-card shadow-sm">
          <div className="grid grid-cols-[60px_1fr_100px_100px] gap-4 border-b bg-muted/50 p-4 text-sm font-medium uppercase tracking-wider text-muted-foreground md:grid-cols-[80px_1fr_120px_120px]">
            <div className="text-center">Rank</div>
            <div>Contender</div>
            <div className="text-right">Score</div>
            <div className="hidden text-right md:block">Win Rate</div>
          </div>

          <LeaderboardClient initialItems={items || []} categoryId={catData.id} />
        </div>
      </div>
    </main>
  );
}
