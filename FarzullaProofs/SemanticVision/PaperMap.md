# PaperMap: SemanticVision

## Canonical paper
- papers-official/semantic-vision/semantic-vision-arxiv.tex

## Lean entrypoints
- FarzullaProofs/SemanticVision/Basic.lean
- FarzullaProofs/SemanticVision/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-semvis-bronze-1 -> `jaccard_nonneg`
- THM-semvis-bronze-2 -> `jaccard_le_one`
- THM-semvis-bronze-3 -> `jaccard_self_eq_one`

## Silver bridge mapping
- THM-semvis-silver-1 -> `jaccardDistance`
- THM-semvis-silver-2 -> `jaccard_symm`
- THM-semvis-silver-3 -> `jaccardDistance_nonneg`
- THM-semvis-silver-4 -> `jaccardDistance_le_one`
- THM-semvis-silver-5 -> `jaccardDistance_self_eq_zero`
- THM-semvis-silver-6 -> `jaccardDistance_symm`

## Notes
- The formal core captures overlap structure via Jaccard similarity on finite sets.
- Bridge theorems convert similarity to a bounded symmetric distance view.

## Status
- silver-bridge
