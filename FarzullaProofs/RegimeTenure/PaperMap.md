# PaperMap: RegimeTenure

## Canonical paper
- papers-official/rom-ethics/legitimacy-carve/main.tex

## Lean entrypoints
- FarzullaProofs/RegimeTenure/Basic.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: declarations listed in the paper's Appendix (Lean verification table); the
  module file is kept byte-identical to the paper's companion `RegimeTenure.lean`,
  so THM IDs live in this map rather than in source docstrings.

## Gold mapping
- THM-RegimeTenure-gold-1 -> `survival_threshold`
- THM-RegimeTenure-gold-2 -> `draining_iff`
- THM-RegimeTenure-gold-3 -> `tenure_pos`
- THM-RegimeTenure-gold-4 -> `tenure_anti_burden`
- THM-RegimeTenure-gold-5 -> `burden_mono_friction`
- THM-RegimeTenure-gold-6 -> `tenure_anti_friction`
- THM-RegimeTenure-gold-7 -> `tenure_mono_replenishment`
- THM-RegimeTenure-gold-8 -> `tenure_anti_intensity`
- THM-RegimeTenure-gold-9 -> `tenure_mono_reserves`
- THM-RegimeTenure-gold-10 -> `full_legitimacy_no_drain`
- THM-RegimeTenure-gold-11 -> `burden_anti_legitimacy`
- THM-RegimeTenure-gold-12 -> `tenure_mono_legitimacy`
- THM-RegimeTenure-gold-13 -> `burden_eq_burdenL_zero`
- THM-RegimeTenure-gold-14 -> `burdenL_mono_friction`
- THM-RegimeTenure-gold-15 -> `tenure_anti_friction_L`
- THM-RegimeTenure-gold-16 -> `tenure_mono_replenishment_L`

## Assumption tags
- Linear capacity drain (burden `γκF − r`; coupled `γκ(1−L)F − r`) and tenure law `T = C₀/b`: `A-RT-LINEAR-BURDEN`.
- Strictly positive initial suppression capacity (`0 < C₀`): `A-RT-RESERVES-POS`.
- Draining-regime witness (`0 < burden`): `A-RT-BURDEN-POS`.
- Positive unit suppression cost (`0 < γκ`, or componentwise `0 < γ`, `0 < F`): `A-RT-COST-POS`.
- Nonnegative replenishment (`0 ≤ r`): `A-RT-REPL-NN`.
- Linear legitimacy gate (`g(L) = 1 − L`): `A-RT-GATE-LINEAR`.
- Ordered-parameter witness for comparative statics (`F₁ < F₂`, `r₁ < r₂`, etc.): `A-RT-ORDERED`.

## Claim-level assumptions
- THM-RegimeTenure-gold-1 -> `A-RT-LINEAR-BURDEN`
- THM-RegimeTenure-gold-2 -> `A-RT-LINEAR-BURDEN`
- THM-RegimeTenure-gold-3 -> `A-RT-LINEAR-BURDEN`, `A-RT-RESERVES-POS`, `A-RT-BURDEN-POS`
- THM-RegimeTenure-gold-4 -> `A-RT-LINEAR-BURDEN`, `A-RT-RESERVES-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-5 -> `A-RT-LINEAR-BURDEN`, `A-RT-COST-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-6 -> `A-RT-LINEAR-BURDEN`, `A-RT-RESERVES-POS`, `A-RT-COST-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-7 -> `A-RT-LINEAR-BURDEN`, `A-RT-RESERVES-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-8 -> `A-RT-LINEAR-BURDEN`, `A-RT-RESERVES-POS`, `A-RT-COST-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-9 -> `A-RT-LINEAR-BURDEN`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-10 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-REPL-NN`
- THM-RegimeTenure-gold-11 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-COST-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-12 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-RESERVES-POS`, `A-RT-COST-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-13 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`
- THM-RegimeTenure-gold-14 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-COST-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-15 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-RESERVES-POS`, `A-RT-COST-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`
- THM-RegimeTenure-gold-16 -> `A-RT-LINEAR-BURDEN`, `A-RT-GATE-LINEAR`, `A-RT-RESERVES-POS`, `A-RT-BURDEN-POS`, `A-RT-ORDERED`

## Falsification boundaries
- If capacity drain is nonlinear in suppressed friction, the linear tenure law `T = C₀/b` does not apply.
- If the draining witness (`0 < burden`) is absent, tenure comparative statics are not triggered; the funded branch (`b ≤ 0`) is governed by the first-passage escape law, which is verified numerically (`tenure_law_verify.py`), not formalized here.
- If the legitimacy gate deviates from `g(L) = 1 − L` (e.g. repression backfire raising latent friction), the gated-burden claims do not apply.
- The first-passage identity (mean tenure `= C₀/b`) itself is proved by hand in the paper's appendix and is outside the formalized scope.

## Status
- gold-formal-core
