import { createClient } from '@supabase/supabase-js';
import { SubmitForm } from '@/components/submit/SubmitForm';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';
const supabase = createClient(supabaseUrl, supabaseKey);

export default async function SubmitPage() {
  const { data: categories } = await supabase.from('categories').select('id, name').order('name');

  return (
    <main className="flex min-h-screen flex-col items-center bg-background p-4 pt-12 md:p-8">
      <div className="w-full max-w-xl">
        <header className="mb-8 text-center">
          <h1 className="font-heading text-4xl font-black">Submit a Contender</h1>
          <p className="mt-2 text-muted-foreground">
            Notice a missing language, framework, or tool? Submit it for moderation.
          </p>
        </header>

        <div className="rounded-3xl border bg-card p-6 shadow-sm md:p-8">
          <SubmitForm categories={categories || []} />
        </div>
      </div>
    </main>
  );
}
