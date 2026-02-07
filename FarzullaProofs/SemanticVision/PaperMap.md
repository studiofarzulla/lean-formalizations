# PaperMap: SemanticVision

## Canonical paper
- papers-official/semantic-vision/semantic-vision-arxiv.tex

## Lean entrypoints
- FarzullaProofs/SemanticVision/Basic.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-semvis-bronze-1 -> `jaccard_nonneg`
- THM-semvis-bronze-2 -> `jaccard_le_one`
- THM-semvis-bronze-3 -> `jaccard_self_eq_one`

## Notes
- The formal core captures the overlap-based descriptive figure logic with a finite-set Jaccard index.
- `jaccard_le_one` uses a nonempty-union precondition, matching the denominator-safety condition in text.

## Status
- bronze
