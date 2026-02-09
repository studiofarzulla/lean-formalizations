# Assumptions Ledger

This ledger defines reusable assumption tags referenced by `PaperMap.md` files.

## Core dynamics tags
- `A-DYN-NOFIX`: update rule has no pointwise fixed point (`forall t x, F t x != x`).
- `A-DYN-VARPATH`: observable path varies over time (`exists t1 t2, path t1 != path t2`).
- `A-DYN-MOVEQ`: moving-equilibrium recursion (`F t (x* t) = x* (t+1)`).

## Discrepancy / dissensus tags
- `A-DISC-EQ0`: discrepancy vanishes on equality (`d a a = 0`).
- `A-DISC-POS`: discrepancy is strictly positive against target trajectory.
- `A-CHASE-EXACT`: exact tracking (path vs itself).
- `A-CHASE-RELAX`: epsilon-relaxation (`eps1 <= eps2`).

## ROM tags
- `A-ROM-ROWSTOCH`: kernel rows sum to 1.
- `A-ROM-SIMPLEX`: state mass sums to 1.
- `A-ROM-L-NN`: legitimacy signal is nonnegative.
- `A-ROM-F-NN`: friction signal is nonnegative.

## Axiom of Consent tags
- `A-AOC-ALPHA-DOM`: alignment denominator domain (`-1 < alpha`).
- `A-AOC-ALPHA-NN`: nonnegative alignment (`0 <= alpha`).
- `A-AOC-SIGMA-NN`: nonnegative stake (`0 <= sigma`).
- `A-AOC-SIGMA-POS`: positive stake (`0 < sigma`).
- `A-AOC-ENT-NN`: nonnegative entropy (`0 <= eps`).

## Consensual Sovereignty tags
- `A-CS-FINITE`: finite index type (`Fintype iota`).
- `A-CS-STAKE-NN`: pointwise nonnegative stakes.
- `A-CS-STAKE-POS-WIT`: existence of strictly positive stake witness.
- `A-CS-VOICE-BOUND`: voice bounded by 1.
- `A-CS-VOICE-MONO`: pointwise voice monotonicity.
- `A-CS-W1-NN`: nonnegative alignment weight.
- `A-CS-W2-NN`: nonnegative performance weight.
- `A-CS-W2-POS`: positive performance weight.

## Identity Thesis tags
- `A-ID-DELTA-IRREFL`: irreflexive distinguishability relation (`forall A, not delta A A`).
- `A-ID-SET-EXT`: set-theoretic extensional instance modeled by inequality (`delta A B := A != B`).
- `A-ID-CPLX-STD`: standard complex-number field structure (`Complex` over `Real`).
- `A-ID-ENCODING`: encoding-specific interpretation for Von Neumann vs Zermelo constructions.

## Quantum Oscillatory tags
- `A-QO-CPLX`: amplitudes and intensity are modeled in standard complex arithmetic (`Complex.normSq` semantics).
- `A-QO-TRIG`: trigonometric equalities rely on standard real cosine identities.
- `A-QO-ORTHO`: cross-term orthogonality witness is explicitly provided (`cross term = 0`).

## Semantic Vision tags
- `A-SV-FINSET`: semantic units are represented as finite sets with standard card/intersection/union behavior.
- `A-SV-UNION-NONEMPTY`: non-empty union witness (`0 < (A ∪ B).card`) is provided where required.
- `A-SV-DISJOINT`: disjointness witness is provided for maximal-distance identities.

## Genre Mimicry tags
- `A-GM-TOTAL-POS`: total/sample denominator is strictly positive.
- `A-GM-COUNT-BOUNDS`: numerator-order/count-bounds assumptions are provided (`0 <= d`, `d <= t`, or monotone variants).
- `A-GM-ODDS-DOM`: odds argument remains in open interval `(0,1)`.

## Asymptotic Protection tags
- `A-AP-NONNEG`: protection parameters are nonnegative (`0 <= k`, `0 <= n`).
- `A-AP-DEN-POS`: denominator-domain condition (`0 < 1 + k*n`).
- `A-AP-EFFORT-MONO`: ordered effort inputs for monotonic comparisons (`n1 <= n2`).

## CBDC Privacy tags
- `A-CBDC-ADD-COMP`: privacy composition is modeled as additive epsilon accounting.
- `A-CBDC-EPS-NN`: epsilon budgets are nonnegative.
- `A-CBDC-STEPS-MONO`: step counts are compared under an order witness (`n <= m`).
- `A-CBDC-AVG-NORM`: average-normalization algebra for two-step composition rewrites.

## AML Paradox tags
- `A-AML-LINEAR-UTILITY`: utility model is linear (`tp - penalty*fp`).
- `A-AML-TOTAL-POS`: normalized rates/advantages use strictly positive total volume.
- `A-AML-NONNEG`: nonnegative penalty/false-positive assumptions for anti-monotonicity statements.

## Autonomous Redteam tags
- `A-AR-LINEAR-RESIDUAL`: residual incidents are modeled linearly (`incidents - blocked`).
- `A-AR-INC-POS`: incident baseline is strictly positive where ratio normalization is used.
- `A-AR-BOUNDS`: bound/order assumptions are supplied (`0 <= blocked <= incidents` or ordered ratios).

## Consciousness Nominalisation tags
- `A-CN-LINEAR-GAP`: nominalisation gap is modeled linearly (`nominal - grounded`).
- `A-CN-NORM-DEN`: normalized deficit denominator is strictly positive (`|nominal| + 1`).
- `A-CN-GROUNDED-MONO`: grounding variables are ordered for monotonic comparisons.

## Monograph Qualia tags
- `A-MQ-ABS-METRIC`: qualia distance uses absolute-value real metric form.
- `A-MQ-ENERGY-SQ`: qualia energy is modeled as squared distance.
- `A-MQ-TRIANGLE`: triangle inequality inherited from absolute-value metric geometry.
- `A-MQ-ZERO-CHAR`: zero-characterization lemmas over real distance/energy forms.

## ROM Ethics tags
- `A-RE-LINEAR-WELFARE`: welfare is linear (`benefit - weight*harm`).
- `A-RE-FRICTION-DOM`: friction/denominator domain ensures valid survival normalization.
- `A-RE-WEIGHT-NN`: ethical weight is nonnegative for anti-harm monotonicity.
- `A-RE-AOC-ROM-BRIDGE`: bridge uses AoC friction monotonicity and ROM survival monotonicity assumptions.
- `A-RE-WELFARE-NN`: welfare is assumed nonnegative for sign/bound survival claims.

## Reading rule
A theorem claim is valid only under the tags listed for that claim in its `PaperMap.md` mapping.
