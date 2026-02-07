# PaperMap: GenreMimicry

## Canonical paper
- papers-official/genre-mimicry/genre-mimicry-arxiv.tex

## Lean entrypoints
- FarzullaProofs/GenreMimicry/Basic.lean
- FarzullaProofs/GenreMimicry/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-genre-bronze-1 -> `rate_nonneg`
- THM-genre-bronze-2 -> `rate_le_one`
- THM-genre-bronze-3 -> `rate_gap_pos`
- THM-genre-bronze-4 -> `odds_pos`

## Silver bridge mapping
- THM-genre-silver-1 -> `rateComplement`
- THM-genre-silver-2 -> `rate_mono_numerator`
- THM-genre-silver-3 -> `rateComplement_nonneg`
- THM-genre-silver-4 -> `rateComplement_le_one`
- THM-genre-silver-5 -> `rate_add_rateComplement`
- THM-genre-silver-6 -> `rateComplement_anti_numerator`
- THM-genre-silver-7 -> `odds_rate_pos_of_bounds`

## Notes
- Core theorems model disclaimer frequencies as rates.
- Bridge layer adds complement and monotonicity structure for comparative analysis.

## Status
- silver-bridge
