import type { NextConfig } from 'next';

const baseCsp = "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://challenges.cloudflare.com; style-src 'self' 'unsafe-inline'; img-src 'self' data: blob: https:; font-src 'self' data:; connect-src 'self' https: wss:; frame-src 'self' https://challenges.cloudflare.com;";

const permissionsPolicy = "camera=(), microphone=(), geolocation=(), browsing-topics=()";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  async headers() {
    return [
      {
        source: '/((?!embed/).*)',
        headers: [
          {
            key: 'X-Frame-Options',
            value: 'DENY',
          },
          {
            key: 'X-Content-Type-Options',
            value: 'nosniff',
          },
          {
            key: 'Referrer-Policy',
            value: 'strict-origin-when-cross-origin',
          },
          {
            key: 'Strict-Transport-Security',
            value: 'max-age=31536000; includeSubDomains; preload',
          },
          {
            key: 'Content-Security-Policy',
            value: `${baseCsp} frame-ancestors 'none';`,
          },
          {
            key: 'Permissions-Policy',
            value: permissionsPolicy,
          }
        ],
      },
      {
        source: '/embed/:path*',
        headers: [
          {
            key: 'X-Content-Type-Options',
            value: 'nosniff',
          },
          {
            key: 'Referrer-Policy',
            value: 'strict-origin-when-cross-origin',
          },
          {
            key: 'Strict-Transport-Security',
            value: 'max-age=31536000; includeSubDomains; preload',
          },
          {
            key: 'Content-Security-Policy',
            value: `${baseCsp} frame-ancestors *;`,
          },
          {
            key: 'Permissions-Policy',
            value: permissionsPolicy,
          }
        ],
      },
    ];
  },
};

export default nextConfig;
