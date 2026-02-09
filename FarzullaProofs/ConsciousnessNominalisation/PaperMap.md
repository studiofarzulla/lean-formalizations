# PaperMap: ConsciousnessNominalisation

## Canonical paper
- papers-official/consciousness-nominalisation/main.tex

## Lean entrypoints
- FarzullaProofs/ConsciousnessNominalisation/Basic.lean
- FarzullaProofs/ConsciousnessNominalisation/Bridge.lean
- FarzullaProofs/ConsciousnessNominalisation/Advanced.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-ConsciousnessNominalisation-bronze-1 -> `groundingGap`
- THM-ConsciousnessNominalisation-bronze-2 -> `groundingGap_self`
- THM-ConsciousnessNominalisation-bronze-3 -> `groundingGap_pos`
- THM-ConsciousnessNominalisation-bronze-4 -> `groundingGap_anti_grounded`

## Silver bridge mapping
- THM-ConsciousnessNominalisation-silver-1 -> `groundingDeficit`
- THM-ConsciousnessNominalisation-silver-2 -> `groundingDeficit_self`
- THM-ConsciousnessNominalisation-silver-3 -> `groundingDeficit_pos`
- THM-ConsciousnessNominalisation-silver-4 -> `groundingDeficit_anti_grounded`
- THM-ConsciousnessNominalisation-silver-5 -> `groundingDeficit_le_abs_gap`

## Gold mapping
- THM-ConsciousnessNominalisation-gold-1 -> `groundingGap_eq_zero_iff`
- THM-ConsciousnessNominalisation-gold-2 -> `groundingDeficit_nonneg_of_gap_nonneg`
- THM-ConsciousnessNominalisation-gold-3 -> `groundingDeficit_ge_neg_abs_gap`
- THM-ConsciousnessNominalisation-gold-4 -> `groundingDeficit_eq_zero_of_eq`

## Assumption tags
- Linear nominal-grounded gap model (`nominal - grounded`): `A-CN-LINEAR-GAP`.
- Positive normalization denominator (`|nominal| + 1 > 0`): `A-CN-NORM-DEN`.
- Ordered grounding assumptions for anti-monotonicity: `A-CN-GROUNDED-MONO`.
- Zero-characterization assumptions over real-valued gap expressions: `A-CN-ZERO-CHAR`.

## Claim-level assumptions
- THM-ConsciousnessNominalisation-bronze-1 -> `A-CN-LINEAR-GAP`
- THM-ConsciousnessNominalisation-bronze-2 -> `A-CN-LINEAR-GAP`
- THM-ConsciousnessNominalisation-bronze-3 -> `A-CN-LINEAR-GAP`
- THM-ConsciousnessNominalisation-bronze-4 -> `A-CN-LINEAR-GAP`, `A-CN-GROUNDED-MONO`
- THM-ConsciousnessNominalisation-silver-1 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-silver-2 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-silver-3 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-silver-4 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`, `A-CN-GROUNDED-MONO`
- THM-ConsciousnessNominalisation-silver-5 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-gold-1 -> `A-CN-LINEAR-GAP`, `A-CN-ZERO-CHAR`
- THM-ConsciousnessNominalisation-gold-2 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-gold-3 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`
- THM-ConsciousnessNominalisation-gold-4 -> `A-CN-LINEAR-GAP`, `A-CN-NORM-DEN`

## Falsification boundaries
- Claims depend on linear gap semantics and do not directly transfer to nonlinear grounding functions.
- Deficit normalization assumes denominator positivity via `|nominal| + 1`; alternative normalizations require remapping.
- Anti-grounding monotonicity claims require explicit ordered grounding witnesses.

## Status
- gold-formal-core
