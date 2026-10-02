import { test, expect } from '@playwright/test';

test.describe('Phase 0 Foundation Smoke Tests', () => {
  test('API health check returns 200 ok', async ({ request }) => {
    const res = await request.get('/api/health');
    expect(res.status()).toBe(200);
    const body = await res.json();
    expect(body.status).toBe('ok');
  });

  test('Styleguide page renders Section 5 tokens', async ({ page }) => {
    await page.goto('/styleguide');
    await expect(page.locator('h1')).toContainText('Tiebreak Style Guide');
    await expect(page.getByText('Section 5 Tokens')).toBeVisible();
    await expect(page.getByText('Space Grotesk')).toBeVisible();
    await expect(page.getByText('Contender A (Cyan)')).toBeVisible();
    await expect(page.getByText('Contender B (Flame)')).toBeVisible();
  });
});
