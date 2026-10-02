create extension if not exists pgcrypto;
create extension if not exists pg_trgm;

-- Categories (verticals and subcategories as a tree)
create table categories (
  id uuid primary key default gen_random_uuid(),
  parent_id uuid references categories(id),
  slug text not null,
  locale text not null default 'en',
  name text not null,
  description text,
  icon text,
  sort_order int default 0,
  is_active boolean default true,
  created_at timestamptz default now(),
  unique (slug, locale)
);

-- Items
create table items (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references categories(id),
  slug text not null,
  locale text not null default 'en',
  name text not null,
  descriptor text,
  image_url text,
  image_license text,
  image_attribution text,
  source_url text,
  wikidata_id text,
  attributes jsonb not null default '[]',   -- trait tags used by the taste engine (Section 14)
  alias_cluster_id uuid,
  rating double precision not null default 1500,
  rd double precision not null default 350,
  bt_rating double precision,
  display_score double precision generated always as (rating - rd) stored,
  vote_count int not null default 0,
  win_count int not null default 0,
  loss_count int not null default 0,
  last_voted_at timestamptz,
  status text not null default 'active' check (status in ('active','pending','hidden','merged')),
  submitted_by uuid,
  created_at timestamptz default now(),
  unique (slug, locale)
);
create index items_cat_score on items (category_id, display_score desc) where status = 'active';
create index items_cat_rd on items (category_id, rd desc) where status = 'active';
create index items_name_trgm on items using gin (name gin_trgm_ops);

-- Users (profile data keyed to auth.users when signed in)
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  avatar_url text,
  country text,
  age_band text check (age_band in ('13-17','18-24','25-34','35-44','45+')),
  demographics_opt_in boolean default false,
  streak_current int default 0,
  streak_best int default 0,
  last_active_date date,
  xp int default 0,
  trust_score real default 0.6,
  created_at timestamptz default now()
);

-- Anonymous identities
create table anon_identities (
  anon_id uuid primary key,
  first_seen timestamptz default now(),
  last_seen timestamptz default now(),
  user_id uuid references profiles(id),     -- set on merge
  trust_score real default 0.6,
  device_hash text,
  country text
);

-- Votes (append-only, partition by month once above 50M rows)
create table votes (
  id bigint generated always as identity primary key,
  client_vote_id text unique,               -- idempotency key from the client
  item_a uuid not null references items(id),
  item_b uuid not null references items(id),
  winner uuid references items(id),         -- null for skip
  outcome text not null check (outcome in ('a','b','skip')),
  category_id uuid not null,
  user_id uuid,
  anon_id uuid,
  weight real not null default 1,
  decision_ms int,
  predicted_winner uuid,                    -- prediction mode
  unfamiliar_a boolean default false,
  unfamiliar_b boolean default false,
  source text default 'arena' check (source in ('arena','daily','challenge','embed','api')),
  ip_hash text,
  country text,
  created_at timestamptz default now(),
  check (item_a <> item_b)
);
create index votes_created on votes (created_at desc);
create index votes_pair on votes (least(item_a,item_b), greatest(item_a,item_b));
create index votes_user on votes (user_id, created_at desc);
create index votes_anon on votes (anon_id, created_at desc);

-- Pair aggregates (fast percentages and versus pages)
create table pair_stats (
  item_lo uuid not null,
  item_hi uuid not null,
  lo_wins int not null default 0,
  hi_wins int not null default 0,
  updated_at timestamptz default now(),
  primary key (item_lo, item_hi)
);

-- Daily rating snapshots for sparklines and 24h movement
create table rating_snapshots (
  item_id uuid not null references items(id),
  day date not null,
  rating double precision not null,
  rd double precision not null,
  rank_in_category int,
  vote_count int,
  primary key (item_id, day)
);

-- Taste vectors per user (category-level preference summaries)
create table taste_profiles (
  owner_key text primary key,               -- 'u:<uuid>' or 'a:<uuid>'
  category_id uuid references categories(id),
  vector jsonb not null,                    -- see Section 14
  vote_count int default 0,
  updated_at timestamptz default now()
);

