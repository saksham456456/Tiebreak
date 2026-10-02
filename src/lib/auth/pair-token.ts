import crypto from 'crypto';

export function getPairPayload(itemA: string, itemB: string, categoryId: string, anonId: string, expiry: number) {
  const [first, second] = itemA < itemB ? [itemA, itemB] : [itemB, itemA];
  return `${first}|${second}|${categoryId}|${anonId}|${expiry}`;
}

export function signPairToken(
  itemA: string,
  itemB: string,
  categoryId: string,
  anonId: string,
  expiry: number
): string {
  const secret = process.env.PAIR_TOKEN_SECRET || 'dev_pair_secret';
  const hmac = crypto.createHmac('sha256', secret);
  const payload = getPairPayload(itemA, itemB, categoryId, anonId, expiry);
  hmac.update(payload);
  return `${payload}|${hmac.digest('base64url')}`;
}

export function verifyPairToken(
  token: string,
  itemA: string,
  itemB: string,
  anonId: string
): { valid: boolean; categoryId?: string } {
  const parts = token.split('|');
  if (parts.length !== 6) return { valid: false };
  
  const [tItemA, tItemB, tCategoryId, tAnonId, tExpiryStr, tSignature] = parts;
  const expiry = parseInt(tExpiryStr, 10);
  
  const [first, second] = itemA < itemB ? [itemA, itemB] : [itemB, itemA];
  
  if (tItemA !== first || tItemB !== second || tAnonId !== anonId) {
    return { valid: false };
  }
  
  if (Date.now() > expiry) {
    return { valid: false };
  }
  
  const secret = process.env.PAIR_TOKEN_SECRET || 'dev_pair_secret';
  const hmac = crypto.createHmac('sha256', secret);
  const payload = getPairPayload(itemA, itemB, tCategoryId, anonId, expiry);
  hmac.update(payload);
  const expectedSignature = hmac.digest('base64url');
  
  if (expectedSignature.length !== tSignature.length) return { valid: false };
  if (!crypto.timingSafeEqual(Buffer.from(expectedSignature), Buffer.from(tSignature))) {
    return { valid: false };
  }

  return { valid: true, categoryId: tCategoryId };
}
