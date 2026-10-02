'use client';

import { Swords, Check } from 'lucide-react';
import { useState } from 'react';

export function ChallengeButton({ lo, hi }: { lo: string; hi: string }) {
  const [copied, setCopied] = useState(false);

  const handleShare = async () => {
    const url = `${window.location.origin}/versus/${lo}/${hi}`;

    if (navigator.share) {
      try {
        await navigator.share({
          title: 'Vote on this matchup!',
          url,
        });
        return;
      } catch (err) {
        console.error(err);
      }
    }

    navigator.clipboard.writeText(url);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <button
      onClick={handleShare}
      className="flex items-center gap-2 rounded-full bg-foreground px-6 py-3 font-bold text-background transition-colors hover:opacity-90"
    >
      {copied ? <Check className="h-5 w-5" /> : <Swords className="h-5 w-5" />}
      {copied ? 'Link Copied' : 'Challenge a Friend'}
    </button>
  );
}
