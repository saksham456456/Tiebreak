-- Auto-generated seed data

INSERT INTO categories (id, slug, locale, name, description) VALUES (gen_random_uuid(), 'dev-tools', 'en', 'Dev Tools and Tech', 'Seed category') ON CONFLICT (slug, locale) DO NOTHING;

DO $$
DECLARE
  cat_id uuid;
BEGIN
  SELECT id INTO cat_id FROM categories WHERE slug = 'dev-tools' AND locale = 'en';

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'python-lang', 'en', 'Python', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'javascript-lang', 'en', 'JavaScript', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'typescript-lang', 'en', 'TypeScript', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'java-lang', 'en', 'Java', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'c-lang', 'en', 'C', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cpp-lang', 'en', 'C++', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'csharp-lang', 'en', 'C#', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'go-lang', 'en', 'Go', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rust-lang', 'en', 'Rust', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kotlin-lang', 'en', 'Kotlin', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'swift-lang', 'en', 'Swift', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'php-lang', 'en', 'PHP', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ruby-lang', 'en', 'Ruby', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dart-lang', 'en', 'Dart', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'scala-lang', 'en', 'Scala', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'elixir-lang', 'en', 'Elixir', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'haskell-lang', 'en', 'Haskell', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lua-lang', 'en', 'Lua', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'r-lang', 'en', 'R', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'julia-lang', 'en', 'Julia', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'perl-lang', 'en', 'Perl', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zig-lang', 'en', 'Zig', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nim-lang', 'en', 'Nim', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ocaml-lang', 'en', 'OCaml', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'clojure-lang', 'en', 'Clojure', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fsharp-lang', 'en', 'F#', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'erlang-lang', 'en', 'Erlang', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'objective-c-lang', 'en', 'Objective-C', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'assembly-lang', 'en', 'Assembly', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sql-lang', 'en', 'SQL', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bash-lang', 'en', 'Bash', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'powershell-lang', 'en', 'PowerShell', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'matlab-lang', 'en', 'MATLAB', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fortran-lang', 'en', 'Fortran', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cobol-lang', 'en', 'COBOL', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lisp-lang', 'en', 'Lisp', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'racket-lang', 'en', 'Racket', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'crystal-lang', 'en', 'Crystal', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'v-lang', 'en', 'V', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'solidity-lang', 'en', 'Solidity', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'groovy-lang', 'en', 'Groovy', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'visual-basic-lang', 'en', 'Visual Basic', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'delphi-lang', 'en', 'Delphi', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ada-lang', 'en', 'Ada', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'prolog-lang', 'en', 'Prolog', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'smalltalk-lang', 'en', 'Smalltalk', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'elm-lang', 'en', 'Elm', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gleam-lang', 'en', 'Gleam', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mojo-lang', 'en', 'Mojo', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'carbon-lang', 'en', 'Carbon', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'coffeescript-lang', 'en', 'CoffeeScript', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'scheme-lang', 'en', 'Scheme', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'd-lang', 'en', 'D', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hack-lang', 'en', 'Hack', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'raku-lang', 'en', 'Raku', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'move-lang', 'en', 'Move', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'webassembly-lang', 'en', 'WebAssembly', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vala-lang', 'en', 'Vala', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pascal-lang', 'en', 'Pascal', 'A popular lang tech item.', '["lang","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'react-front', 'en', 'React', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vue-front', 'en', 'Vue', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'angular-front', 'en', 'Angular', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'svelte-front', 'en', 'Svelte', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'solidjs-front', 'en', 'SolidJS', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'qwik-front', 'en', 'Qwik', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'astro-front', 'en', 'Astro', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'next-js-front', 'en', 'Next.js', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nuxt-front', 'en', 'Nuxt', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'remix-front', 'en', 'Remix', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sveltekit-front', 'en', 'SvelteKit', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'preact-front', 'en', 'Preact', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'alpine-js-front', 'en', 'Alpine.js', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'htmx-front', 'en', 'HTMX', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lit-front', 'en', 'Lit', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ember-front', 'en', 'Ember', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'backbone-front', 'en', 'Backbone', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jquery-front', 'en', 'jQuery', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'stimulus-front', 'en', 'Stimulus', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mithril-front', 'en', 'Mithril', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'marko-front', 'en', 'Marko', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fresh-front', 'en', 'Fresh', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gatsby-front', 'en', 'Gatsby', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'eleventy-front', 'en', 'Eleventy', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vite-front', 'en', 'Vite', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'webpack-front', 'en', 'Webpack', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'parcel-front', 'en', 'Parcel', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'turbopack-front', 'en', 'Turbopack', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'esbuild-front', 'en', 'esbuild', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rollup-front', 'en', 'Rollup', 'A popular front tech item.', '["front","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'express-back', 'en', 'Express', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fastify-back', 'en', 'Fastify', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nestjs-back', 'en', 'NestJS', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'django-back', 'en', 'Django', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'flask-back', 'en', 'Flask', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fastapi-back', 'en', 'FastAPI', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rails-back', 'en', 'Rails', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'laravel-back', 'en', 'Laravel', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'spring-boot-back', 'en', 'Spring Boot', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'asp-net-core-back', 'en', 'ASP.NET Core', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'phoenix-back', 'en', 'Phoenix', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gin-back', 'en', 'Gin', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fiber-back', 'en', 'Fiber', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'actix-back', 'en', 'Actix', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'axum-back', 'en', 'Axum', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hono-back', 'en', 'Hono', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'koa-back', 'en', 'Koa', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'symfony-back', 'en', 'Symfony', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'quarkus-back', 'en', 'Quarkus', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'micronaut-back', 'en', 'Micronaut', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'deno-fresh-back', 'en', 'Deno Fresh', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bun-back', 'en', 'Bun', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'elysia-back', 'en', 'Elysia', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'adonisjs-back', 'en', 'AdonisJS', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'strapi-back', 'en', 'Strapi', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sails-back', 'en', 'Sails', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'play-back', 'en', 'Play', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ktor-back', 'en', 'Ktor', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vapor-back', 'en', 'Vapor', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rocket-back', 'en', 'Rocket', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'echo-back', 'en', 'Echo', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tornado-back', 'en', 'Tornado', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sinatra-back', 'en', 'Sinatra', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hapi-back', 'en', 'Hapi', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cakephp-back', 'en', 'CakePHP', 'A popular back tech item.', '["back","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'postgresql-db', 'en', 'PostgreSQL', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mysql-db', 'en', 'MySQL', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sqlite-db', 'en', 'SQLite', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mongodb-db', 'en', 'MongoDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'redis-db', 'en', 'Redis', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cassandra-db', 'en', 'Cassandra', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dynamodb-db', 'en', 'DynamoDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'firestore-db', 'en', 'Firestore', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'supabase-db', 'en', 'Supabase', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'planetscale-db', 'en', 'PlanetScale', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cockroachdb-db', 'en', 'CockroachDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'clickhouse-db', 'en', 'ClickHouse', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'duckdb-db', 'en', 'DuckDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'neo4j-db', 'en', 'Neo4j', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'elasticsearch-db', 'en', 'Elasticsearch', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mariadb-db', 'en', 'MariaDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'oracle-db', 'en', 'Oracle', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sql-server-db', 'en', 'SQL Server', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'couchbase-db', 'en', 'Couchbase', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'valkey-db', 'en', 'Valkey', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'surrealdb-db', 'en', 'SurrealDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tidb-db', 'en', 'TiDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'turso-db', 'en', 'Turso', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'neon-db', 'en', 'Neon', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pinecone-db', 'en', 'Pinecone', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pgvector-db', 'en', 'pgvector', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'influxdb-db', 'en', 'InfluxDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'timescaledb-db', 'en', 'TimescaleDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rethinkdb-db', 'en', 'RethinkDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'faunadb-db', 'en', 'FaunaDB', 'A popular db tech item.', '["db","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vs-code-editor', 'en', 'VS Code', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'neovim-editor', 'en', 'Neovim', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vim-editor', 'en', 'Vim', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'emacs-editor', 'en', 'Emacs', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jetbrains-intellij-editor', 'en', 'JetBrains IntelliJ', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'webstorm-editor', 'en', 'WebStorm', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pycharm-editor', 'en', 'PyCharm', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sublime-text-editor', 'en', 'Sublime Text', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cursor-editor', 'en', 'Cursor', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zed-editor', 'en', 'Zed', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'windsurf-editor', 'en', 'Windsurf', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'xcode-editor', 'en', 'Xcode', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'android-studio-editor', 'en', 'Android Studio', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'visual-studio-editor', 'en', 'Visual Studio', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'atom-editor', 'en', 'Atom', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'helix-editor', 'en', 'Helix', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'notepadpp-editor', 'en', 'Notepad++', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nano-editor', 'en', 'Nano', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'eclipse-editor', 'en', 'Eclipse', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fleet-editor', 'en', 'Fleet', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kate-editor', 'en', 'Kate', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bbedit-editor', 'en', 'BBEdit', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lapce-editor', 'en', 'Lapce', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'micro-editor', 'en', 'Micro', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kakoune-editor', 'en', 'Kakoune', 'A popular editor tech item.', '["editor","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'claude-code-ai', 'en', 'Claude Code', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'github-copilot-ai', 'en', 'GitHub Copilot', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cursor-ai', 'en', 'Cursor', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'windsurf-ai', 'en', 'Windsurf', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'codex-ai', 'en', 'Codex', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gemini-cli-ai', 'en', 'Gemini CLI', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'aider-ai', 'en', 'Aider', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cline-ai', 'en', 'Cline', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'continue-ai', 'en', 'Continue', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tabnine-ai', 'en', 'Tabnine', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'replit-agent-ai', 'en', 'Replit Agent', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lovable-ai', 'en', 'Lovable', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bolt-ai', 'en', 'Bolt', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'v0-ai', 'en', 'v0', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'devin-ai', 'en', 'Devin', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amazon-q-ai', 'en', 'Amazon Q', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jetbrains-ai-ai', 'en', 'JetBrains AI', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sourcegraph-cody-ai', 'en', 'Sourcegraph Cody', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'supermaven-ai', 'en', 'Supermaven', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zed-ai-ai', 'en', 'Zed AI', 'A popular ai tech item.', '["ai","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vercel-cloud', 'en', 'Vercel', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'netlify-cloud', 'en', 'Netlify', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cloudflare-cloud', 'en', 'Cloudflare', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'aws-cloud', 'en', 'AWS', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'google-cloud-cloud', 'en', 'Google Cloud', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'azure-cloud', 'en', 'Azure', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'digitalocean-cloud', 'en', 'DigitalOcean', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'render-cloud', 'en', 'Render', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'railway-cloud', 'en', 'Railway', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fly-io-cloud', 'en', 'Fly.io', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'heroku-cloud', 'en', 'Heroku', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hetzner-cloud', 'en', 'Hetzner', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'linode-cloud', 'en', 'Linode', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vultr-cloud', 'en', 'Vultr', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'supabase-cloud', 'en', 'Supabase', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'firebase-cloud', 'en', 'Firebase', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'deno-deploy-cloud', 'en', 'Deno Deploy', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'github-pages-cloud', 'en', 'GitHub Pages', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'oracle-cloud-cloud', 'en', 'Oracle Cloud', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ovh-cloud', 'en', 'OVH', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'scaleway-cloud', 'en', 'Scaleway', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'coolify-cloud', 'en', 'Coolify', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dokploy-cloud', 'en', 'Dokploy', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'appwrite-cloud', 'en', 'Appwrite', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'convex-cloud', 'en', 'Convex', 'A popular cloud tech item.', '["cloud","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tailwind-css', 'en', 'Tailwind', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bootstrap-css', 'en', 'Bootstrap', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'shadcn-ui-css', 'en', 'shadcn/ui', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'material-ui-css', 'en', 'Material UI', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chakra-ui-css', 'en', 'Chakra UI', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ant-design-css', 'en', 'Ant Design', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bulma-css', 'en', 'Bulma', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sass-css', 'en', 'Sass', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'css-modules-css', 'en', 'CSS Modules', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'styled-components-css', 'en', 'styled-components', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'emotion-css', 'en', 'Emotion', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'radix-css', 'en', 'Radix', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'daisyui-css', 'en', 'DaisyUI', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mantine-css', 'en', 'Mantine', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'headless-ui-css', 'en', 'Headless UI', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'unocss-css', 'en', 'UnoCSS', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'panda-css-css', 'en', 'Panda CSS', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'foundation-css', 'en', 'Foundation', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pico-css-css', 'en', 'Pico CSS', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'open-props-css', 'en', 'Open Props', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vanilla-css-css', 'en', 'Vanilla CSS', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'less-css', 'en', 'Less', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'postcss-css', 'en', 'PostCSS', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'stylus-css', 'en', 'Stylus', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'material-3-css', 'en', 'Material 3', 'A popular css tech item.', '["css","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'windows-11-os', 'en', 'Windows 11', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'macos-os', 'en', 'macOS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ubuntu-os', 'en', 'Ubuntu', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'arch-os', 'en', 'Arch', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'debian-os', 'en', 'Debian', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fedora-os', 'en', 'Fedora', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'linux-mint-os', 'en', 'Linux Mint', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pop-os-os', 'en', 'Pop!_OS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nixos-os', 'en', 'NixOS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'manjaro-os', 'en', 'Manjaro', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kali-os', 'en', 'Kali', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'alpine-os', 'en', 'Alpine', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gentoo-os', 'en', 'Gentoo', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'freebsd-os', 'en', 'FreeBSD', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chromeos-os', 'en', 'ChromeOS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'opensuse-os', 'en', 'openSUSE', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'elementary-os-os', 'en', 'Elementary OS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zorin-os', 'en', 'Zorin', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rocky-os', 'en', 'Rocky', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'void-os', 'en', 'Void', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'android-os', 'en', 'Android', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ios-os', 'en', 'iOS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'harmonyos-os', 'en', 'HarmonyOS', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tails-os', 'en', 'Tails', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'qubes-os', 'en', 'Qubes', 'A popular os tech item.', '["os","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tabs-vs-spaces-topic', 'en', 'Tabs vs Spaces', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'light-vs-dark-mode-topic', 'en', 'Light vs Dark mode', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rest-vs-graphql-topic', 'en', 'REST vs GraphQL', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'monolith-vs-microservices-topic', 'en', 'Monolith vs Microservices', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sql-vs-nosql-topic', 'en', 'SQL vs NoSQL', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'git-rebase-vs-merge-topic', 'en', 'Git rebase vs merge', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vim-vs-emacs-topic', 'en', 'Vim vs Emacs', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mac-vs-linux-for-dev-topic', 'en', 'Mac vs Linux for dev', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mechanical-vs-membrane-keyboards-topic', 'en', 'Mechanical vs membrane keyboards', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'remote-vs-office-topic', 'en', 'Remote vs Office', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'semicolons-vs-none-topic', 'en', 'Semicolons vs none', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'monorepo-vs-polyrepo-topic', 'en', 'Monorepo vs polyrepo', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'static-vs-dynamic-typing-topic', 'en', 'Static vs dynamic typing', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'standing-vs-sitting-desk-topic', 'en', 'Standing vs sitting desk', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'docker-vs-podman-topic', 'en', 'Docker vs Podman', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'npm-vs-pnpm-vs-yarn-vs-bun-topic', 'en', 'npm vs pnpm vs Yarn vs Bun', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'oop-vs-functional-topic', 'en', 'OOP vs Functional', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dark-roast-vs-light-roast-coffee-for-coding-topic', 'en', 'Dark roast vs Light roast coffee for coding', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chai-vs-coffee-topic', 'en', 'Chai vs Coffee', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'stack-overflow-vs-ai-chat-topic', 'en', 'Stack Overflow vs AI chat', 'A popular topic tech item.', '["topic","tech"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-294-dummy', 'en', 'Dummy Dev Tool 294', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-295-dummy', 'en', 'Dummy Dev Tool 295', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-296-dummy', 'en', 'Dummy Dev Tool 296', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-297-dummy', 'en', 'Dummy Dev Tool 297', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-298-dummy', 'en', 'Dummy Dev Tool 298', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-299-dummy', 'en', 'Dummy Dev Tool 299', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-300-dummy', 'en', 'Dummy Dev Tool 300', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-301-dummy', 'en', 'Dummy Dev Tool 301', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-302-dummy', 'en', 'Dummy Dev Tool 302', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-303-dummy', 'en', 'Dummy Dev Tool 303', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-304-dummy', 'en', 'Dummy Dev Tool 304', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-305-dummy', 'en', 'Dummy Dev Tool 305', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-306-dummy', 'en', 'Dummy Dev Tool 306', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-307-dummy', 'en', 'Dummy Dev Tool 307', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-308-dummy', 'en', 'Dummy Dev Tool 308', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-309-dummy', 'en', 'Dummy Dev Tool 309', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-310-dummy', 'en', 'Dummy Dev Tool 310', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-311-dummy', 'en', 'Dummy Dev Tool 311', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-312-dummy', 'en', 'Dummy Dev Tool 312', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-313-dummy', 'en', 'Dummy Dev Tool 313', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-314-dummy', 'en', 'Dummy Dev Tool 314', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-315-dummy', 'en', 'Dummy Dev Tool 315', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-316-dummy', 'en', 'Dummy Dev Tool 316', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-317-dummy', 'en', 'Dummy Dev Tool 317', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-318-dummy', 'en', 'Dummy Dev Tool 318', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-319-dummy', 'en', 'Dummy Dev Tool 319', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-320-dummy', 'en', 'Dummy Dev Tool 320', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-321-dummy', 'en', 'Dummy Dev Tool 321', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-322-dummy', 'en', 'Dummy Dev Tool 322', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-323-dummy', 'en', 'Dummy Dev Tool 323', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-324-dummy', 'en', 'Dummy Dev Tool 324', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-325-dummy', 'en', 'Dummy Dev Tool 325', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-326-dummy', 'en', 'Dummy Dev Tool 326', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-327-dummy', 'en', 'Dummy Dev Tool 327', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-328-dummy', 'en', 'Dummy Dev Tool 328', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-329-dummy', 'en', 'Dummy Dev Tool 329', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-330-dummy', 'en', 'Dummy Dev Tool 330', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-331-dummy', 'en', 'Dummy Dev Tool 331', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-332-dummy', 'en', 'Dummy Dev Tool 332', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-333-dummy', 'en', 'Dummy Dev Tool 333', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-334-dummy', 'en', 'Dummy Dev Tool 334', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-335-dummy', 'en', 'Dummy Dev Tool 335', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-336-dummy', 'en', 'Dummy Dev Tool 336', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-337-dummy', 'en', 'Dummy Dev Tool 337', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-338-dummy', 'en', 'Dummy Dev Tool 338', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-339-dummy', 'en', 'Dummy Dev Tool 339', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-340-dummy', 'en', 'Dummy Dev Tool 340', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-341-dummy', 'en', 'Dummy Dev Tool 341', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-342-dummy', 'en', 'Dummy Dev Tool 342', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-343-dummy', 'en', 'Dummy Dev Tool 343', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-344-dummy', 'en', 'Dummy Dev Tool 344', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-345-dummy', 'en', 'Dummy Dev Tool 345', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-346-dummy', 'en', 'Dummy Dev Tool 346', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-347-dummy', 'en', 'Dummy Dev Tool 347', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-348-dummy', 'en', 'Dummy Dev Tool 348', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-349-dummy', 'en', 'Dummy Dev Tool 349', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-350-dummy', 'en', 'Dummy Dev Tool 350', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-351-dummy', 'en', 'Dummy Dev Tool 351', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-352-dummy', 'en', 'Dummy Dev Tool 352', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-353-dummy', 'en', 'Dummy Dev Tool 353', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-354-dummy', 'en', 'Dummy Dev Tool 354', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-355-dummy', 'en', 'Dummy Dev Tool 355', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-356-dummy', 'en', 'Dummy Dev Tool 356', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-357-dummy', 'en', 'Dummy Dev Tool 357', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-358-dummy', 'en', 'Dummy Dev Tool 358', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-359-dummy', 'en', 'Dummy Dev Tool 359', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-360-dummy', 'en', 'Dummy Dev Tool 360', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-361-dummy', 'en', 'Dummy Dev Tool 361', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-362-dummy', 'en', 'Dummy Dev Tool 362', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-363-dummy', 'en', 'Dummy Dev Tool 363', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-364-dummy', 'en', 'Dummy Dev Tool 364', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-365-dummy', 'en', 'Dummy Dev Tool 365', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-366-dummy', 'en', 'Dummy Dev Tool 366', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-367-dummy', 'en', 'Dummy Dev Tool 367', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-368-dummy', 'en', 'Dummy Dev Tool 368', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-369-dummy', 'en', 'Dummy Dev Tool 369', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-370-dummy', 'en', 'Dummy Dev Tool 370', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-371-dummy', 'en', 'Dummy Dev Tool 371', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-372-dummy', 'en', 'Dummy Dev Tool 372', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-373-dummy', 'en', 'Dummy Dev Tool 373', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-374-dummy', 'en', 'Dummy Dev Tool 374', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-375-dummy', 'en', 'Dummy Dev Tool 375', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-376-dummy', 'en', 'Dummy Dev Tool 376', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-377-dummy', 'en', 'Dummy Dev Tool 377', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-378-dummy', 'en', 'Dummy Dev Tool 378', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-379-dummy', 'en', 'Dummy Dev Tool 379', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-380-dummy', 'en', 'Dummy Dev Tool 380', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-381-dummy', 'en', 'Dummy Dev Tool 381', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-382-dummy', 'en', 'Dummy Dev Tool 382', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-383-dummy', 'en', 'Dummy Dev Tool 383', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-384-dummy', 'en', 'Dummy Dev Tool 384', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-385-dummy', 'en', 'Dummy Dev Tool 385', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-386-dummy', 'en', 'Dummy Dev Tool 386', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-387-dummy', 'en', 'Dummy Dev Tool 387', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-388-dummy', 'en', 'Dummy Dev Tool 388', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-389-dummy', 'en', 'Dummy Dev Tool 389', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-390-dummy', 'en', 'Dummy Dev Tool 390', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-391-dummy', 'en', 'Dummy Dev Tool 391', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-392-dummy', 'en', 'Dummy Dev Tool 392', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-393-dummy', 'en', 'Dummy Dev Tool 393', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-394-dummy', 'en', 'Dummy Dev Tool 394', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-395-dummy', 'en', 'Dummy Dev Tool 395', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-396-dummy', 'en', 'Dummy Dev Tool 396', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-397-dummy', 'en', 'Dummy Dev Tool 397', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-398-dummy', 'en', 'Dummy Dev Tool 398', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-399-dummy', 'en', 'Dummy Dev Tool 399', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-400-dummy', 'en', 'Dummy Dev Tool 400', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-401-dummy', 'en', 'Dummy Dev Tool 401', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-402-dummy', 'en', 'Dummy Dev Tool 402', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-403-dummy', 'en', 'Dummy Dev Tool 403', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-404-dummy', 'en', 'Dummy Dev Tool 404', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-405-dummy', 'en', 'Dummy Dev Tool 405', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-406-dummy', 'en', 'Dummy Dev Tool 406', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-407-dummy', 'en', 'Dummy Dev Tool 407', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-408-dummy', 'en', 'Dummy Dev Tool 408', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-409-dummy', 'en', 'Dummy Dev Tool 409', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-410-dummy', 'en', 'Dummy Dev Tool 410', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-411-dummy', 'en', 'Dummy Dev Tool 411', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-412-dummy', 'en', 'Dummy Dev Tool 412', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-413-dummy', 'en', 'Dummy Dev Tool 413', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-414-dummy', 'en', 'Dummy Dev Tool 414', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-415-dummy', 'en', 'Dummy Dev Tool 415', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-416-dummy', 'en', 'Dummy Dev Tool 416', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-417-dummy', 'en', 'Dummy Dev Tool 417', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-418-dummy', 'en', 'Dummy Dev Tool 418', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-419-dummy', 'en', 'Dummy Dev Tool 419', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-420-dummy', 'en', 'Dummy Dev Tool 420', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-421-dummy', 'en', 'Dummy Dev Tool 421', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-422-dummy', 'en', 'Dummy Dev Tool 422', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-423-dummy', 'en', 'Dummy Dev Tool 423', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-424-dummy', 'en', 'Dummy Dev Tool 424', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-425-dummy', 'en', 'Dummy Dev Tool 425', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-426-dummy', 'en', 'Dummy Dev Tool 426', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-427-dummy', 'en', 'Dummy Dev Tool 427', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-428-dummy', 'en', 'Dummy Dev Tool 428', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-429-dummy', 'en', 'Dummy Dev Tool 429', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-430-dummy', 'en', 'Dummy Dev Tool 430', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-431-dummy', 'en', 'Dummy Dev Tool 431', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-432-dummy', 'en', 'Dummy Dev Tool 432', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-433-dummy', 'en', 'Dummy Dev Tool 433', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-434-dummy', 'en', 'Dummy Dev Tool 434', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-435-dummy', 'en', 'Dummy Dev Tool 435', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-436-dummy', 'en', 'Dummy Dev Tool 436', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-437-dummy', 'en', 'Dummy Dev Tool 437', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-438-dummy', 'en', 'Dummy Dev Tool 438', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-439-dummy', 'en', 'Dummy Dev Tool 439', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-440-dummy', 'en', 'Dummy Dev Tool 440', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-441-dummy', 'en', 'Dummy Dev Tool 441', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-442-dummy', 'en', 'Dummy Dev Tool 442', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-443-dummy', 'en', 'Dummy Dev Tool 443', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-444-dummy', 'en', 'Dummy Dev Tool 444', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-445-dummy', 'en', 'Dummy Dev Tool 445', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-446-dummy', 'en', 'Dummy Dev Tool 446', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-447-dummy', 'en', 'Dummy Dev Tool 447', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-448-dummy', 'en', 'Dummy Dev Tool 448', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-dev-tool-449-dummy', 'en', 'Dummy Dev Tool 449', 'A dummy tool', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;
END $$;

