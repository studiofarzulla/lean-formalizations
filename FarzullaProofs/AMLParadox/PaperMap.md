# PaperMap: AMLParadox

## Canonical paper
- papers-official/aml-paradox/main-arxiv.tex

## Lean entrypoints
- FarzullaProofs/AMLParadox/Basic.lean
- FarzullaProofs/AMLParadox/Bridge.lean
- FarzullaProofs/AMLParadox/Advanced.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-AMLParadox-bronze-1 -> `amlUtility`
- THM-AMLParadox-bronze-2 -> `amlUtility_mono_tp`
- THM-AMLParadox-bronze-3 -> `amlUtility_anti_fp`
- THM-AMLParadox-bronze-4 -> `amlUtility_eq_tp_of_zero_penalty`

## Silver bridge mapping
- THM-AMLParadox-silver-1 -> `falsePositiveRate`
- THM-AMLParadox-silver-2 -> `truePositiveRate`
- THM-AMLParadox-silver-3 -> `netDetectionAdvantage`
- THM-AMLParadox-silver-4 -> `netDetectionAdvantage_eq_scaled_gap`
- THM-AMLParadox-silver-5 -> `netDetectionAdvantage_pos_of_tp_gt_fp`
- THM-AMLParadox-silver-6 -> `amlUtility_anti_penalty`

## Gold mapping
- THM-AMLParadox-gold-1 -> `netDetectionAdvantage_eq_zero_of_eq`
- THM-AMLParadox-gold-2 -> `netDetectionAdvantage_nonneg_of_tp_ge_fp`
- THM-AMLParadox-gold-3 -> `amlUtility_eq_add_scaled`
- THM-AMLParadox-gold-4 -> `amlUtility_eq_gap_of_unit_penalty`

## Assumption tags
- Additive linear utility model in TP/FP and penalty: `A-AML-LINEAR-UTILITY`.
- Positive denominator assumptions for rate/advantage normalization: `A-AML-TOTAL-POS`.
- Nonnegative penalty/FP domain for anti-monotonicity claims: `A-AML-NONNEG`.

## Claim-level assumptions
- THM-AMLParadox-bronze-1 -> `A-AML-LINEAR-UTILITY`
- THM-AMLParadox-bronze-2 -> `A-AML-LINEAR-UTILITY`
- THM-AMLParadox-bronze-3 -> `A-AML-LINEAR-UTILITY`, `A-AML-NONNEG`
- THM-AMLParadox-bronze-4 -> `A-AML-LINEAR-UTILITY`
- THM-AMLParadox-silver-1 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-silver-2 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-silver-3 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-silver-4 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-silver-5 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-silver-6 -> `A-AML-LINEAR-UTILITY`, `A-AML-NONNEG`
- THM-AMLParadox-gold-1 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-gold-2 -> `A-AML-TOTAL-POS`
- THM-AMLParadox-gold-3 -> `A-AML-LINEAR-UTILITY`
- THM-AMLParadox-gold-4 -> `A-AML-LINEAR-UTILITY`

## Falsification boundaries
- If total alert volume is non-positive, normalized rate/advantage claims are not valid.
- Utility monotonicity claims rely on linear TP/FP penalty form and do not cover nonlinear compliance objectives.
- Positivity claims for net advantage require explicit TP > FP ordering in the mapped domain.

## Status
- gold-formal-core
