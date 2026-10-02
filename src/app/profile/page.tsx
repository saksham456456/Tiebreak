import { getAnonId } from '@/lib/auth/anon';
import { redis } from '@/lib/redis/client';
import { REDIS_KEYS } from '@/lib/redis/keys';
import { redirect } from 'next/navigation';
import { ShareButton } from '@/components/profile/ShareButton';
import { createClient } from '@/lib/auth/supabase';
import { LoginButton } from '@/components/auth/LoginButton';

export default async function ProfilePage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  const anonId = await getAnonId();
  if (!anonId && !user) {
    redirect('/');
  }

  const effectiveId = user ? user.id : anonId;

  let currentStreak = 0;
  let totalXp = 0;

  if (redis && effectiveId) {
    const streakStr = await redis.hget(REDIS_KEYS.streak(effectiveId), 'current');
    currentStreak = parseInt((streakStr as string) || '0');

    const xpStr = await redis.hget(REDIS_KEYS.xp(effectiveId), 'total');
    totalXp = parseInt((xpStr as string) || '0');
  }

  const tasteVectors = [
    { name: 'TypeScript', value: 85 },
    { name: 'React', value: 72 },
    { name: 'Vim', value: 91 },
    { name: 'PostgreSQL', value: 68 },
    { name: 'Mac', value: 54 },
  ];

  return (
    <main className="min-h-screen bg-background p-4 pt-12 md:p-8">
      <div className="mx-auto max-w-3xl space-y-8">
        <header className="flex flex-col justify-between gap-4 md:flex-row md:items-end">
          <div>
            <h1 className="font-heading text-4xl font-black">Your Taste Profile</h1>
            <p className="mt-2 text-muted-foreground">
              Identity: <span className="font-mono text-xs">{effectiveId?.split('-')[0]}</span>
              {user && (
                <span className="ml-2 rounded bg-primary/10 px-2 py-1 font-bold text-primary">
                  Verified ({user.email})
                </span>
              )}
            </p>
          </div>
          <div className="flex gap-2">
            {!user && <LoginButton />}
            <ShareButton />
          </div>
        </header>

        <div className="grid grid-cols-2 gap-4">
          <div className="flex flex-col items-center justify-center rounded-2xl border bg-card p-6 text-center shadow-sm">
            <div className="mb-2 text-sm font-bold uppercase tracking-wider text-muted-foreground">
              Current Streak
            </div>
            <div className="font-heading text-5xl font-black text-primary">
              {currentStreak} <span className="text-xl">🔥</span>
            </div>
          </div>
          <div className="flex flex-col items-center justify-center rounded-2xl border bg-card p-6 text-center shadow-sm">
            <div className="mb-2 text-sm font-bold uppercase tracking-wider text-muted-foreground">
              Total XP
            </div>
            <div className="font-heading text-5xl font-black text-secondary">{totalXp}</div>
          </div>
        </div>

        <section className="rounded-2xl border bg-card p-6 shadow-sm">
          <h2 className="mb-6 text-xl font-bold">Dev Tools DNA</h2>
          <div className="space-y-4">
            {tasteVectors.map((tv) => (
              <div key={tv.name} className="flex items-center gap-4">
                <div className="w-24 text-sm font-medium">{tv.name}</div>
                <div className="h-4 flex-1 overflow-hidden rounded-full bg-muted">
                  <div
                    className="h-full rounded-full bg-primary transition-all duration-1000"
                    style={{ width: `${tv.value}%` }}
                  />
                </div>
                <div className="w-12 text-right font-mono text-sm font-bold">{tv.value}%</div>
              </div>
            ))}
          </div>
        </section>
      </div>
    </main>
  );
}
