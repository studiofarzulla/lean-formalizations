# PaperMap: IdentityThesis

## Canonical paper
- papers-official/identity-thesis/main.tex

## Lean entrypoints
- FarzullaProofs/IdentityThesis/Basic.lean
- FarzullaProofs/IdentityThesis/SetTheory.lean
- FarzullaProofs/IdentityThesis/Structuralism.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Core mapping (selected)
- Theorem 2.5 (identity thesis) -> `identity_thesis`
- Corollary 2.6 -> `no_self_sufficient`
- Axiom 2.4 bridge -> `defined_iff_refSet_nonempty`
- Structural discernibility -> `weak_discernibility_complex`
- Benacerraf divergence -> `benacerraf_two`

## Status
- silver-existing
