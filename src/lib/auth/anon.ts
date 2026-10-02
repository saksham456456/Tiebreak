import { cookies } from 'next/headers';
import crypto from 'crypto';

const COOKIE_NAME = 'tiebreak_anon_id';

function signValue(value: string, secret: string): string {
  const hmac = crypto.createHmac('sha256', secret);
  hmac.update(value);
  return `${value}.${hmac.digest('base64url')}`;
}

function verifyValue(signedValue: string, secret: string): string | null {
  const parts = signedValue.split('.');
  if (parts.length !== 2) return null;

  const [value, signature] = parts;
  const hmac = crypto.createHmac('sha256', secret);
  hmac.update(value);
  const expectedSignature = hmac.digest('base64url');

  // Timing safe equal
  if (expectedSignature.length !== signature.length) return null;
  if (!crypto.timingSafeEqual(Buffer.from(expectedSignature), Buffer.from(signature))) return null;

  return value;
}

export async function getAnonId(): Promise<string | null> {
  const cookieStore = await cookies();
  const secret = process.env.ANON_COOKIE_SECRET || 'dev_secret_fallback_only';

  const cookie = cookieStore.get(COOKIE_NAME);
  if (!cookie) return null;

  return verifyValue(cookie.value, secret);
}

export async function setAnonId(uuid: string): Promise<void> {
  const cookieStore = await cookies();
  const secret = process.env.ANON_COOKIE_SECRET || 'dev_secret_fallback_only';

  const signed = signValue(uuid, secret);

  cookieStore.set(COOKIE_NAME, signed, {
    httpOnly: true,
    sameSite: 'lax',
    secure: process.env.NODE_ENV === 'production',
    maxAge: 60 * 60 * 24 * 400, // 400 days
    path: '/',
  });
}

export function hashIp(ip: string): string {
  const salt = process.env.HASH_SALT || 'salt';
  return crypto
    .createHash('sha256')
    .update(ip + salt)
    .digest('hex');
}
