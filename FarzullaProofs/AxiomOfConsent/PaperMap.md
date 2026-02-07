# PaperMap: AxiomOfConsent

## Canonical paper
- papers-official/axiom-of-consent/main_v3_hedged.tex

## Lean entrypoints
- FarzullaProofs/AxiomOfConsent/Friction.lean
- FarzullaProofs/AxiomOfConsent/Advanced.lean

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

## Status
- gold-formal-core
