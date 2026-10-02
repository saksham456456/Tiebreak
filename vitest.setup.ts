import '@testing-library/jest-dom/vitest';

// Inject mock environment variables for unit test runs
process.env.NEXT_PUBLIC_SITE_URL = 'http://localhost:3000';
process.env.NEXT_PUBLIC_SUPABASE_URL = 'https://placeholder.supabase.co';
process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = 'placeholder-anon-key';
process.env.SUPABASE_SERVICE_ROLE_KEY = 'placeholder-service-role-key';
process.env.UPSTASH_REDIS_REST_URL = 'https://placeholder.upstash.io';
process.env.UPSTASH_REDIS_REST_TOKEN = 'placeholder-token';

import { vi } from 'vitest';

// Mock next/font/google in unit test runner
vi.mock('next/font/google', () => ({
  Space_Grotesk: vi.fn().mockImplementation(() => ({
    className: 'font-space-grotesk',
    variable: '--font-space-grotesk',
    style: { fontFamily: 'Space Grotesk' },
  })),
  Inter: vi.fn().mockImplementation(() => ({
    className: 'font-inter',
    variable: '--font-inter',
    style: { fontFamily: 'Inter' },
  })),
  JetBrains_Mono: vi.fn().mockImplementation(() => ({
    className: 'font-jetbrains-mono',
    variable: '--font-jetbrains-mono',
    style: { fontFamily: 'JetBrains Mono' },
  })),
}));
