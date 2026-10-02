# Contributing to Tiebreak

Thank you for your interest in contributing to Tiebreak!

## Ground Rules
- **All Rights Reserved**: Tiebreak's source code is publicly visible for educational purposes, but it is proprietary. You may contribute to this repository, but you may not clone, redistribute, or use this code for your own commercial or public projects. By submitting a Pull Request, you agree to transfer the copyright of your changes to the project owner.

## Development Setup
1. Clone the repo and run `pnpm install`.
2. Copy `.env.example` to `.env.local` and add your Supabase/Upstash keys.
3. Run the migrations in `supabase/migrations/`.
4. Run `pnpm dev` to start the local server.

## Workflow
1. Create a feature branch (`feat/your-feature` or `fix/your-fix`).
2. Commit using Conventional Commits.
3. Run `pnpm format` and `pnpm lint` before pushing.
4. Open a PR against the `main` branch.
