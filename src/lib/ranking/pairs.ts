export interface PoolItem {
  id: string;
  rating: number;
  rd: number;
  vote_count: number;
  alias_cluster_id?: string | null;
}

/**
 * Probabilistically picks an item weighted by its RD.
 * Higher RD -> higher chance of being picked.
 */
export function pickWeightedByRD(items: PoolItem[]): PoolItem | null {
  if (items.length === 0) return null;
  const totalRd = items.reduce((sum, item) => sum + item.rd, 0);
  let rand = Math.random() * totalRd;
  for (const item of items) {
    rand -= item.rd;
    if (rand <= 0) return item;
  }
  return items[items.length - 1];
}

/**
 * Returns a subset of items within +/- ratingTolerance of baseItem.
 */
export function getItemsWithinRating(
  items: PoolItem[],
  baseItem: PoolItem,
  ratingTolerance: number = 150
): PoolItem[] {
  return items.filter(
    (item) => Math.abs(item.rating - baseItem.rating) <= ratingTolerance && item.id !== baseItem.id
  );
}
