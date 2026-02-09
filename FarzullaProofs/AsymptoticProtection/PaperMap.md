# PaperMap: AsymptoticProtection

## Canonical paper
- papers-official/asymptotic/asymptotic-protection-sublimated.tex

## Lean entrypoints
- FarzullaProofs/AsymptoticProtection/Basic.lean
- FarzullaProofs/AsymptoticProtection/Bridge.lean
- FarzullaProofs/AsymptoticProtection/Advanced.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-AsymptoticProtection-bronze-1 -> `protectionLevel`
- THM-AsymptoticProtection-bronze-2 -> `protectionLevel_nonneg`
- THM-AsymptoticProtection-bronze-3 -> `protectionLevel_le_one`
- THM-AsymptoticProtection-bronze-4 -> `protectionLevel_zero_effort`

## Silver bridge mapping
- THM-AsymptoticProtection-silver-1 -> `saturationGap`
- THM-AsymptoticProtection-silver-2 -> `saturationGap_nonneg`
- THM-AsymptoticProtection-silver-3 -> `saturationGap_eq_inv`
- THM-AsymptoticProtection-silver-4 -> `saturationGap_anti_effort`
- THM-AsymptoticProtection-silver-5 -> `saturationGap_zero_effort`

## Gold mapping
- THM-AsymptoticProtection-gold-1 -> `saturationGap_le_one`
- THM-AsymptoticProtection-gold-2 -> `protectionLevel_add_saturationGap`
- THM-AsymptoticProtection-gold-3 -> `saturationGap_eq_one_sub_protectionLevel`
- THM-AsymptoticProtection-gold-4 -> `protectionLevel_eq_one_sub_saturationGap`

## Assumption tags
- Nonnegative parameter domain for effort and intensity terms: `A-AP-NONNEG`.
- Positive denominator domain for rational closed forms: `A-AP-DEN-POS`.
- Monotone-effort ordering assumptions for anti-gap results: `A-AP-EFFORT-MONO`.

## Claim-level assumptions
- THM-AsymptoticProtection-bronze-1 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-bronze-2 -> `A-AP-NONNEG`
- THM-AsymptoticProtection-bronze-3 -> `A-AP-NONNEG`
- THM-AsymptoticProtection-bronze-4 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-silver-1 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-silver-2 -> `A-AP-NONNEG`
- THM-AsymptoticProtection-silver-3 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-silver-4 -> `A-AP-NONNEG`, `A-AP-EFFORT-MONO`, `A-AP-DEN-POS`
- THM-AsymptoticProtection-silver-5 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-gold-1 -> `A-AP-NONNEG`
- THM-AsymptoticProtection-gold-2 -> `A-AP-DEN-POS`
- THM-AsymptoticProtection-gold-3 -> `NONE`
- THM-AsymptoticProtection-gold-4 -> `NONE`

## Falsification boundaries
- If denominator positivity (`1 + k*n > 0`) is not satisfied, rational closed-form and bounds claims can fail.
- Anti-effort monotonicity claims apply only under nonnegative `k` and ordered effort comparisons.
- These theorems formalize the deterministic algebraic scaffold; stochastic or adversarial perturbation models require additional assumptions.

## Status
- gold-formal-core
