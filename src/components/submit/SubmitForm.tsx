'use client';

import { useState } from 'react';
import { Loader2 } from 'lucide-react';

interface Category {
  id: string;
  name: string;
}

export function SubmitForm({ categories }: { categories: Category[] }) {
  const [loading, setLoading] = useState(false);
  const [success, setSuccess] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setLoading(true);
    setError(null);
    setSuccess(false);

    const formData = new FormData(e.currentTarget);
    const data = {
      name: formData.get('name'),
      descriptor: formData.get('descriptor'),
      categoryId: formData.get('categoryId'),
    };

    try {
      const res = await fetch('/api/submit', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data),
      });

      if (!res.ok) {
        const result = await res.json();
        throw new Error(result.error || 'Failed to submit');
      }

      setSuccess(true);
      (e.target as HTMLFormElement).reset();
    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      {error && (
        <div className="rounded-lg bg-destructive/10 p-3 text-sm font-medium text-destructive">
          {error}
        </div>
      )}

      {success && (
        <div className="rounded-lg bg-primary/10 p-3 text-sm font-medium text-primary">
          Successfully submitted for review! You&apos;ll see it in the arena soon.
        </div>
      )}

      <div className="space-y-2">
        <label
          className="text-sm font-bold uppercase tracking-wider text-muted-foreground"
          htmlFor="categoryId"
        >
          Category
        </label>
        <select
          name="categoryId"
          id="categoryId"
          required
          className="w-full rounded-lg border bg-background px-4 py-3 outline-none focus:ring-2 focus:ring-primary"
        >
          <option value="">Select a category</option>
          {categories.map((c) => (
            <option key={c.id} value={c.id}>
              {c.name}
            </option>
          ))}
        </select>
      </div>

      <div className="space-y-2">
        <label
          className="text-sm font-bold uppercase tracking-wider text-muted-foreground"
          htmlFor="name"
        >
          Name
        </label>
        <input
          type="text"
          name="name"
          id="name"
          placeholder="e.g. SvelteKit"
          required
          maxLength={50}
          className="w-full rounded-lg border bg-background px-4 py-3 outline-none focus:ring-2 focus:ring-primary"
        />
      </div>

      <div className="space-y-2">
        <label
          className="text-sm font-bold uppercase tracking-wider text-muted-foreground"
          htmlFor="descriptor"
        >
          Descriptor
        </label>
        <input
          type="text"
          name="descriptor"
          id="descriptor"
          placeholder="e.g. A cybernetically enhanced web app framework"
          required
          maxLength={100}
          className="w-full rounded-lg border bg-background px-4 py-3 outline-none focus:ring-2 focus:ring-primary"
        />
      </div>

      <button
        type="submit"
        disabled={loading}
        className="flex w-full items-center justify-center rounded-lg bg-foreground py-4 font-bold text-background transition-opacity hover:opacity-90 disabled:opacity-50"
      >
        {loading ? <Loader2 className="h-5 w-5 animate-spin" /> : 'Submit for Moderation'}
      </button>
    </form>
  );
}
