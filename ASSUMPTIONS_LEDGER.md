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

## Reading rule
A theorem claim is valid only under the tags listed for that claim in its `PaperMap.md` mapping.