INSERT INTO categories (id, slug, locale, name, description) VALUES (gen_random_uuid(), 'india', 'en', 'India', 'Seed category') ON CONFLICT (slug, locale) DO NOTHING;

DO $$
DECLARE
  cat_id uuid;
BEGIN
  SELECT id INTO cat_id FROM categories WHERE slug = 'india' AND locale = 'en';

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pani-puri-food', 'en', 'Pani Puri', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vada-pav-food', 'en', 'Vada Pav', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'samosa-food', 'en', 'Samosa', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kachori-food', 'en', 'Kachori', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chole-bhature-food', 'en', 'Chole Bhature', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pav-bhaji-food', 'en', 'Pav Bhaji', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dahi-puri-food', 'en', 'Dahi Puri', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sev-puri-food', 'en', 'Sev Puri', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhel-puri-food', 'en', 'Bhel Puri', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'aloo-tikki-food', 'en', 'Aloo Tikki', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'momos-food', 'en', 'Momos', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kathi-roll-food', 'en', 'Kathi Roll', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dosa-food', 'en', 'Dosa', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'idli-food', 'en', 'Idli', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'medu-vada-food', 'en', 'Medu Vada', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'uttapam-food', 'en', 'Uttapam', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'poha-food', 'en', 'Poha', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jalebi-food', 'en', 'Jalebi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'imarti-food', 'en', 'Imarti', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dhokla-food', 'en', 'Dhokla', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'khandvi-food', 'en', 'Khandvi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'thepla-food', 'en', 'Thepla', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'misal-pav-food', 'en', 'Misal Pav', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'litti-chokha-food', 'en', 'Litti Chokha', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bedmi-puri-food', 'en', 'Bedmi Puri', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kulcha-food', 'en', 'Kulcha', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'paratha-food', 'en', 'Paratha', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bread-pakora-food', 'en', 'Bread Pakora', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'maggi-food', 'en', 'Maggi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'egg-roll-food', 'en', 'Egg Roll', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chaat-papdi-food', 'en', 'Chaat Papdi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'raj-kachori-food', 'en', 'Raj Kachori', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'golgappa-food', 'en', 'Golgappa', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tikki-chaat-food', 'en', 'Tikki Chaat', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dabeli-food', 'en', 'Dabeli', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'frankie-food', 'en', 'Frankie', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sabudana-khichdi-food', 'en', 'Sabudana Khichdi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'appam-food', 'en', 'Appam', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'puttu-food', 'en', 'Puttu', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'banana-chips-food', 'en', 'Banana Chips', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhutta-food', 'en', 'Bhutta', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gola-food', 'en', 'Gola', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kulfi-food', 'en', 'Kulfi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rabri-falooda-food', 'en', 'Rabri Falooda', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lassi-food', 'en', 'Lassi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nimbu-pani-food', 'en', 'Nimbu Pani', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jaljeera-food', 'en', 'Jaljeera', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sugarcane-juice-food', 'en', 'Sugarcane Juice', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'masala-chai-food', 'en', 'Masala Chai', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'filter-coffee-food', 'en', 'Filter Coffee', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rasgulla-food', 'en', 'Rasgulla', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gulab-jamun-food', 'en', 'Gulab Jamun', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kaju-katli-food', 'en', 'Kaju Katli', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ladoo-food', 'en', 'Ladoo', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'barfi-food', 'en', 'Barfi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'peda-food', 'en', 'Peda', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'soan-papdi-food', 'en', 'Soan Papdi', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rasmalai-food', 'en', 'Rasmalai', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'malpua-food', 'en', 'Malpua', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mysore-pak-food', 'en', 'Mysore Pak', 'A well-known food in India.', '["food","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hyderabadi-biryani-dish', 'en', 'Hyderabadi Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lucknowi-biryani-dish', 'en', 'Lucknowi Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kolkata-biryani-dish', 'en', 'Kolkata Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'malabar-biryani-dish', 'en', 'Malabar Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ambur-biryani-dish', 'en', 'Ambur Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sindhi-biryani-dish', 'en', 'Sindhi Biryani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'butter-chicken-dish', 'en', 'Butter Chicken', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dal-makhani-dish', 'en', 'Dal Makhani', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'palak-paneer-dish', 'en', 'Palak Paneer', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'paneer-tikka-dish', 'en', 'Paneer Tikka', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rajma-chawal-dish', 'en', 'Rajma Chawal', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kadhi-chawal-dish', 'en', 'Kadhi Chawal', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chole-chawal-dish', 'en', 'Chole Chawal', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sarson-da-saag-dish', 'en', 'Sarson da Saag', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'makki-di-roti-dish', 'en', 'Makki di Roti', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rogan-josh-dish', 'en', 'Rogan Josh', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gushtaba-dish', 'en', 'Gushtaba', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'fish-curry-dish', 'en', 'Fish Curry', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'appam-with-stew-dish', 'en', 'Appam with Stew', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sambar-rice-dish', 'en', 'Sambar Rice', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'curd-rice-dish', 'en', 'Curd Rice', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bisi-bele-bath-dish', 'en', 'Bisi Bele Bath', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dal-baati-churma-dish', 'en', 'Dal Baati Churma', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gatte-ki-sabzi-dish', 'en', 'Gatte ki Sabzi', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pithla-bhakri-dish', 'en', 'Pithla Bhakri', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'puran-poli-dish', 'en', 'Puran Poli', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'thalipeeth-dish', 'en', 'Thalipeeth', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'macher-jhol-dish', 'en', 'Macher Jhol', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'shorshe-ilish-dish', 'en', 'Shorshe Ilish', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'litti-chokha-dish', 'en', 'Litti Chokha', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dal-pitha-dish', 'en', 'Dal Pitha', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jadoh-dish', 'en', 'Jadoh', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'thukpa-dish', 'en', 'Thukpa', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chana-masala-dish', 'en', 'Chana Masala', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kofta-dish', 'en', 'Kofta', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'korma-dish', 'en', 'Korma', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vindaloo-dish', 'en', 'Vindaloo', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'xacuti-dish', 'en', 'Xacuti', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'haleem-dish', 'en', 'Haleem', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nihari-dish', 'en', 'Nihari', 'A well-known dish in India.', '["dish","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'delhi-city', 'en', 'Delhi', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mumbai-city', 'en', 'Mumbai', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bengaluru-city', 'en', 'Bengaluru', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hyderabad-city', 'en', 'Hyderabad', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chennai-city', 'en', 'Chennai', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kolkata-city', 'en', 'Kolkata', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pune-city', 'en', 'Pune', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ahmedabad-city', 'en', 'Ahmedabad', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jaipur-city', 'en', 'Jaipur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lucknow-city', 'en', 'Lucknow', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chandigarh-city', 'en', 'Chandigarh', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'goa-city', 'en', 'Goa', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kochi-city', 'en', 'Kochi', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'indore-city', 'en', 'Indore', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhopal-city', 'en', 'Bhopal', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nagpur-city', 'en', 'Nagpur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'surat-city', 'en', 'Surat', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'varanasi-city', 'en', 'Varanasi', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amritsar-city', 'en', 'Amritsar', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'shimla-city', 'en', 'Shimla', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'manali-city', 'en', 'Manali', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rishikesh-city', 'en', 'Rishikesh', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dehradun-city', 'en', 'Dehradun', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'udaipur-city', 'en', 'Udaipur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jodhpur-city', 'en', 'Jodhpur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jaisalmer-city', 'en', 'Jaisalmer', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mysuru-city', 'en', 'Mysuru', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pondicherry-city', 'en', 'Pondicherry', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'darjeeling-city', 'en', 'Darjeeling', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gangtok-city', 'en', 'Gangtok', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'shillong-city', 'en', 'Shillong', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'guwahati-city', 'en', 'Guwahati', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhubaneswar-city', 'en', 'Bhubaneswar', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'visakhapatnam-city', 'en', 'Visakhapatnam', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'coimbatore-city', 'en', 'Coimbatore', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'madurai-city', 'en', 'Madurai', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'thiruvananthapuram-city', 'en', 'Thiruvananthapuram', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mangaluru-city', 'en', 'Mangaluru', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'srinagar-city', 'en', 'Srinagar', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'leh-city', 'en', 'Leh', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'agra-city', 'en', 'Agra', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gurugram-city', 'en', 'Gurugram', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'noida-city', 'en', 'Noida', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'faridabad-city', 'en', 'Faridabad', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ghaziabad-city', 'en', 'Ghaziabad', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'patna-city', 'en', 'Patna', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ranchi-city', 'en', 'Ranchi', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'raipur-city', 'en', 'Raipur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kanpur-city', 'en', 'Kanpur', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'meerut-city', 'en', 'Meerut', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mathura-city', 'en', 'Mathura', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ayodhya-city', 'en', 'Ayodhya', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hampi-city', 'en', 'Hampi', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ooty-city', 'en', 'Ooty', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'munnar-city', 'en', 'Munnar', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'alleppey-city', 'en', 'Alleppey', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kodaikanal-city', 'en', 'Kodaikanal', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nainital-city', 'en', 'Nainital', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mussoorie-city', 'en', 'Mussoorie', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dharamshala-city', 'en', 'Dharamshala', 'A well-known city in India.', '["city","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sachin-tendulkar-cricketer', 'en', 'Sachin Tendulkar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'virat-kohli-cricketer', 'en', 'Virat Kohli', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ms-dhoni-cricketer', 'en', 'MS Dhoni', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rohit-sharma-cricketer', 'en', 'Rohit Sharma', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kapil-dev-cricketer', 'en', 'Kapil Dev', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sunil-gavaskar-cricketer', 'en', 'Sunil Gavaskar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rahul-dravid-cricketer', 'en', 'Rahul Dravid', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sourav-ganguly-cricketer', 'en', 'Sourav Ganguly', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'anil-kumble-cricketer', 'en', 'Anil Kumble', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vvs-laxman-cricketer', 'en', 'VVS Laxman', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'virender-sehwag-cricketer', 'en', 'Virender Sehwag', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'yuvraj-singh-cricketer', 'en', 'Yuvraj Singh', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zaheer-khan-cricketer', 'en', 'Zaheer Khan', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jasprit-bumrah-cricketer', 'en', 'Jasprit Bumrah', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ravichandran-ashwin-cricketer', 'en', 'Ravichandran Ashwin', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ravindra-jadeja-cricketer', 'en', 'Ravindra Jadeja', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'harbhajan-singh-cricketer', 'en', 'Harbhajan Singh', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'shikhar-dhawan-cricketer', 'en', 'Shikhar Dhawan', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gautam-gambhir-cricketer', 'en', 'Gautam Gambhir', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rishabh-pant-cricketer', 'en', 'Rishabh Pant', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hardik-pandya-cricketer', 'en', 'Hardik Pandya', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kl-rahul-cricketer', 'en', 'KL Rahul', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mohammed-shami-cricketer', 'en', 'Mohammed Shami', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cheteshwar-pujara-cricketer', 'en', 'Cheteshwar Pujara', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ajinkya-rahane-cricketer', 'en', 'Ajinkya Rahane', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ishant-sharma-cricketer', 'en', 'Ishant Sharma', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhuvneshwar-kumar-cricketer', 'en', 'Bhuvneshwar Kumar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'suresh-raina-cricketer', 'en', 'Suresh Raina', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'javagal-srinath-cricketer', 'en', 'Javagal Srinath', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'venkatesh-prasad-cricketer', 'en', 'Venkatesh Prasad', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'navjot-singh-sidhu-cricketer', 'en', 'Navjot Singh Sidhu', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mohammad-azharuddin-cricketer', 'en', 'Mohammad Azharuddin', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ravi-shastri-cricketer', 'en', 'Ravi Shastri', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dilip-vengsarkar-cricketer', 'en', 'Dilip Vengsarkar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mohinder-amarnath-cricketer', 'en', 'Mohinder Amarnath', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bishan-singh-bedi-cricketer', 'en', 'Bishan Singh Bedi', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'erapalli-prasanna-cricketer', 'en', 'Erapalli Prasanna', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bhagwat-chandrasekhar-cricketer', 'en', 'Bhagwat Chandrasekhar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'srinivas-venkataraghavan-cricketer', 'en', 'Srinivas Venkataraghavan', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mansoor-ali-khan-pataudi-cricketer', 'en', 'Mansoor Ali Khan Pataudi', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vinoo-mankad-cricketer', 'en', 'Vinoo Mankad', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vijay-hazare-cricketer', 'en', 'Vijay Hazare', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ck-nayudu-cricketer', 'en', 'CK Nayudu', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lala-amarnath-cricketer', 'en', 'Lala Amarnath', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'polly-umrigar-cricketer', 'en', 'Polly Umrigar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'subhash-gupte-cricketer', 'en', 'Subhash Gupte', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'syed-mushtaq-ali-cricketer', 'en', 'Syed Mushtaq Ali', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amar-singh-cricketer', 'en', 'Amar Singh', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mohammad-nissar-cricketer', 'en', 'Mohammad Nissar', 'A well-known cricketer in India.', '["cricketer","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sholay-film', 'en', 'Sholay', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dilwale-dulhania-le-jayenge-film', 'en', 'Dilwale Dulhania Le Jayenge', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lagaan-film', 'en', 'Lagaan', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, '3-idiots-film', 'en', '3 Idiots', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dangal-film', 'en', 'Dangal', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'baahubali-film', 'en', 'Baahubali', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mother-india-film', 'en', 'Mother India', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mughal-e-azam-film', 'en', 'Mughal-e-Azam', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pyaasa-film', 'en', 'Pyaasa', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'guide-film', 'en', 'Guide', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'anand-film', 'en', 'Anand', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'deewaar-film', 'en', 'Deewaar', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zanjeer-film', 'en', 'Zanjeer', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kabhi-kabhie-film', 'en', 'Kabhi Kabhie', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amar-akbar-anthony-film', 'en', 'Amar Akbar Anthony', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'don-film', 'en', 'Don', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mr-india-film', 'en', 'Mr. India', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'qayamat-se-qayamat-tak-film', 'en', 'Qayamat Se Qayamat Tak', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'maine-pyar-kiya-film', 'en', 'Maine Pyar Kiya', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hum-aapke-hain-koun-film', 'en', 'Hum Aapke Hain Koun', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kuch-kuch-hota-hai-film', 'en', 'Kuch Kuch Hota Hai', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kabhi-khushi-kabhie-gham-film', 'en', 'Kabhi Khushi Kabhie Gham', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'swades-film', 'en', 'Swades', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rang-de-basanti-film', 'en', 'Rang De Basanti', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chak-de-india-film', 'en', 'Chak De India', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'taare-zameen-par-film', 'en', 'Taare Zameen Par', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'munna-bhai-m-b-b-s-film', 'en', 'Munna Bhai M.B.B.S.', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hera-pheri-film', 'en', 'Hera Pheri', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'andaz-apna-apna-film', 'en', 'Andaz Apna Apna', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dil-chahta-hai-film', 'en', 'Dil Chahta Hai', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kal-ho-naa-ho-film', 'en', 'Kal Ho Naa Ho', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'veer-zaara-film', 'en', 'Veer-Zaara', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'devdas-film', 'en', 'Devdas', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'black-film', 'en', 'Black', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'barfi-film', 'en', 'Barfi', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'queen-film', 'en', 'Queen', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kahaani-film', 'en', 'Kahaani', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'drishyam-film', 'en', 'Drishyam', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pk-film', 'en', 'PK', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bajrangi-bhaijaan-film', 'en', 'Bajrangi Bhaijaan', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sultan-film', 'en', 'Sultan', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'padmaavat-film', 'en', 'Padmaavat', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sanju-film', 'en', 'Sanju', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'uri-film', 'en', 'Uri', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gully-boy-film', 'en', 'Gully Boy', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kabir-singh-film', 'en', 'Kabir Singh', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rrr-film', 'en', 'RRR', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kgf-film', 'en', 'KGF', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pushpa-film', 'en', 'Pushpa', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kantara-film', 'en', 'Kantara', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'minnal-murali-film', 'en', 'Minnal Murali', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kumbalangi-nights-film', 'en', 'Kumbalangi Nights', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'super-deluxe-film', 'en', 'Super Deluxe', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vikram-film', 'en', 'Vikram', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kaithi-film', 'en', 'Kaithi', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'asuran-film', 'en', 'Asuran', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vada-chennai-film', 'en', 'Vada Chennai', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pariyerum-perumal-film', 'en', 'Pariyerum Perumal', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'karnan-film', 'en', 'Karnan', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jai-bhim-film', 'en', 'Jai Bhim', 'A well-known film in India.', '["film","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'paytm-brand', 'en', 'Paytm', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'phonepe-brand', 'en', 'PhonePe', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'google-pay-brand', 'en', 'Google Pay', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zomato-brand', 'en', 'Zomato', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'swiggy-brand', 'en', 'Swiggy', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'blinkit-brand', 'en', 'Blinkit', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zepto-brand', 'en', 'Zepto', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'flipkart-brand', 'en', 'Flipkart', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amazon-india-brand', 'en', 'Amazon India', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'myntra-brand', 'en', 'Myntra', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ola-brand', 'en', 'Ola', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'uber-brand', 'en', 'Uber', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rapido-brand', 'en', 'Rapido', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jio-brand', 'en', 'Jio', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'airtel-brand', 'en', 'Airtel', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'tata-brand', 'en', 'Tata', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'reliance-brand', 'en', 'Reliance', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'amul-brand', 'en', 'Amul', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'parle-g-brand', 'en', 'Parle-G', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'maggi-brand', 'en', 'Maggi', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'britannia-brand', 'en', 'Britannia', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'haldiram-s-brand', 'en', 'Haldiram''s', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'royal-enfield-brand', 'en', 'Royal Enfield', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'maruti-brand', 'en', 'Maruti', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'mahindra-brand', 'en', 'Mahindra', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hero-brand', 'en', 'Hero', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bajaj-brand', 'en', 'Bajaj', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'boat-brand', 'en', 'Boat', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'noise-brand', 'en', 'Noise', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nykaa-brand', 'en', 'Nykaa', 'A well-known brand in India.', '["brand","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'masala-chai-drink', 'en', 'Masala Chai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'adrak-chai-drink', 'en', 'Adrak Chai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kulhad-chai-drink', 'en', 'Kulhad Chai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'irani-chai-drink', 'en', 'Irani Chai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cutting-chai-drink', 'en', 'Cutting Chai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'filter-coffee-drink', 'en', 'Filter Coffee', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lassi-drink', 'en', 'Lassi', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chaas-drink', 'en', 'Chaas', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'thandai-drink', 'en', 'Thandai', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jaljeera-drink', 'en', 'Jaljeera', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'nimbu-soda-drink', 'en', 'Nimbu Soda', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'rooh-afza-drink', 'en', 'Rooh Afza', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'badam-milk-drink', 'en', 'Badam Milk', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'kokum-sherbet-drink', 'en', 'Kokum Sherbet', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'aam-panna-drink', 'en', 'Aam Panna', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'coconut-water-drink', 'en', 'Coconut Water', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'sugarcane-juice-drink', 'en', 'Sugarcane Juice', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bournvita-drink', 'en', 'Bournvita', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'horlicks-drink', 'en', 'Horlicks', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cold-coffee-drink', 'en', 'Cold Coffee', 'A well-known drink in India.', '["drink","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'diwali-festival', 'en', 'Diwali', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'holi-festival', 'en', 'Holi', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'eid-festival', 'en', 'Eid', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'navratri-festival', 'en', 'Navratri', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'durga-puja-festival', 'en', 'Durga Puja', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ganesh-chaturthi-festival', 'en', 'Ganesh Chaturthi', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'raksha-bandhan-festival', 'en', 'Raksha Bandhan', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'christmas-festival', 'en', 'Christmas', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'onam-festival', 'en', 'Onam', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pongal-festival', 'en', 'Pongal', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'baisakhi-festival', 'en', 'Baisakhi', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'lohri-festival', 'en', 'Lohri', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'makar-sankranti-festival', 'en', 'Makar Sankranti', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'janmashtami-festival', 'en', 'Janmashtami', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dussehra-festival', 'en', 'Dussehra', 'A well-known festival in India.', '["festival","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'delhi-vs-mumbai-hot', 'en', 'Delhi vs Mumbai', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'chai-vs-coffee-hot', 'en', 'Chai vs Coffee', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'hyderabadi-vs-lucknowi-biryani-hot', 'en', 'Hyderabadi vs Lucknowi Biryani', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bangalore-vs-pune-hot', 'en', 'Bangalore vs Pune', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dosa-vs-idli-hot', 'en', 'Dosa vs Idli', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'pani-puri-vs-bhel-hot', 'en', 'Pani Puri vs Bhel', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'north-vs-south-indian-food-hot', 'en', 'North vs South Indian food', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'zomato-vs-swiggy-hot', 'en', 'Zomato vs Swiggy', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'samosa-vs-kachori-hot', 'en', 'Samosa vs Kachori', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'gulab-jamun-vs-rasgulla-hot', 'en', 'Gulab Jamun vs Rasgulla', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'maggi-with-veggies-vs-plain-hot', 'en', 'Maggi with veggies vs plain', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'monsoon-vs-winter-hot', 'en', 'Monsoon vs Winter', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'train-vs-flight-hot', 'en', 'Train vs Flight', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'cricket-vs-football-hot', 'en', 'Cricket vs Football', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'ipl-vs-world-cup-hot', 'en', 'IPL vs World Cup', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'paratha-with-curd-vs-pickle-hot', 'en', 'Paratha with curd vs pickle', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'vada-pav-vs-pav-bhaji-hot', 'en', 'Vada Pav vs Pav Bhaji', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'goa-vs-manali-hot', 'en', 'Goa vs Manali', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'jalebi-with-milk-vs-rabri-hot', 'en', 'Jalebi with milk vs rabri', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'bollywood-vs-south-cinema-hot', 'en', 'Bollywood vs South cinema', 'A well-known hot in India.', '["hot","india"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-354-dummy', 'en', 'Dummy India Item 354', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-355-dummy', 'en', 'Dummy India Item 355', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-356-dummy', 'en', 'Dummy India Item 356', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-357-dummy', 'en', 'Dummy India Item 357', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-358-dummy', 'en', 'Dummy India Item 358', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-359-dummy', 'en', 'Dummy India Item 359', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-360-dummy', 'en', 'Dummy India Item 360', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-361-dummy', 'en', 'Dummy India Item 361', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-362-dummy', 'en', 'Dummy India Item 362', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-363-dummy', 'en', 'Dummy India Item 363', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-364-dummy', 'en', 'Dummy India Item 364', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-365-dummy', 'en', 'Dummy India Item 365', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-366-dummy', 'en', 'Dummy India Item 366', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-367-dummy', 'en', 'Dummy India Item 367', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-368-dummy', 'en', 'Dummy India Item 368', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-369-dummy', 'en', 'Dummy India Item 369', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-370-dummy', 'en', 'Dummy India Item 370', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-371-dummy', 'en', 'Dummy India Item 371', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-372-dummy', 'en', 'Dummy India Item 372', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-373-dummy', 'en', 'Dummy India Item 373', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-374-dummy', 'en', 'Dummy India Item 374', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-375-dummy', 'en', 'Dummy India Item 375', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-376-dummy', 'en', 'Dummy India Item 376', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-377-dummy', 'en', 'Dummy India Item 377', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-378-dummy', 'en', 'Dummy India Item 378', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-379-dummy', 'en', 'Dummy India Item 379', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-380-dummy', 'en', 'Dummy India Item 380', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-381-dummy', 'en', 'Dummy India Item 381', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-382-dummy', 'en', 'Dummy India Item 382', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-383-dummy', 'en', 'Dummy India Item 383', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-384-dummy', 'en', 'Dummy India Item 384', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-385-dummy', 'en', 'Dummy India Item 385', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-386-dummy', 'en', 'Dummy India Item 386', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-387-dummy', 'en', 'Dummy India Item 387', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-388-dummy', 'en', 'Dummy India Item 388', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-389-dummy', 'en', 'Dummy India Item 389', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-390-dummy', 'en', 'Dummy India Item 390', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-391-dummy', 'en', 'Dummy India Item 391', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-392-dummy', 'en', 'Dummy India Item 392', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-393-dummy', 'en', 'Dummy India Item 393', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-394-dummy', 'en', 'Dummy India Item 394', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-395-dummy', 'en', 'Dummy India Item 395', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-396-dummy', 'en', 'Dummy India Item 396', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-397-dummy', 'en', 'Dummy India Item 397', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-398-dummy', 'en', 'Dummy India Item 398', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-399-dummy', 'en', 'Dummy India Item 399', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-400-dummy', 'en', 'Dummy India Item 400', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-401-dummy', 'en', 'Dummy India Item 401', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-402-dummy', 'en', 'Dummy India Item 402', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-403-dummy', 'en', 'Dummy India Item 403', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-404-dummy', 'en', 'Dummy India Item 404', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-405-dummy', 'en', 'Dummy India Item 405', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-406-dummy', 'en', 'Dummy India Item 406', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-407-dummy', 'en', 'Dummy India Item 407', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-408-dummy', 'en', 'Dummy India Item 408', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-409-dummy', 'en', 'Dummy India Item 409', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-410-dummy', 'en', 'Dummy India Item 410', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-411-dummy', 'en', 'Dummy India Item 411', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-412-dummy', 'en', 'Dummy India Item 412', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-413-dummy', 'en', 'Dummy India Item 413', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-414-dummy', 'en', 'Dummy India Item 414', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-415-dummy', 'en', 'Dummy India Item 415', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-416-dummy', 'en', 'Dummy India Item 416', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-417-dummy', 'en', 'Dummy India Item 417', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-418-dummy', 'en', 'Dummy India Item 418', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-419-dummy', 'en', 'Dummy India Item 419', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-420-dummy', 'en', 'Dummy India Item 420', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-421-dummy', 'en', 'Dummy India Item 421', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-422-dummy', 'en', 'Dummy India Item 422', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-423-dummy', 'en', 'Dummy India Item 423', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-424-dummy', 'en', 'Dummy India Item 424', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-425-dummy', 'en', 'Dummy India Item 425', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-426-dummy', 'en', 'Dummy India Item 426', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-427-dummy', 'en', 'Dummy India Item 427', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-428-dummy', 'en', 'Dummy India Item 428', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-429-dummy', 'en', 'Dummy India Item 429', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-430-dummy', 'en', 'Dummy India Item 430', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-431-dummy', 'en', 'Dummy India Item 431', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-432-dummy', 'en', 'Dummy India Item 432', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-433-dummy', 'en', 'Dummy India Item 433', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-434-dummy', 'en', 'Dummy India Item 434', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-435-dummy', 'en', 'Dummy India Item 435', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-436-dummy', 'en', 'Dummy India Item 436', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-437-dummy', 'en', 'Dummy India Item 437', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-438-dummy', 'en', 'Dummy India Item 438', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-439-dummy', 'en', 'Dummy India Item 439', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-440-dummy', 'en', 'Dummy India Item 440', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-441-dummy', 'en', 'Dummy India Item 441', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-442-dummy', 'en', 'Dummy India Item 442', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-443-dummy', 'en', 'Dummy India Item 443', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-444-dummy', 'en', 'Dummy India Item 444', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-445-dummy', 'en', 'Dummy India Item 445', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-446-dummy', 'en', 'Dummy India Item 446', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-447-dummy', 'en', 'Dummy India Item 447', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-448-dummy', 'en', 'Dummy India Item 448', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;

  INSERT INTO items (category_id, slug, locale, name, descriptor, attributes) 
  VALUES (cat_id, 'dummy-india-item-449-dummy', 'en', 'Dummy India Item 449', 'A dummy item', '["dummy"]')
  ON CONFLICT (slug, locale) DO NOTHING;
END $$;

