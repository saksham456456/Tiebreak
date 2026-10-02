import { NextResponse } from 'next/server';
import { createClient } from '@/lib/auth/supabase';
import { createClient as createAdminClient } from '@supabase/supabase-js';
import { getAnonId } from '@/lib/auth/anon';

export async function GET(request: Request) {
  const { searchParams, origin } = new URL(request.url);
  const code = searchParams.get('code');
  let next = searchParams.get('next') ?? '/profile';

  // Prevent Open Redirects: ensuring 'next' is a local relative path
  if (!next.startsWith('/') || next.startsWith('//')) {
    next = '/profile';
  }

  if (code) {
    const supabase = await createClient();
    const { error, data } = await supabase.auth.exchangeCodeForSession(code);

    if (!error && data.user) {
      // Merge anon data immediately using signed HTTP-only cookie
      const anonId = await getAnonId();
      if (anonId) {
        const adminClient = createAdminClient(
          process.env.NEXT_PUBLIC_SUPABASE_URL!,
          process.env.SUPABASE_SERVICE_ROLE_KEY!
        );

        const userId = data.user.id;

        // Idempotency: only link if user_id is currently null
        const { data: currentAnon } = await adminClient
          .from('anon_identities')
          .select('user_id')
          .eq('anon_id', anonId)
          .single();

        if (currentAnon && currentAnon.user_id === null) {
          await Promise.all([
            adminClient.from('anon_identities').update({ user_id: userId }).eq('anon_id', anonId),
            adminClient.from('votes').update({ user_id: userId }).eq('anon_id', anonId),
            adminClient
              .from('taste_profiles')
              .update({ owner_key: `u:${userId}` })
              .eq('owner_key', `a:${anonId}`),
          ]);
        }
      }

      const forwardedHost = request.headers.get('x-forwarded-host');
      const isLocalhost = process.env.NODE_ENV === 'development';

      if (isLocalhost) {
        return NextResponse.redirect(`${origin}${next}`);
      } else if (forwardedHost) {
        return NextResponse.redirect(`https://${forwardedHost}${next}`);
      } else {
        return NextResponse.redirect(`${origin}${next}`);
      }
    }
  }

  return NextResponse.redirect(`${origin}/auth/auth-code-error`);
}
