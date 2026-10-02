'use client';

import { createClient } from '@/lib/auth/client';
import { useState } from 'react';
import { Loader2 } from 'lucide-react';

export function LoginButton({ className }: { className?: string }) {
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    setLoading(true);
    const supabase = createClient();

    await supabase.auth.signInWithOAuth({
      provider: 'google',
      options: {
        redirectTo: `${window.location.origin}/auth/callback`,
      },
    });
  };

  return (
    <button
      onClick={handleLogin}
      disabled={loading}
      className={`flex items-center gap-2 rounded-full bg-foreground px-4 py-2 font-bold text-background transition-colors hover:opacity-90 disabled:opacity-50 ${className || ''}`}
    >
      {loading ? <Loader2 className="h-4 w-4 animate-spin" /> : null}
      Sign in with Google
    </button>
  );
}
