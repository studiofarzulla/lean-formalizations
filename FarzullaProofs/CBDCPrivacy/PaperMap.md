# PaperMap: CBDCPrivacy

## Canonical paper
- papers-official/cbdc-privacy/main.tex

## Lean entrypoints
- FarzullaProofs/CBDCPrivacy/Basic.lean
- FarzullaProofs/CBDCPrivacy/Bridge.lean
- FarzullaProofs/CBDCPrivacy/Advanced.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-CBDCPrivacy-bronze-1 -> `composedEpsilon`
- THM-CBDCPrivacy-bronze-2 -> `composedEpsilon_nonneg`
- THM-CBDCPrivacy-bronze-3 -> `composedEpsilon_comm`
- THM-CBDCPrivacy-bronze-4 -> `composedEpsilon_mono_left`

## Silver bridge mapping
- THM-CBDCPrivacy-silver-1 -> `repeatedEpsilon`
- THM-CBDCPrivacy-silver-2 -> `repeatedEpsilon_succ`
- THM-CBDCPrivacy-silver-3 -> `repeatedEpsilon_nonneg`
- THM-CBDCPrivacy-silver-4 -> `repeatedEpsilon_mono_steps`
- THM-CBDCPrivacy-silver-5 -> `repeatedEpsilon_two_eq_composed`

## Gold mapping
- THM-CBDCPrivacy-gold-1 -> `repeatedEpsilon_zero`
- THM-CBDCPrivacy-gold-2 -> `repeatedEpsilon_add_eps`
- THM-CBDCPrivacy-gold-3 -> `repeatedEpsilon_add_steps`
- THM-CBDCPrivacy-gold-4 -> `composedEpsilon_eq_repeated_two`

## Assumption tags
- Additive privacy composition model for sequential releases: `A-CBDC-ADD-COMP`.
- Nonnegative epsilon budget assumptions for monotone/nonnegative bounds: `A-CBDC-EPS-NN`.
- Ordered step-count assumptions for release-growth comparisons: `A-CBDC-STEPS-MONO`.
- Averaging normalization assumptions for two-step equivalence rewrites: `A-CBDC-AVG-NORM`.

## Claim-level assumptions
- THM-CBDCPrivacy-bronze-1 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-bronze-2 -> `A-CBDC-ADD-COMP`, `A-CBDC-EPS-NN`
- THM-CBDCPrivacy-bronze-3 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-bronze-4 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-silver-1 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-silver-2 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-silver-3 -> `A-CBDC-ADD-COMP`, `A-CBDC-EPS-NN`
- THM-CBDCPrivacy-silver-4 -> `A-CBDC-ADD-COMP`, `A-CBDC-EPS-NN`, `A-CBDC-STEPS-MONO`
- THM-CBDCPrivacy-silver-5 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-gold-1 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-gold-2 -> `A-CBDC-ADD-COMP`
- THM-CBDCPrivacy-gold-3 -> `A-CBDC-ADD-COMP`, `A-CBDC-STEPS-MONO`
- THM-CBDCPrivacy-gold-4 -> `A-CBDC-ADD-COMP`, `A-CBDC-AVG-NORM`

## Falsification boundaries
- Results here assume linear/additive composition; advanced composition or concentrated DP variants are out of scope.
- Nonnegativity and monotonicity claims rely on nonnegative epsilon budgets.
- Step-growth comparisons require explicit ordering of release counts (`n <= m`).

## Status
- gold-formal-core
