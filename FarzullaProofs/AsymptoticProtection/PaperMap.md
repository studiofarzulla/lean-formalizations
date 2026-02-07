# PaperMap: AsymptoticProtection

## Canonical paper
- papers-official/asymptotic/asymptotic-protection-sublimated.tex

## Lean entrypoints
- FarzullaProofs/AsymptoticProtection/Basic.lean
- FarzullaProofs/AsymptoticProtection/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-AsymptoticProtection-bronze-1 -> `protectionLevel`
- THM-AsymptoticProtection-bronze-2 -> `protectionLevel_nonneg`
- THM-AsymptoticProtection-bronze-3 -> `protectionLevel_le_one`
- THM-AsymptoticProtection-bronze-4 -> `protectionLevel_zero_effort`

## Silver bridge mapping
- THM-AsymptoticProtection-silver-1 -> `saturationGap`
- THM-AsymptoticProtection-silver-2 -> `saturationGap_nonneg`
- THM-AsymptoticProtection-silver-3 -> `saturationGap_eq_inv`
- THM-AsymptoticProtection-silver-4 -> `saturationGap_anti_effort`
- THM-AsymptoticProtection-silver-5 -> `saturationGap_zero_effort`

## Status
- silver-bridge
