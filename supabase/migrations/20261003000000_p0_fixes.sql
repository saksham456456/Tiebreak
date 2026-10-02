-- Enable RLS on specific tables (no policies)
alter table anon_identities enable row level security;
alter table challenges enable row level security;
alter table reports enable row level security;
alter table badges enable row level security;
alter table user_badges enable row level security;
alter table sponsorships enable row level security;
alter table affiliate_links enable row level security;
alter table revenue_events enable row level security;
alter table api_keys enable row level security;

-- Create audit_logs table
create table audit_logs (
    id bigint generated always as identity primary key,
    admin_id uuid not null,
    action text not null,
    item_id uuid,
    created_at timestamptz default now()
);

-- Enable RLS on audit_logs
alter table audit_logs enable row level security;

-- Alter items table
alter table items add column submitted_by_anon uuid;

-- Add public.apply_flush function
create or replace function public.apply_flush(
    p_votes jsonb,
    p_items jsonb,
    p_pairs jsonb,
    p_anons jsonb
) returns void
language plpgsql
security definer
as $$
begin
    -- 1. Insert votes
    if p_votes is not null and jsonb_array_length(p_votes) > 0 then
        insert into votes (
            client_vote_id,
            item_a,
            item_b,
            winner,
            outcome,
            category_id,
            user_id,
            anon_id,
            weight,
            decision_ms,
            predicted_winner,
            unfamiliar_a,
            unfamiliar_b,
            source,
            ip_hash,
            country,
            created_at
        )
        select
            client_vote_id,
            item_a,
            item_b,
            winner,
            outcome,
            category_id,
            user_id,
            anon_id,
            weight,
            decision_ms,
            predicted_winner,
            unfamiliar_a,
            unfamiliar_b,
            source,
            ip_hash,
            country,
            coalesce(created_at, now())
        from jsonb_to_recordset(p_votes) as x(
            client_vote_id text,
            item_a uuid,
            item_b uuid,
            winner uuid,
            outcome text,
            category_id uuid,
            user_id uuid,
            anon_id uuid,
            weight real,
            decision_ms int,
            predicted_winner uuid,
            unfamiliar_a boolean,
            unfamiliar_b boolean,
            source text,
            ip_hash text,
            country text,
            created_at timestamptz
        )
        on conflict (client_vote_id) do nothing;
    end if;

    -- 2. Update items
    if p_items is not null and jsonb_array_length(p_items) > 0 then
        update items
        set
            rating = x.rating,
            rd = x.rd,
            vote_count = x.vote_count,
            win_count = x.win_count,
            loss_count = x.loss_count,
            last_voted_at = x.last_voted_at
        from jsonb_to_recordset(p_items) as x(
            id uuid,
            rating double precision,
            rd double precision,
            vote_count integer,
            win_count integer,
            loss_count integer,
            last_voted_at timestamptz
        )
        where items.id = x.id;
    end if;

    -- 3. Upsert pair_stats
    if p_pairs is not null and jsonb_array_length(p_pairs) > 0 then
        insert into pair_stats (
            item_lo,
            item_hi,
            lo_wins,
            hi_wins,
            updated_at
        )
        select
            item_lo,
            item_hi,
            lo_wins,
            hi_wins,
            now()
        from jsonb_to_recordset(p_pairs) as x(
            item_lo uuid,
            item_hi uuid,
            lo_wins int,
            hi_wins int
        )
        on conflict (item_lo, item_hi) do update
        set
            lo_wins = pair_stats.lo_wins + excluded.lo_wins,
            hi_wins = pair_stats.hi_wins + excluded.hi_wins,
            updated_at = excluded.updated_at;
    end if;

    -- 4. Upsert anon_identities
    if p_anons is not null and jsonb_array_length(p_anons) > 0 then
        insert into anon_identities (
            anon_id,
            first_seen,
            last_seen
        )
        select
            anon_id,
            coalesce(last_seen, now()),
            coalesce(last_seen, now())
        from jsonb_to_recordset(p_anons) as x(
            anon_id uuid,
            last_seen timestamptz
        )
        on conflict (anon_id) do update
        set
            last_seen = excluded.last_seen;
    end if;
end;
$$;

-- Revoke execute from anon and authenticated
revoke execute on function public.apply_flush from anon, authenticated;
