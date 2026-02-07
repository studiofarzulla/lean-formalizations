# PaperMap: AMLParadox

## Canonical paper
- papers-official/aml-paradox/main-arxiv.tex

## Lean entrypoints
- FarzullaProofs/AMLParadox/Basic.lean
- FarzullaProofs/AMLParadox/Bridge.lean

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

## Status
- silver-bridge
