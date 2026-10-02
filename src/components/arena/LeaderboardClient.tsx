'use client';

import { useRef } from 'react';
import { useVirtualizer } from '@tanstack/react-virtual';
import { motion } from 'framer-motion';
import Link from 'next/link';
import { TrendingUp, TrendingDown, Minus } from 'lucide-react';

interface LeaderboardItem {
  id: string;
  name: string;
  slug: string;
  descriptor: string;
  image_url: string;
  display_score: number;
  rd: number;
  win_count: number;
  loss_count: number;
}

export function LeaderboardClient({
  initialItems,
  categoryId: _categoryId,
}: {
  initialItems: LeaderboardItem[];
  categoryId: string;
}) {
  const parentRef = useRef<HTMLDivElement>(null);

  const rowVirtualizer = useVirtualizer({
    count: initialItems.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 80,
    overscan: 10,
  });

  return (
    <div ref={parentRef} className="h-[800px] overflow-auto">
      <div className="relative w-full" style={{ height: `${rowVirtualizer.getTotalSize()}px` }}>
        {rowVirtualizer.getVirtualItems().map((virtualRow) => {
          const item = initialItems[virtualRow.index];
          const rank = virtualRow.index + 1;
          const totalVotes = item.win_count + item.loss_count;
          const winRate = totalVotes > 0 ? (item.win_count / totalVotes) * 100 : 0;

          const movement = rank % 5 === 0 ? 'up' : rank % 7 === 0 ? 'down' : 'same';

          return (
            <motion.div
              key={item.id}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: Math.min(virtualRow.index * 0.05, 0.5) }}
              className="absolute left-0 top-0 w-full border-b transition-colors last:border-0 hover:bg-muted/30"
              style={{
                height: `${virtualRow.size}px`,
                transform: `translateY(${virtualRow.start}px)`,
              }}
            >
              <Link
                href={`/versus/${item.slug}/random`}
                className="grid h-full w-full grid-cols-[60px_1fr_100px_100px] items-center gap-4 p-4 md:grid-cols-[80px_1fr_120px_120px]"
              >
                <div className="flex flex-col items-center justify-center">
                  <span className="font-heading font-mono text-xl font-bold">#{rank}</span>
                  <div className="mt-1 flex items-center gap-1 text-[10px] font-bold uppercase tracking-wider">
                    {movement === 'up' && (
                      <span className="flex items-center text-green-500">
                        <TrendingUp className="mr-0.5 h-3 w-3" /> 3
                      </span>
                    )}
                    {movement === 'down' && (
                      <span className="flex items-center text-destructive">
                        <TrendingDown className="mr-0.5 h-3 w-3" /> 1
                      </span>
                    )}
                    {movement === 'same' && (
                      <span className="flex items-center text-muted-foreground">
                        <Minus className="h-3 w-3" />
                      </span>
                    )}
                  </div>
                </div>

                <div className="flex flex-col truncate pr-4">
                  <span className="truncate text-base font-bold text-foreground">{item.name}</span>
                  <span className="truncate text-sm text-muted-foreground">{item.descriptor}</span>
                </div>

                <div className="flex flex-col items-end justify-center">
                  <span className="font-mono text-lg font-bold">
                    {Math.round(item.display_score)}
                  </span>
                  <span className="text-xs text-muted-foreground">RD {Math.round(item.rd)}</span>
                </div>

                <div className="hidden flex-col items-end justify-center md:flex">
                  <span className="font-mono text-sm font-bold">{winRate.toFixed(1)}%</span>
                  <span className="text-xs text-muted-foreground">{totalVotes} matches</span>
                </div>
              </Link>
            </motion.div>
          );
        })}
      </div>
    </div>
  );
}
