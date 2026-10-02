'use client';

import { motion } from 'framer-motion';
import { cn } from '@/lib/utils';
import { Check } from 'lucide-react';

interface Item {
  id: string;
  name: string;
  descriptor: string;
  image_url: string;
}

interface ItemCardProps {
  item: Item;
  side: 'a' | 'b';
  onVote: () => void;
  isVoted: boolean;
  isLoser: boolean;
  disabled: boolean;
  feedback: { agreePct: number; upset: boolean } | null;
}

export function ItemCard({
  item,
  side,
  onVote,
  isVoted,
  isLoser,
  disabled,
  feedback,
}: ItemCardProps) {
  return (
    <motion.button
      whileHover={disabled ? {} : { scale: 1.02, y: -4 }}
      whileTap={disabled ? {} : { scale: 0.98 }}
      onClick={onVote}
      disabled={disabled}
      className={cn(
        'relative flex-1 overflow-hidden rounded-2xl text-left transition-all duration-300 focus:outline-none focus:ring-4 focus:ring-ring focus:ring-offset-2 focus:ring-offset-background',
        'group border-2 bg-card shadow-lg',
        disabled && !isVoted && !isLoser ? 'opacity-50' : '',
        isVoted
          ? side === 'a'
            ? 'border-contender-a shadow-[0_0_30px_rgba(var(--contender-a),0.3)]'
            : 'border-contender-b shadow-[0_0_30px_rgba(var(--contender-b),0.3)]'
          : 'border-border hover:border-muted-foreground',
        isLoser ? 'scale-95 opacity-30 blur-sm grayscale filter' : ''
      )}
      style={{
        transformStyle: 'preserve-3d',
      }}
    >
      <div className="absolute inset-0 z-10 bg-gradient-to-t from-background/90 via-background/20 to-transparent" />

      {/* Placeholder for image */}
      <div className="absolute inset-0 flex items-center justify-center bg-muted">
        <span className="text-[120px] opacity-10">🤔</span>
      </div>

      <div className="absolute bottom-0 left-0 z-20 flex h-full w-full flex-col justify-end p-6">
        <h3 className="font-heading line-clamp-2 text-3xl font-bold leading-tight text-foreground">
          {item.name}
        </h3>
        <p className="mt-2 line-clamp-2 text-sm font-medium text-muted-foreground">
          {item.descriptor}
        </p>
      </div>

      {/* Voted Overlay Feedback */}
      {isVoted && (
        <motion.div
          initial={{ opacity: 0, scale: 0.5 }}
          animate={{ opacity: 1, scale: 1 }}
          className="absolute inset-0 z-30 flex flex-col items-center justify-center bg-background/60 backdrop-blur-md"
        >
          <div className="mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary text-primary-foreground shadow-xl">
            <Check strokeWidth={3} className="h-8 w-8" />
          </div>
          {feedback && (
            <motion.div
              initial={{ y: 20, opacity: 0 }}
              animate={{ y: 0, opacity: 1 }}
              transition={{ delay: 0.2 }}
              className="text-center"
            >
              <div className="font-heading text-4xl font-black">{feedback.agreePct}%</div>
              <div className="mt-1 text-sm font-medium uppercase tracking-widest text-muted-foreground">
                Agree with you
              </div>
              {feedback.upset && (
                <div className="mt-2 rounded-full bg-destructive px-2 py-1 text-xs font-bold uppercase tracking-wider text-destructive-foreground">
                  Upset!
                </div>
              )}
            </motion.div>
          )}
        </motion.div>
      )}
    </motion.button>
  );
}
