# PaperMap: AxiomOfConsent

## Canonical paper
- papers-official/axiom-of-consent/main_v3_hedged.tex

## Lean entrypoints
- FarzullaProofs/AxiomOfConsent/Friction.lean
- FarzullaProofs/AxiomOfConsent/Advanced.lean
- FarzullaProofs/AxiomOfConsent/Transfers.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Core mapping (selected)
- friction definition -> `friction`
- Section 2 (zero condition) -> `friction_zero_of_stake_zero`, `stake_zero_of_friction_zero`, `friction_eq_zero_iff`
- Section 2 (monotonicity) -> `friction_strict_anti_alignment`, `friction_strict_mono_stake`, `friction_strict_mono_entropy`
- Section 4 (bounds) -> `friction_pos`, `friction_at_perfect_alignment`, `friction_ge_half_stake`, `friction_unbounded`

## Gold extensions
- THM-aoc-gold-1 -> `friction_mono_entropy`
- THM-aoc-gold-2 -> `friction_mono_stake`
- THM-aoc-gold-3 -> `friction_at_zero_alignment`
- THM-aoc-gold-4 -> `friction_at_zero_entropy`
- THM-aoc-gold-5 -> `friction_le_linear_upper`
- THM-aoc-gold-6 -> `friction_at_max_entropy`

## Transfer mapping
- THM-aoc-transfer-1 -> `aoc_movingEquilibrium`
- THM-aoc-transfer-2 -> `aoc_no_static_if_path_varies`
- THM-aoc-transfer-3 -> `aocPath_nonneg`
- THM-aoc-transfer-4 -> `aoc_dissensus_of_positive_discrepancy`
- THM-aoc-transfer-5 -> `aoc_path_boundedChase_zero`

## Assumption tags
- denominator/positivity claims: `A-AOC-ALPHA-DOM`
- monotonicity in stake/entropy: `A-AOC-SIGMA-NN`, `A-AOC-ENT-NN`, `A-AOC-ALPHA-DOM`
- linear upper bound: `A-AOC-SIGMA-NN`, `A-AOC-ALPHA-NN`, `A-AOC-ENT-NN`
- transfer no-static theorem: `A-DYN-VARPATH`
- transfer dissensus theorem: `A-DISC-EQ0`, `A-DISC-POS`

## Falsification boundaries
- If `alpha <= -1`, denominator safety assumptions fail and multiple bounds/monotonicity claims no longer apply.
- If stakes or entropy leave nonnegative domain, monotonicity/bound claims can reverse.
- If path variation witness is absent, no-static transfer theorem is not triggered.

## Status
- gold-formal-core
