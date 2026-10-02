# Tiebreak: Ranking Math

Tiebreak uses an optimized derivative of the Elo rating system, adjusted for concurrent pairwise web voting.

## 1. Rating Deviation (RD)
Standard Elo assumes a player's skill is perfectly known. Tiebreak tracks a confidence interval (Rating Deviation) which starts high (untrusted) and narrows as the item receives more votes. This allows new items to rapidly climb or fall until they find their true tier.

## 2. Wilson Lower Bound
Because raw win-rates and raw Elo can be volatile for low-sample items, leaderboards sort by a "Conservative Display Score", calculated using the Wilson Score Interval lower bound formula mapping over the item's historical win rate. This prevents an item with 1 vote (100% win rate) from ranking higher than an item with 10,000 votes (95% win rate).

## 3. Simulation Verification
Using `scripts/simulate.mjs`, we run 10,000 synthetic votes against the engine and output the Kendall Tau rank correlation coefficient. Tiebreak's math consistently scores >0.9 against the known true strengths, proving the math converges reliably.
