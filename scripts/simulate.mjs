// Mock calculateEloUpdate and calculateDisplayScore to run independently
function clamp(val, min, max) {
  return Math.max(min, Math.min(max, val));
}

function calculateEloUpdate(itemA, itemB, weight = 1.0) {
  const K_base = 48;
  const K_min = 6;
  const K_max = 48;

  const expected_A = 1 / (1 + Math.pow(10, (itemB.rating - itemA.rating) / 400));

  const K_A = clamp(K_base * (itemA.rd / 350), K_min, K_max);
  const K_B = clamp(K_base * (itemB.rd / 350), K_min, K_max);

  const newRatingA = itemA.rating + K_A * (1 - expected_A) * weight;
  const newRatingB = itemB.rating + K_B * (0 - (1 - expected_A)) * weight;

  const newRdA = Math.max(40, itemA.rd * 0.995);
  const newRdB = Math.max(40, itemB.rd * 0.995);

  return {
    newA: { rating: newRatingA, rd: newRdA },
    newB: { rating: newRatingB, rd: newRdB },
  };
}

function calculateDisplayScore(rating, rd) {
  const rd_scaled = rd / 2;
  return rating - 2 * rd_scaled;
}

// Simple Kendall Tau calculation
function kendallTau(arr1, arr2) {
  if (arr1.length !== arr2.length || arr1.length <= 1) return 0;

  let concordant = 0;
  let discordant = 0;
  const n = arr1.length;

  for (let i = 0; i < n - 1; i++) {
    for (let j = i + 1; j < n; j++) {
      const dir1 = Math.sign(arr1[i] - arr1[j]);
      const dir2 = Math.sign(arr2[i] - arr2[j]);

      if (dir1 === 0 || dir2 === 0) continue;

      if (dir1 === dir2) concordant++;
      else discordant++;
    }
  }

  const totalPairs = (n * (n - 1)) / 2;
  return (concordant - discordant) / totalPairs;
}

function runSimulation() {
  const NUM_ITEMS = 100;
  const NUM_VOTES = 10000;

  // Initialize items with varying true strengths
  const items = Array.from({ length: NUM_ITEMS }, (_, i) => ({
    id: i,
    trueStrength: 1000 + Math.random() * 1000, // 1000 to 2000
    rating: 1500,
    rd: 350,
  }));

  for (let i = 0; i < NUM_VOTES; i++) {
    // Pick two random distinct items
    const idxA = Math.floor(Math.random() * NUM_ITEMS);
    let idxB = Math.floor(Math.random() * NUM_ITEMS);
    while (idxB === idxA) {
      idxB = Math.floor(Math.random() * NUM_ITEMS);
    }

    const itemA = items[idxA];
    const itemB = items[idxB];

    // Win probability based on true strength (Bradley-Terry curve)
    const probA = 1 / (1 + Math.pow(10, (itemB.trueStrength - itemA.trueStrength) / 400));
    const aWins = Math.random() < probA;

    const winner = aWins ? itemA : itemB;
    const loser = aWins ? itemB : itemA;

    const result = calculateEloUpdate(winner, loser, 1.0);

    if (aWins) {
      items[idxA].rating = result.newA.rating;
      items[idxA].rd = result.newA.rd;
      items[idxB].rating = result.newB.rating;
      items[idxB].rd = result.newB.rd;
    } else {
      items[idxB].rating = result.newA.rating;
      items[idxB].rd = result.newA.rd;
      items[idxA].rating = result.newB.rating;
      items[idxA].rd = result.newB.rd;
    }
  }

  // Calculate display scores
  const finalItems = items.map((i) => ({
    ...i,
    displayScore: calculateDisplayScore(i.rating, i.rd),
  }));

  // Sort by true strength
  const trueOrder = [...finalItems]
    .sort((a, b) => b.trueStrength - a.trueStrength)
    .map((i) => i.id);
  // Sort by display score
  const estimatedOrder = [...finalItems]
    .sort((a, b) => b.displayScore - a.displayScore)
    .map((i) => i.id);

  // To use Kendall Tau, we need the rank of each item ID in both arrays
  const rankByTrue = new Array(NUM_ITEMS);
  const rankByEst = new Array(NUM_ITEMS);

  for (let i = 0; i < NUM_ITEMS; i++) {
    rankByTrue[trueOrder[i]] = i;
    rankByEst[estimatedOrder[i]] = i;
  }

  const tau = kendallTau(rankByTrue, rankByEst);
  console.log(`Simulation complete. Kendall Tau correlation: ${tau.toFixed(4)}`);

  if (tau >= 0.9) {
    console.log('✅ Kendall Tau is >= 0.9. Simulation passed.');
  } else {
    console.log('❌ Kendall Tau is < 0.9. Simulation failed.');
    process.exit(1);
  }
}

runSimulation();
