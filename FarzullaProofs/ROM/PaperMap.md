# PaperMap: ROM

## Canonical paper
- papers-official/rom-ethics/main.tex

## Lean entrypoints
- FarzullaProofs/ROM/Basic.lean
- FarzullaProofs/ROM/Advanced.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Core mapping (selected)
- Section 4.1 normalization -> `row_stochastic_sum`, `row_stochastic_sum_const`
- Section 4.1 simplex invariance -> `rom_simplex_invariant`
- Remark 3.1 -> `identity_kernel_selection`, `identity_kernel_row_stochastic`
- Appendix D detailed balance/non-potential -> `detailed_balance_zero_flow`, `rps_not_potential`
- Section 5 consent survival monotonicity -> `consent_survival_mono_legitimacy`, `consent_survival_anti_friction`

## Gold extensions
- THM-rom-gold-1 -> `consent_survival_nonneg`
- THM-rom-gold-2 -> `consent_survival_zero_legitimacy`
- THM-rom-gold-3 -> `consent_survival_scale_legitimacy`
- THM-rom-gold-4 -> `consent_survival_le_legitimacy`
- THM-rom-gold-5 -> `consent_survival_pos`
- THM-rom-gold-6 -> `row_stochastic_sum_const`

## Status
- gold-formal-core
