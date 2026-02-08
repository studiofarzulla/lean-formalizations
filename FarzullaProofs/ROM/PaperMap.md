# PaperMap: ROM

## Canonical paper
- papers-official/rom-ethics/main.tex

## Lean entrypoints
- FarzullaProofs/ROM/Basic.lean
- FarzullaProofs/ROM/Advanced.lean
- FarzullaProofs/ROM/Transfers.lean

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

## Transfer mapping
- THM-rom-transfer-1 -> `rom_movingEquilibrium`
- THM-rom-transfer-2 -> `rom_no_static_if_path_varies`
- THM-rom-transfer-3 -> `rom_path_boundedChase_zero`
- THM-rom-transfer-4 -> `rom_dissensus_of_positive_discrepancy`
- THM-rom-transfer-5 -> `romPath_nonneg`

## Assumption tags
- `row_stochastic_sum`, `rom_simplex_invariant`, `row_stochastic_sum_const`: `A-ROM-ROWSTOCH` (+`A-ROM-SIMPLEX` for simplex theorem)
- consent survival sign/bounds theorems: `A-ROM-L-NN`, `A-ROM-F-NN` (or positivity variants)
- transfer no-static theorem: `A-DYN-VARPATH`
- transfer dissensus theorem: `A-DISC-EQ0`, `A-DISC-POS`
- transfer moving-equilibrium theorem: `A-DYN-MOVEQ`

## Claim-level assumptions
- THM-rom-gold-1 -> `A-ROM-L-NN`, `A-ROM-F-NN`
- THM-rom-gold-2 -> `NONE`
- THM-rom-gold-3 -> `NONE`
- THM-rom-gold-4 -> `A-ROM-L-NN`, `A-ROM-F-NN`
- THM-rom-gold-5 -> `A-ROM-F-NN`
- THM-rom-gold-6 -> `A-ROM-ROWSTOCH`
- THM-rom-transfer-1 -> `A-DYN-MOVEQ`
- THM-rom-transfer-2 -> `A-DYN-VARPATH`
- THM-rom-transfer-3 -> `A-CHASE-EXACT`, `A-DISC-EQ0`
- THM-rom-transfer-4 -> `A-DISC-EQ0`, `A-DISC-POS`
- THM-rom-transfer-5 -> `A-ROM-L-NN`, `A-ROM-F-NN`

## Falsification boundaries
- If row-stochasticity fails, mass-preservation claims do not apply.
- If friction can be below `-1`, survival denominator can fail and sign/bound claims break.
- If path variation witness is absent, no-static transfer theorem is not triggered.

## Status
- gold-formal-core
