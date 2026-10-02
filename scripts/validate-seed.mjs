import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const BANNED_TERMS = ['hateful', 'sexual', 'defamatory'];

function validateSeedData() {
  const seedDir = path.join(__dirname, '../data/seed');
  const files = fs.readdirSync(seedDir).filter((f) => f.endsWith('.json'));

  let totalItems = 0;
  const globalSlugs = new Set();

  for (const file of files) {
    const filePath = path.join(seedDir, file);
    const data = JSON.parse(fs.readFileSync(filePath, 'utf-8'));

    if (!data.name || !data.slug || !Array.isArray(data.items)) {
      throw new Error(`Invalid category structure in ${file}`);
    }

    for (const item of data.items) {
      if (!item.name || !item.slug || !item.descriptor || !Array.isArray(item.attributes)) {
        throw new Error(`Invalid item structure for ${item.name || item.slug} in ${file}`);
      }

      if (globalSlugs.has(item.slug)) {
        throw new Error(`Duplicate slug found: ${item.slug}`);
      }
      globalSlugs.add(item.slug);

      const textToScan = (item.name + ' ' + item.descriptor).toLowerCase();
      for (const term of BANNED_TERMS) {
        if (textToScan.includes(term)) {
          throw new Error(`Banned term found in item ${item.name}`);
        }
      }

      totalItems++;
    }
  }

  console.log(`Validated ${totalItems} items across ${files.length} categories.`);
  if (totalItems < 900) {
    console.warn(`WARNING: Only ${totalItems} items found. Expected at least 900.`);
  } else {
    console.log('✅ Seed data validation passed.');
  }
}

validateSeedData();
