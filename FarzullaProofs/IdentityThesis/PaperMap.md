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

## Bronze mapping
- THM-identity-bronze-1 (Axiom 2.2 operationalization) -> `self_not_in_refSet`
- THM-identity-bronze-2 (Axiom 2.4 bridge) -> `defined_iff_refSet_nonempty`
- THM-identity-bronze-3 (symmetric-delta membership lift) -> `mutual_membership_of_symmetric`
- THM-identity-bronze-4 (referential extensionality bridge) -> `delta_ext_of_refSet_eq`

## Silver mapping
- THM-identity-silver-1 (Theorem 2.5 identity thesis) -> `identity_thesis`
- THM-identity-silver-2 (Corollary 2.6 no-self-sufficiency) -> `no_self_sufficient`
- THM-identity-silver-3 (empty-set distinguishability witness) -> `empty_ne_singleton_zero`
- THM-identity-silver-4 (Proposition 4.1 empty set defined) -> `empty_set_defined`
- THM-identity-silver-5 (Proposition 4.1 nonempty referential set) -> `empty_set_refSet_nonempty`
- THM-identity-silver-6 (non-universal set definedness) -> `ne_univ_defined`
- THM-identity-silver-7 (set-level self exclusion) -> `set_self_not_in_refSet`
- THM-identity-silver-8 (weak discernibility witness pair) -> `weak_discernibility_complex`
- THM-identity-silver-9 (structural symmetry root condition) -> `i_squared`
- THM-identity-silver-10 (Benacerraf encoding divergence) -> `benacerraf_two`

## Gold candidate mapping
- THM-identity-gold-1 (complex root dual satisfaction) -> `neg_i_squared`
- THM-identity-gold-2 (Von Neumann encoding theorem) -> `vonNeumann_two`
- THM-identity-gold-3 (Zermelo encoding theorem) -> `zermelo_two`
- THM-identity-gold-4 (Von Neumann successor cardinal growth) -> `vonNeumann_succ_card`
- THM-identity-gold-5 (Zermelo successor cardinal bound) -> `zermelo_succ_card`

## Assumption tags
- Delta-framework core results: `A-ID-DELTA-IRREFL`.
- Set-theoretic instance and extensional witnesses: `A-ID-SET-EXT`.
- Complex structural examples: `A-ID-CPLX-STD`.
- Benacerraf encoding comparison: `A-ID-ENCODING`.

## Claim-level assumptions
- THM-identity-bronze-1 -> `A-ID-DELTA-IRREFL`
- THM-identity-bronze-2 -> `A-ID-DELTA-IRREFL`
- THM-identity-bronze-3 -> `A-ID-DELTA-IRREFL`
- THM-identity-bronze-4 -> `A-ID-DELTA-IRREFL`
- THM-identity-silver-1 -> `A-ID-DELTA-IRREFL`
- THM-identity-silver-2 -> `A-ID-DELTA-IRREFL`
- THM-identity-silver-3 -> `A-ID-SET-EXT`
- THM-identity-silver-4 -> `A-ID-SET-EXT`
- THM-identity-silver-5 -> `A-ID-SET-EXT`
- THM-identity-silver-6 -> `A-ID-SET-EXT`
- THM-identity-silver-7 -> `A-ID-SET-EXT`, `A-ID-DELTA-IRREFL`
- THM-identity-silver-8 -> `A-ID-CPLX-STD`
- THM-identity-silver-9 -> `A-ID-CPLX-STD`
- THM-identity-silver-10 -> `A-ID-ENCODING`
- THM-identity-gold-1 -> `A-ID-CPLX-STD`
- THM-identity-gold-2 -> `A-ID-ENCODING`
- THM-identity-gold-3 -> `A-ID-ENCODING`
- THM-identity-gold-4 -> `A-ID-ENCODING`
- THM-identity-gold-5 -> `A-ID-ENCODING`

## Falsification boundaries
- If delta irreflexivity is weakened, self-exclusion and no-self-sufficient claims do not follow.
- If the set-theoretic model is not extensional (or not modeled as inequality-based delta), Section 4 witness claims do not transfer.
- If the complex-number structure is replaced by a weaker algebraic system, weak-discernibility examples may not hold unchanged.
- Encoding-divergence claims are representation-dependent and do not imply ontology-level disagreement without structural interpretation.

## Status
- silver-existing
