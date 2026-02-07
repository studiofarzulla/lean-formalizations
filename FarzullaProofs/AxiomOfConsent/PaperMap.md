# PaperMap: AxiomOfConsent

## Canonical paper
- papers-official/axiom-of-consent/main_v3_hedged.tex

## Lean entrypoints
- FarzullaProofs/AxiomOfConsent/Friction.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Core mapping (selected)
- friction definition -> `friction`
- Section 2 (zero condition) -> `friction_zero_of_stake_zero`, `stake_zero_of_friction_zero`, `friction_eq_zero_iff`
- Section 2 (monotonicity) -> `friction_strict_anti_alignment`, `friction_strict_mono_stake`, `friction_strict_mono_entropy`
- Section 4 (bounds) -> `friction_pos`, `friction_at_perfect_alignment`, `friction_ge_half_stake`, `friction_unbounded`

## Status
- silver-existing
