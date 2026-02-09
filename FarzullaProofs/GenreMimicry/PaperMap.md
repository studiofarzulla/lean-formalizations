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

## Assumption tags
- Positive denominator/count-domain assumptions for rate arithmetic: `A-GM-TOTAL-POS`.
- Numerator/total ordering assumptions for boundedness and monotonicity: `A-GM-COUNT-BOUNDS`.
- Probability-open-interval assumptions for odds positivity: `A-GM-ODDS-DOM`.

## Claim-level assumptions
- THM-genre-bronze-1 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-bronze-2 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-bronze-3 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-bronze-4 -> `A-GM-ODDS-DOM`
- THM-genre-silver-1 -> `A-GM-TOTAL-POS`
- THM-genre-silver-2 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-silver-3 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-silver-4 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-silver-5 -> `A-GM-TOTAL-POS`
- THM-genre-silver-6 -> `A-GM-TOTAL-POS`, `A-GM-COUNT-BOUNDS`
- THM-genre-silver-7 -> `A-GM-TOTAL-POS`, `A-GM-ODDS-DOM`

## Falsification boundaries
- If total counts are non-positive, rate and complement inequalities in this mapping are invalid.
- Monotonicity and anti-monotonicity claims depend on fixed-denominator comparisons and do not automatically extend to changing totals.
- Odds claims require the mapped rate to remain strictly inside `(0,1)`; edge cases at `0` or `1` are excluded.

## Notes
- Core theorems model disclaimer frequencies as rates.
- Bridge layer adds complement and monotonicity structure for comparative analysis.

## Status
- silver-bridge
