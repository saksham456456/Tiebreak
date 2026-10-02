import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

function generateSeedSql() {
  const seedDir = path.join(__dirname, '../data/seed');
  const files = fs.readdirSync(seedDir).filter((f) => f.endsWith('.json'));

  let sql = '-- Auto-generated seed data\n\n';

  for (const file of files) {
    const filePath = path.join(seedDir, file);
    const data = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    sql += `INSERT INTO categories (id, slug, locale, name, description) VALUES (gen_random_uuid(), '${data.slug}', 'en', '${data.name.replace(/'/g, "''")}', 'Seed category') ON CONFLICT (slug, locale) DO NOTHING;\n`;

    // We need to fetch the category ID or do a nested insert. Let's use a CTE.
    sql += `
DO $$
DECLARE
  cat_id uuid;
BEGIN
  SELECT id INTO cat_id FROM categories WHERE slug = '${data.slug}' AND locale = 'en';
`;

    for (const item of data.items) {
      const attrs = JSON.stringify(item.attributes);
      sql += `
  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, '${item.slug}', 'en', '${item.name.replace(/'/g, "''")}', '${item.descriptor.replace(/'/g, "''")}', '${attrs}')
  ON CONFLICT (slug, locale) DO NOTHING;
`;
    }

    sql += `END $$;\n\n`;
  }

  const outPath = path.join(__dirname, '../supabase/seed.sql');
  fs.writeFileSync(outPath, sql);
  console.log(`Generated ${outPath}`);
}

generateSeedSql();
