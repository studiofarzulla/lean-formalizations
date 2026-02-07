# PaperMap: CBDCPrivacy

## Canonical paper
- papers-official/cbdc-privacy/main.tex

## Lean entrypoints
- FarzullaProofs/CBDCPrivacy/Basic.lean
- FarzullaProofs/CBDCPrivacy/Bridge.lean

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

## Status
- silver-bridge
