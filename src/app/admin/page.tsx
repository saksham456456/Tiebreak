import { createClient } from '@/lib/auth/supabase';
import { createClient as createAdminClient } from '@supabase/supabase-js';
import { redirect } from 'next/navigation';
import { revalidatePath } from 'next/cache';
import { z } from 'zod';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';
const adminSupabase = createAdminClient(supabaseUrl, supabaseKey);

async function requireAdmin() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();
  
  // Read role from app_metadata which is server-controlled (cannot be modified by user)
  if (!user || user.app_metadata?.role !== 'admin') {
    throw new Error('Unauthorized');
  }
  return user;
}

export default async function AdminPage() {
  const supabase = await createClient();
  const { data: { user } } = await supabase.auth.getUser();

  if (!user || user.app_metadata?.role !== 'admin') {
    redirect('/');
  }

  const { data: pendingItems } = await adminSupabase
    .from('items')
    .select('*, categories(name)')
    .eq('status', 'pending')
    .order('created_at', { ascending: false });

  async function approveItem(formData: FormData) {
    'use server';
    const adminUser = await requireAdmin();
    const id = formData.get('id') as string;
    
    if (!z.string().uuid().safeParse(id).success) throw new Error('Invalid UUID');

    await adminSupabase.from('items').update({ status: 'active' }).eq('id', id);
    // Write an audit log entry
    await adminSupabase.from('audit_logs').insert({
      admin_id: adminUser.id,
      action: 'approve_item',
      item_id: id,
    });
    revalidatePath('/admin');
  }

  async function rejectItem(formData: FormData) {
    'use server';
    const adminUser = await requireAdmin();
    const id = formData.get('id') as string;
    
    if (!z.string().uuid().safeParse(id).success) throw new Error('Invalid UUID');

    await adminSupabase.from('items').delete().eq('id', id);
    // Write an audit log entry
    await adminSupabase.from('audit_logs').insert({
      admin_id: adminUser.id,
      action: 'reject_item',
      item_id: id,
    });
    revalidatePath('/admin');
  }

  return (
    <main className="min-h-screen bg-background p-4 md:p-8 pt-12">
      <div className="max-w-4xl mx-auto">
        <header className="mb-8">
          <h1 className="text-4xl font-heading font-black">Moderation Queue</h1>
          <p className="text-muted-foreground mt-2">Approve or reject user submissions.</p>
        </header>

        <div className="space-y-4">
          {!pendingItems || pendingItems.length === 0 ? (
            <div className="bg-card border rounded-2xl p-8 text-center text-muted-foreground">
              Queue is empty. Great job!
            </div>
          ) : (
            pendingItems.map((item: any) => (
              <div key={item.id} className="bg-card border rounded-2xl p-6 flex items-center justify-between">
                <div>
                  <div className="text-xs font-bold uppercase tracking-wider text-muted-foreground mb-1">
                    {item.categories?.name}
                  </div>
                  <h3 className="text-xl font-bold">{item.name}</h3>
                  <p className="text-muted-foreground mt-1">{item.descriptor}</p>
                </div>
                
                <div className="flex gap-2">
                  <form action={rejectItem}>
                    <input type="hidden" name="id" value={item.id} />
                    <button type="submit" className="bg-destructive/10 text-destructive px-4 py-2 rounded-lg font-bold hover:bg-destructive/20 transition-colors">
                      Reject
                    </button>
                  </form>
                  <form action={approveItem}>
                    <input type="hidden" name="id" value={item.id} />
                    <button type="submit" className="bg-primary text-primary-foreground px-4 py-2 rounded-lg font-bold hover:bg-primary/90 transition-colors">
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
