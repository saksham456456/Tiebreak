const fs = require('fs');
const path = require('path');

const publicFiles = [
  'src/app/leaderboard/[category]/page.tsx',
  'src/app/versus/[lo]/[hi]/page.tsx',
  'src/app/api/v1/rankings/[category]/route.ts',
  'src/app/api/stats/route.ts',
  'src/app/api/pairs/route.ts',
  'src/app/submit/page.tsx' // submit page just reads categories
];

const adminFiles = [
  'src/app/admin/page.tsx',
  'src/app/api/cron/flush/route.ts',
  'src/app/api/submit/route.ts',
  'src/app/api/taste/compare/route.ts'
];

// 1. Process Admin/Write files: Replace with getServiceClient()
for (const file of adminFiles) {
  const filePath = path.join(process.cwd(), file);
  if (!fs.existsSync(filePath)) {
    console.log("Missing " + file);
    continue;
  }
  let content = fs.readFileSync(filePath, 'utf8');

  // Remove the old manual createClient and environment variables
  if (content.includes("const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';")) {
    content = content.replace("const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';\n", "");
    content = content.replace("const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';\n", "");
    content = content.replace("const supabase = createClient(supabaseUrl, supabaseKey);\n", "");
    content = content.replace("import { createClient } from '@supabase/supabase-js';", "import { getServiceClient } from '@/lib/supabase/admin';\nconst supabase = getServiceClient();");
  } else if (file.includes('flush/route.ts') || file.includes('stats/route.ts')) {
    // We will handle them manually later
  }

  fs.writeFileSync(filePath, content);
}

// 2. Process Public files: Use server client
for (const file of publicFiles) {
  const filePath = path.join(process.cwd(), file);
  if (!fs.existsSync(filePath)) {
    console.log("Missing " + file);
    continue;
  }
  let content = fs.readFileSync(filePath, 'utf8');

  // Replace manual with server client
  if (content.includes("const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';")) {
    content = content.replace("const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || 'http://localhost:8000';\n", "");
    content = content.replace("const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'anon';\n", "");
    content = content.replace("const supabase = createClient(supabaseUrl, supabaseKey);\n", "");
    
    // Replace the import
    content = content.replace("import { createClient } from '@supabase/supabase-js';", "import { createClient } from '@/lib/supabase/server';");
    
    // Add `const supabase = await createClient();` inside the async function.
    // We will do this carefully for each.
  }
  
  fs.writeFileSync(filePath, content);
}
