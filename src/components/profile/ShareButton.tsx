'use client';

import { Share2, Check } from 'lucide-react';
import { useState } from 'react';

export function ShareButton() {
  const [copied, setCopied] = useState(false);

  const handleShare = async () => {
    const url = `${window.location.origin}/taste/demo-card`;

    if (navigator.share) {
      try {
        await navigator.share({
          title: 'My Tiebreak Taste Profile',
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
      className="flex items-center gap-2 rounded-full bg-primary px-4 py-2 font-bold text-primary-foreground transition-colors hover:bg-primary/90"
    >
      {copied ? <Check className="h-4 w-4" /> : <Share2 className="h-4 w-4" />}
      {copied ? 'Copied Link' : 'Share Profile'}
    </button>
  );
}
