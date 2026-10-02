# Tiebreak

The global pairwise-voting ranking engine. Settle the greatest sports, tech, and cultural debates of all time with Elo-calibrated community consensus.

## Overview
Tiebreak eliminates subjective top-10 lists by forcing users to vote on binary, head-to-head matchups (e.g. "React vs Svelte"). By applying a highly-optimized Elo rating system (with Rating Deviation and Wilson lower bounds), the community organically curates the ultimate, mathematically sound tier lists.

## Features
- **Pairwise Engine**: Redis-backed streams to handle massive concurrent vote throughput without locking Postgres.
- **Dynamic 3D UI**: Framer Motion swipeable 3D cards for an instant, haptic voting experience.
- **Taste Profiles**: Machine learning clusters that determine your "Dev Tools DNA" based on your voting biases.
- **Serverless Ready**: Next.js 15 App Router architecture ready for edge deployment.

## Tech Stack
- **Framework**: Next.js 15 (App Router, Server Actions)
- **Database**: PostgreSQL (Supabase)
- **Cache / Streams**: Upstash Redis
- **Styling**: Tailwind CSS + custom design tokens
- **Auth**: Supabase Auth (with anonymous identity merging)

## Quick Start
1. Copy `.env.example` to `.env.local` and add your Supabase and Upstash keys.
2. Run `pnpm install`
3. Run `pnpm dev`
4. Access the app at `http://localhost:3000`

## Scripts
- `pnpm dev`: Start the local development server.
- `node scripts/seed.mjs`: Run the database seeder to populate items.
- `node scripts/simulate.mjs`: Run a Monte Carlo simulation of the Elo engine.
