# PaperMap: GenreMimicry

## Canonical paper
- papers-official/genre-mimicry/genre-mimicry-arxiv.tex

## Lean entrypoints
- FarzullaProofs/GenreMimicry/Basic.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-genre-bronze-1 -> `rate_nonneg`
- THM-genre-bronze-2 -> `rate_le_one`
- THM-genre-bronze-3 -> `rate_gap_pos`
- THM-genre-bronze-4 -> `odds_pos`

## Notes
- The formal core models descriptive disclaimer behavior through rates and monotone rate gaps.
- `odds_pos` formalizes a standard probability-domain sanity condition for downstream logistic-style analysis.

## Status
- bronze
