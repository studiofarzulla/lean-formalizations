# PaperMap: ConsensualSovereignty

## Canonical paper
- papers-official/consensual-sovereignty/paper/Farzulla_2025_Consent_Holding_v1.0.2.tex

## Lean entrypoints
- FarzullaProofs/ConsensualSovereignty/Definitions.lean
- FarzullaProofs/ConsensualSovereignty/Core.lean
- FarzullaProofs/ConsensualSovereignty/Dynamics.lean
- FarzullaProofs/ConsensualSovereignty/Advanced.lean

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

## Status
- gold-formal-core