-- Shareable taste cards
create table taste_cards (
  id text primary key,                      -- short id (nanoid 10)
  owner_key text not null,
  category_id uuid,
  headline text not null,
  stats jsonb not null,
  created_at timestamptz default now()
);

-- Daily matchups
create table daily_matchups (
  day date primary key,
  item_a uuid not null references items(id),
  item_b uuid not null references items(id),
  headline text,
  sponsored_by text
);

-- Challenges between friends
create table challenges (
  id text primary key,
  creator_key text not null,
  pair_ids uuid[] not null,
  creator_answers jsonb not null,
  created_at timestamptz default now(),
  expires_at timestamptz default (now() + interval '14 days')
);

-- Submissions and moderation
create table submissions (
  id uuid primary key default gen_random_uuid(),
  kind text not null check (kind in ('item','matchup','category')),
  payload jsonb not null,
  submitted_by uuid,
  status text not null default 'pending' check (status in ('pending','approved','rejected','auto_rejected')),
  auto_flags text[] default '{}',
  reviewed_by uuid,
  reason text,
  created_at timestamptz default now()
);

create table reports (
  id uuid primary key default gen_random_uuid(),
  item_id uuid references items(id),
  reporter_key text,
  reason text not null,
  note text,
  status text default 'open',
  created_at timestamptz default now()
);

-- Badges
create table badges (code text primary key, name text, description text, icon text, rarity text);
create table user_badges (owner_key text, code text references badges(code), earned_at timestamptz default now(), primary key (owner_key, code));

-- Sponsored placements (Section 21)
create table sponsorships (
  id uuid primary key default gen_random_uuid(),
  sponsor_name text not null,
  item_id uuid references items(id),
  pair_item_id uuid references items(id),
  label text default 'Sponsored',
  starts_at timestamptz, ends_at timestamptz,
  impressions int default 0, clicks int default 0,
  cpm_cents int, status text default 'draft'
);

-- Affiliate links and revenue tracking (Section 21)
create table affiliate_links (
  id uuid primary key default gen_random_uuid(),
  item_id uuid references items(id),
  network text, url text not null, note text,
  clicks int default 0, active boolean default true
);
create table revenue_events (
  id bigint generated always as identity primary key,
  source text not null, amount_cents int not null, currency text default 'USD',
  page_type text, occurred_on date default current_date
);

-- API keys (V2)
create table api_keys (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references profiles(id),
  key_hash text not null, name text, tier text default 'free',
  created_at timestamptz default now(), revoked_at timestamptz
);

-- RLS
alter table items enable row level security;
create policy "Items are publicly readable" on items for select using (true);

alter table categories enable row level security;
create policy "Categories are publicly readable" on categories for select using (true);

alter table pair_stats enable row level security;
create policy "Pair stats are publicly readable" on pair_stats for select using (true);

alter table rating_snapshots enable row level security;
create policy "Rating snapshots are publicly readable" on rating_snapshots for select using (true);

alter table daily_matchups enable row level security;
create policy "Daily matchups are publicly readable" on daily_matchups for select using (true);

alter table taste_cards enable row level security;
create policy "Taste cards are publicly readable" on taste_cards for select using (true);

alter table votes enable row level security;
-- Votes is write-only from service role, so no policies needed for anon/authenticated

alter table profiles enable row level security;
create policy "Profiles readable by owner" on profiles for select using (auth.uid() = id);
create policy "Profiles writable by owner" on profiles for update using (auth.uid() = id);

alter table taste_profiles enable row level security;
-- Note: owner_key is a text string ('u:uuid' or 'a:uuid'). For profiles we can check auth.uid().
create policy "Taste profiles readable by owner" on taste_profiles for select using (owner_key = 'u:' || auth.uid()::text);
create policy "Taste profiles writable by owner" on taste_profiles for all using (owner_key = 'u:' || auth.uid()::text);

alter table submissions enable row level security;
create policy "Submissions insertable by authenticated users" on submissions for insert with check (auth.role() = 'authenticated');
create policy "Submissions readable by owner" on submissions for select using (auth.uid() = submitted_by);
