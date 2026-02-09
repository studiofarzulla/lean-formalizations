# PaperMap: SemanticVision

## Canonical paper
- papers-official/semantic-vision/semantic-vision-arxiv.tex

## Lean entrypoints
- FarzullaProofs/SemanticVision/Basic.lean
- FarzullaProofs/SemanticVision/Bridge.lean
- FarzullaProofs/SemanticVision/Advanced.lean

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

## Gold mapping
- THM-semvis-gold-1 -> `jaccard_eq_zero_of_disjoint`
- THM-semvis-gold-2 -> `jaccardDistance_eq_one_of_disjoint`
- THM-semvis-gold-3 -> `jaccardDistance_bounds`
- THM-semvis-gold-4 -> `jaccardDistance_eq_zero_of_eq`

## Assumption tags
- Set-overlap algebra on finite sets: `A-SV-FINSET`.
- Non-empty union witness for upper-bound and non-negativity bridge claims: `A-SV-UNION-NONEMPTY`.
- Disjointness witness for maximal-distance regime: `A-SV-DISJOINT`.

## Claim-level assumptions
- THM-semvis-bronze-1 -> `A-SV-FINSET`
- THM-semvis-bronze-2 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`
- THM-semvis-bronze-3 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`
- THM-semvis-silver-1 -> `A-SV-FINSET`
- THM-semvis-silver-2 -> `A-SV-FINSET`
- THM-semvis-silver-3 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`
- THM-semvis-silver-4 -> `A-SV-FINSET`
- THM-semvis-silver-5 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`
- THM-semvis-silver-6 -> `A-SV-FINSET`
- THM-semvis-gold-1 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`, `A-SV-DISJOINT`
- THM-semvis-gold-2 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`, `A-SV-DISJOINT`
- THM-semvis-gold-3 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`
- THM-semvis-gold-4 -> `A-SV-FINSET`, `A-SV-UNION-NONEMPTY`

## Falsification boundaries
- If domains are not finite-set based, the exact Jaccard cardinality formulas here do not directly apply.
- Claims requiring non-empty union witness do not cover empty-union edge cases without separate conventions.
- The current bridge formalizes boundedness/symmetry, not metric triangle inequality.

## Notes
- The formal core captures overlap structure via Jaccard similarity on finite sets.
- Bridge theorems convert similarity to a bounded symmetric distance view.

## Status
- gold-formal-core
