import { createClient } from '@/lib/auth/supabase';
import { getServiceClient } from '@/lib/supabase/admin';
import { redirect } from 'next/navigation';
import { revalidatePath } from 'next/cache';
import { z } from 'zod';

async function requireAdmin() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  // Read role from app_metadata which is server-controlled (cannot be modified by user)
  if (!user || user.app_metadata?.role !== 'admin') {
    throw new Error('Unauthorized');
  }
  return user;
}

interface PendingItem {
  id: string;
  name: string;
  descriptor: string;
  categories: { name: string } | null;
}

export default async function AdminPage() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();

  if (!user || user.app_metadata?.role !== 'admin') {
    redirect('/');
  }

  const adminSupabase = getServiceClient();

  const { data: pendingItems } = await adminSupabase
    .from('items')
    .select('*, categories(name)')
    .eq('status', 'pending')
    .order('created_at', { ascending: false });

  async function approveItem(formData: FormData) {
    'use server';
    const adminUser = await requireAdmin();
    const id = formData.get('id') as string;
    const adminSupabase = getServiceClient();

    if (!z.string().uuid().safeParse(id).success) throw new Error('Invalid UUID');

    const { error: updateError } = await adminSupabase.from('items').update({ status: 'active' }).eq('id', id);
    if (updateError) throw updateError;

    // Write an audit log entry
    const { error: auditError } = await adminSupabase.from('audit_logs').insert({
      admin_id: adminUser.id,
      action: 'approve_item',
      item_id: id,
    });
    if (auditError) throw auditError;

    revalidatePath('/admin');
  }

  async function rejectItem(formData: FormData) {
    'use server';
    const adminUser = await requireAdmin();
    const id = formData.get('id') as string;
    const adminSupabase = getServiceClient();

    if (!z.string().uuid().safeParse(id).success) throw new Error('Invalid UUID');

    const { error: deleteError } = await adminSupabase.from('items').delete().eq('id', id);
    if (deleteError) throw deleteError;

    // Write an audit log entry
    const { error: auditError } = await adminSupabase.from('audit_logs').insert({
      admin_id: adminUser.id,
      action: 'reject_item',
      item_id: id,
    });
    if (auditError) throw auditError;

    revalidatePath('/admin');
  }

  return (
    <main className="min-h-screen bg-background p-4 pt-12 md:p-8">
      <div className="mx-auto max-w-4xl">
        <header className="mb-8">
          <h1 className="font-heading text-4xl font-black">Moderation Queue</h1>
          <p className="mt-2 text-muted-foreground">Approve or reject user submissions.</p>
        </header>

        <div className="space-y-4">
          {!pendingItems || pendingItems.length === 0 ? (
            <div className="rounded-2xl border bg-card p-8 text-center text-muted-foreground">
              Queue is empty. Great job!
            </div>
          ) : (
            (pendingItems as unknown as PendingItem[]).map((item) => (
              <div
                key={item.id}
                className="flex items-center justify-between rounded-2xl border bg-card p-6"
              >
                <div>
                  <div className="mb-1 text-xs font-bold uppercase tracking-wider text-muted-foreground">
                    {item.categories?.name}
                  </div>
                  <h3 className="text-xl font-bold">{item.name}</h3>
                  <p className="mt-1 text-muted-foreground">{item.descriptor}</p>
                </div>

                <div className="flex gap-2">
                  <form action={rejectItem}>
                    <input type="hidden" name="id" value={item.id} />
                    <button
                      type="submit"
                      className="rounded-lg bg-destructive/10 px-4 py-2 font-bold text-destructive transition-colors hover:bg-destructive/20"
                    >
                      Reject
                    </button>
                  </form>
                  <form action={approveItem}>
                    <input type="hidden" name="id" value={item.id} />
                    <button
                      type="submit"
                      className="rounded-lg bg-primary px-4 py-2 font-bold text-primary-foreground transition-colors hover:bg-primary/90"
                    >
                      Approve
                    </button>
                  </form>
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </main>
  );
}
