'use client';

import { useState, useEffect, useCallback } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { Loader2 } from 'lucide-react';
import { ItemCard } from './ItemCard';

interface Item {
  id: string;
  name: string;
  descriptor: string;
  image_url: string;
}

interface Pair {
  pairId: string;
  a: Item;
  b: Item;
  hot: boolean;
}

export function ArenaClient({ category }: { category: string }) {
  const [pairs, setPairs] = useState<Pair[]>([]);
  const [loading, setLoading] = useState(true);
  const [currentIndex, setCurrentIndex] = useState(0);

  const [votedId, setVotedId] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<{ agreePct: number; upset: boolean } | null>(null);

  const fetchPairs = useCallback(async () => {
    try {
      const res = await fetch(`/api/pairs?category=${category}&count=20`);
      if (res.ok) {
        const json = await res.json();
        setPairs((prev) => [...prev, ...json.data]);
      }
    } catch (e) {
      console.error('Failed to fetch pairs', e);
    } finally {
      setLoading(false);
    }
  }, [category]);

  useEffect(() => {
    fetchPairs();
  }, [fetchPairs]);

  useEffect(() => {
    if (pairs.length > 0 && pairs.length - currentIndex < 5) {
      fetchPairs();
    }
  }, [currentIndex, pairs.length, fetchPairs]);

  const handleVote = async (winnerId: string, _loserId: string) => {
    if (votedId) return;
    setVotedId(winnerId);

    const clientVoteId = crypto.randomUUID();
    const isA = winnerId === currentPair.a.id;

    try {
      const res = await fetch('/api/vote', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          itemA: currentPair.a.id,
          itemB: currentPair.b.id,
          outcome: isA ? 'a' : 'b',
          decisionMs: 1500,
          clientVoteId,
        }),
      });
      const data = await res.json();
      if (res.ok) {
        setFeedback({ agreePct: data.data.agreePct, upset: data.data.upset });
      }
    } catch (e) {
      console.error(e);
    }

    setTimeout(() => {
      setVotedId(null);
      setFeedback(null);
      setCurrentIndex((prev) => prev + 1);
    }, 1500);
  };

  const handleSkip = () => {
    setVotedId('skip');
    setTimeout(() => {
      setVotedId(null);
      setCurrentIndex((prev) => prev + 1);
    }, 300);
  };

  if (loading && pairs.length === 0) {
    return (
      <div className="flex h-full w-full flex-col items-center justify-center">
        <Loader2 className="h-8 w-8 animate-spin text-muted-foreground" />
      </div>
    );
  }

  if (pairs.length === 0 || currentIndex >= pairs.length) {
    return (
      <div className="flex h-full w-full flex-col items-center justify-center text-center">
        <h2 className="text-xl font-bold">You&apos;ve voted on everything!</h2>
        <p className="mt-2 text-muted-foreground">Come back later for more.</p>
      </div>
    );
  }

  const currentPair = pairs[currentIndex];
  const visiblePairs = pairs.slice(currentIndex, currentIndex + 2);

  return (
    <div className="perspective-[1000px] relative flex h-full w-full items-center justify-center">
      <AnimatePresence mode="popLayout">
        {visiblePairs.map((pair, idx) => {
          const isTop = idx === 0;
          return (
            <motion.div
              key={pair.pairId}
              initial={{ scale: 0.9, opacity: 0, y: 40 }}
              animate={{
                scale: isTop ? 1 : 0.95,
                opacity: isTop ? 1 : 0.5,
                y: isTop ? 0 : 20,
                zIndex: isTop ? 10 : 0,
              }}
              exit={{ scale: 1.1, opacity: 0, y: -40, filter: 'blur(10px)' }}
              transition={{ type: 'spring', stiffness: 300, damping: 25 }}
              className="absolute inset-0 flex flex-col items-stretch justify-center gap-4 p-4 md:flex-row md:gap-8 md:p-8"
              style={{ pointerEvents: isTop ? 'auto' : 'none' }}
            >
              <ItemCard
                item={pair.a}
                side="a"
                onVote={() => handleVote(pair.a.id, pair.b.id)}
                isVoted={votedId === pair.a.id}
                isLoser={votedId !== null && votedId !== pair.a.id && votedId !== 'skip'}
                feedback={votedId === pair.a.id ? feedback : null}
                disabled={votedId !== null}
              />

              <div className="flex shrink-0 items-center justify-center md:flex-col">
                <div className="flex h-8 w-8 items-center justify-center rounded-full border border-border bg-muted font-mono text-xs font-bold shadow-inner">
                  VS
                </div>
              </div>

              <ItemCard
                item={pair.b}
                side="b"
                onVote={() => handleVote(pair.b.id, pair.a.id)}
                isVoted={votedId === pair.b.id}
                isLoser={votedId !== null && votedId !== pair.b.id && votedId !== 'skip'}
                feedback={votedId === pair.b.id ? feedback : null}
                disabled={votedId !== null}
              />
            </motion.div>
          );
        })}
      </AnimatePresence>

      <div className="absolute bottom-[-3rem] flex w-full justify-center">
        <button
          onClick={handleSkip}
          disabled={votedId !== null}
          className="text-sm text-muted-foreground transition-colors hover:text-foreground disabled:opacity-50"
        >
          Skip this pair
        </button>
      </div>
    </div>
  );
}
