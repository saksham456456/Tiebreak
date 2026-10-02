import { test, expect } from '@playwright/test';

test.describe('Phase 0 Foundation — E2E Test Suite', () => {
  // =========================================================================
  // TIER 1: Feature Coverage (Happy Path)
  // =========================================================================
  test.describe('Tier 1: Feature Coverage', () => {
    test('T1.1: Health check API returns HTTP 200 with ok status and valid telemetry', async ({
      request,
    }) => {
      const response = await request.get('/api/health');
      expect(response.status()).toBe(200);

      const contentType = response.headers()['content-type'];
      expect(contentType).toMatch(/application\/json/i);

      const body = await response.json();
      expect(body).toBeDefined();
      expect(body.status).toBe('ok');
      expect(typeof body.timestamp).toBe('string');
      expect(typeof body.uptime).toBe('number');
      expect(body.services).toBeDefined();
      expect(typeof body.services.redis).toBe('string');
      expect(typeof body.services.supabase).toBe('string');
    });

    test('T1.2: Styleguide page renders main title, Section 5 badge, and typography tokens', async ({
      page,
    }) => {
      await page.goto('/styleguide');
      await expect(page).toHaveTitle(/Tiebreak/i);

      // Verify main heading and Section 5 badge
      const header = page.locator('h1');
      await expect(header).toContainText('Tiebreak Style Guide');
      await expect(page.getByText('Section 5 Tokens')).toBeVisible();

      // Verify font showcase sections
      await expect(page.getByText('Space Grotesk', { exact: false }).first()).toBeVisible();
      await expect(page.getByText('Inter', { exact: false }).first()).toBeVisible();
      await expect(page.getByText('JetBrains Mono', { exact: false }).first()).toBeVisible();
    });

    test('T1.3: Google font CSS variables or font classes are present on the document root', async ({
      page,
    }) => {
      await page.goto('/styleguide');

      const htmlClasses = await page.locator('html').getAttribute('class');
      expect(htmlClasses).toBeDefined();

      // Ensure font variables (or next/font classes) are injected
      const bodyHasFont = await page.evaluate(() => {
        const root = document.documentElement;
        const body = document.body;
        const rootClass = root.className;
        const bodyClass = body.className;
        return (
          rootClass.includes('font') ||
          bodyClass.includes('font') ||
          rootClass.includes('grotesk') ||
          rootClass.includes('inter')
        );
      });
      expect(bodyHasFont).toBe(true);
    });

    test('T1.4: Contender tokens A and B are rendered in the styleguide', async ({ page }) => {
      await page.goto('/styleguide');

      await expect(page.getByText('CONTENDER A')).toBeVisible();
      await expect(page.getByText('CONTENDER B')).toBeVisible();
    });
  });

  // =========================================================================
  // TIER 2: Boundary & Corner Cases
  // =========================================================================
  test.describe('Tier 2: Boundary & Corner Cases', () => {
    test('T2.1: Unsupported HTTP methods on /api/health return graceful status (not 500)', async ({
      request,
    }) => {
      // POST on GET-only endpoint should return 405 or handle gracefully without throwing 500
      const postResponse = await request.post('/api/health', {
        data: { test: 'payload' },
      });
      expect(postResponse.status()).not.toBe(500);
      expect([200, 405]).toContain(postResponse.status());

      // DELETE on GET-only endpoint
      const deleteResponse = await request.delete('/api/health');
      expect(deleteResponse.status()).not.toBe(500);
      expect([200, 405]).toContain(deleteResponse.status());
    });

    test('T2.2: Styleguide handles unexpected URL query parameters without throwing errors', async ({
      page,
    }) => {
      // Test arbitrary query params & special characters
      const response = await page.goto('/styleguide?theme=dark&variant=test&param=%3Cscript%3E');
      expect(response?.status()).toBe(200);

      // Verify the page still renders properly
      await expect(page.locator('h1')).toContainText('Tiebreak Style Guide');
      await expect(page.getByText('Section 5 Tokens')).toBeVisible();
    });

    test('T2.3: Theme toggle button switches dark and light modes cleanly', async ({ page }) => {
      await page.goto('/styleguide');

      const html = page.locator('html');
      const themeToggleBtn = page.getByRole('button', { name: /mode/i });
      await expect(themeToggleBtn).toBeVisible();

      // Check initial theme class
      const initialClass = await html.getAttribute('class');
      const isInitiallyDark = initialClass?.includes('dark') ?? false;

      // Click toggle
      await themeToggleBtn.click();

      // Class should have updated
      const updatedClass = await html.getAttribute('class');
      if (isInitiallyDark) {
        expect(updatedClass?.includes('dark')).toBe(false);
      } else {
        expect(updatedClass?.includes('dark')).toBe(true);
      }

      // Click again to toggle back
      await themeToggleBtn.click();
      const revertedClass = await html.getAttribute('class');
      expect(revertedClass?.includes('dark')).toBe(isInitiallyDark);
    });
  });

  // =========================================================================
  // TIER 3: Cross-Feature Interactions
  // =========================================================================
  test.describe('Tier 3: Cross-Feature Interactions', () => {
    test('T3.1: Interactive pairwise matchup voting simulates client state and button feedback', async ({
      page,
    }) => {
      await page.goto('/styleguide');

      const voteContenderABtn = page.getByRole('button', { name: /Vote Djokovic/i });
      const voteContenderBBtn = page.getByRole('button', { name: /Vote Nadal/i });

      await expect(voteContenderABtn).toBeVisible();
      await expect(voteContenderBBtn).toBeVisible();

      // Vote for Contender A
      await voteContenderABtn.click();
      await expect(page.getByRole('button', { name: /✓ Voted Winner/i })).toBeVisible();

      // Reset button should appear
      const resetBtn = page.getByText(/Reset Matchup Vote/i);
      await expect(resetBtn).toBeVisible();

      // Switch vote to Contender B
      await voteContenderBBtn.click();
      await expect(page.getByRole('button', { name: /✓ Voted Winner/i })).toBeVisible();

      // Reset vote
      await resetBtn.click();
      await expect(page.getByRole('button', { name: /Vote Djokovic/i })).toBeVisible();
      await expect(page.getByRole('button', { name: /Vote Nadal/i })).toBeVisible();
    });

    test('T3.2: Health API correctly reflects unconfigured external services without throwing errors', async ({
      request,
    }) => {
      const response = await request.get('/api/health');
      expect(response.status()).toBe(200);

      const body = await response.json();
      expect(body.services).toBeDefined();

      // In testing/development without live credentials, services should report valid status strings
      expect(['connected', 'unconfigured', 'error']).toContain(body.services.redis);
      expect(['configured', 'unconfigured']).toContain(body.services.supabase);
    });

    test('T3.3: Styleguide live mockup reflects Section 5 ELO and Rank badges', async ({
      page,
    }) => {
      await page.goto('/styleguide');

      // Rank badges
      await expect(page.getByText('RANK #1')).toBeVisible();
      await expect(page.getByText('RANK #2')).toBeVisible();

      // ELO indicators
      await expect(page.getByText('+14.2')).toBeVisible();
      await expect(page.getByText('+11.8')).toBeVisible();

      // Central VS badge
      await expect(page.getByText('VS')).toBeVisible();
    });
  });

  // =========================================================================
  // TIER 4: Real-World Scenarios & Design System Audits
  // =========================================================================
  test.describe('Tier 4: Real-World Scenarios', () => {
    test('T4.1: Health API payload conforms to strict telemetry contract', async ({ request }) => {
      const response = await request.get('/api/health');
      expect(response.status()).toBe(200);

      const body = await response.json();

      // 1. Status must be exactly 'ok'
      expect(body.status).toBe('ok');

      // 2. Timestamp must be a valid ISO-8601 string within the past 1 minute
      const timestampMs = Date.parse(body.timestamp);
      expect(Number.isNaN(timestampMs)).toBe(false);
      const diffSec = Math.abs(Date.now() - timestampMs) / 1000;
      expect(diffSec).toBeLessThan(60);

      // 3. Uptime must be a positive non-negative number
      expect(typeof body.uptime).toBe('number');
      expect(body.uptime).toBeGreaterThanOrEqual(0);

      // 4. Version must be a non-empty string
      expect(typeof body.version).toBe('string');
      expect(body.version.length).toBeGreaterThan(0);

      // 5. Environment must be string
      expect(typeof body.environment).toBe('string');
    });

    test('T4.2: Design System Audit: all Section 5 color swatches are rendered with labels and CSS vars', async ({
      page,
    }) => {
      await page.goto('/styleguide');

      // Verify category headers
      await expect(page.getByText('Theme Surfaces')).toBeVisible();
      await expect(page.getByText('Brand & Feedback')).toBeVisible();
      await expect(page.getByText('Sports & Voting')).toBeVisible();
      await expect(page.getByText('Podium Ranks')).toBeVisible();

      // Verify essential CSS variable names are visible in the swatches grid
      const requiredVars = [
        '--background',
        '--card',
        '--primary',
        '--secondary',
        '--destructive',
        '--contender-a',
        '--contender-b',
        '--rating-up',
        '--rating-down',
        '--rank-gold',
        '--rank-silver',
        '--rank-bronze',
      ];

      for (const cssVar of requiredVars) {
        await expect(page.getByText(cssVar).first()).toBeVisible();
      }
    });

    test('T4.3: Navigation from Homepage to Styleguide works seamlessly', async ({ page }) => {
      await page.goto('/');

      // Check if homepage loads
      await expect(page).toHaveTitle(/Tiebreak/i);

      // Look for a link to styleguide if present, or navigate directly
      const styleguideLink = page.getByRole('link', { name: /style\s*guide/i });
      if (await styleguideLink.isVisible()) {
        await styleguideLink.click();
        await expect(page).toHaveURL(/.*styleguide/);
        await expect(page.locator('h1')).toContainText('Tiebreak Style Guide');
      } else {
        await page.goto('/styleguide');
        await expect(page.locator('h1')).toContainText('Tiebreak Style Guide');
      }
    });
  });
});
