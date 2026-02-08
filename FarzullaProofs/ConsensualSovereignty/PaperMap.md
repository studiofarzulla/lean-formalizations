# PaperMap: ConsensualSovereignty

## Canonical paper
- papers-official/consensual-sovereignty/paper/Farzulla_2025_Consent_Holding_v1.0.2.tex

## Lean entrypoints
- FarzullaProofs/ConsensualSovereignty/Definitions.lean
- FarzullaProofs/ConsensualSovereignty/Core.lean
- FarzullaProofs/ConsensualSovereignty/Dynamics.lean
- FarzullaProofs/ConsensualSovereignty/Advanced.lean
- FarzullaProofs/ConsensualSovereignty/Transfers.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Core mapped claims
- THM-consov-4-1 -> `consent_holder_exists`
- THM-consov-4-2 -> `alignment_nonneg`
- THM-consov-4-3 -> `alignment_le_one`
- THM-consov-4-4 -> `friction_nonneg`
- THM-consov-4-5 -> `friction_zero_of_perfect_alignment`
- THM-consov-4-6 -> `legitimacy_mono_alignment`
- THM-consov-4-7 -> `legitimacy_strict_mono_alignment`

## Gold extensions
- THM-consov-gold-1 -> `totalStake_nonneg`
- THM-consov-gold-2 -> `totalStake_pos_of_exists_pos`
- THM-consov-gold-3 -> `alignment_eq_one_of_voice_one`
- THM-consov-gold-4 -> `alignment_mono_voice`
- THM-consov-gold-5 -> `legitimacy_mono_performance`
- THM-consov-gold-6 -> `legitimacy_strict_mono_performance`
- THM-consov-gold-7 -> `friction_zero_of_zero_stakes`

## Transfer mapping
- THM-consov-transfer-1 -> `consov_movingEquilibrium`
- THM-consov-transfer-2 -> `consov_no_static_if_path_varies`
- THM-consov-transfer-3 -> `consovPath_mono_alignment`
- THM-consov-transfer-4 -> `consov_dissensus_of_positive_discrepancy`
- THM-consov-transfer-5 -> `consov_path_boundedChase_zero`

## Assumption tags
- stake/alignment/friction family: `A-CS-FINITE`, `A-CS-STAKE-NN` (+ `A-CS-VOICE-BOUND` where needed)
- positive-total-stake claims: `A-CS-STAKE-NN`, `A-CS-STAKE-POS-WIT`
- legitimacy monotonicity: `A-CS-W1-NN` or `A-CS-W2-NN` / `A-CS-W2-POS`
- transfer no-static theorem: `A-DYN-VARPATH`
- transfer dissensus theorem: `A-DISC-EQ0`, `A-DISC-POS`

## Falsification boundaries
- If finite-index or nonnegative-stake assumptions fail, weighted-sum bounds do not transfer.
- If weight-sign assumptions fail (`w1`, `w2`), monotonicity can reverse.
- If path variation witness is absent, no-static transfer theorem is not triggered.

## Status
- gold-formal-core
