# PaperMap: ROMEthics

## Canonical paper
- papers-official/rom-ethics/main.tex

## Lean entrypoints
- FarzullaProofs/ROMEthics/Basic.lean
- FarzullaProofs/ROMEthics/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-ROMEthics-bronze-1 -> `welfareScore`
- THM-ROMEthics-bronze-2 -> `welfareScore_mono_benefit`
- THM-ROMEthics-bronze-3 -> `welfareScore_anti_harm`
- THM-ROMEthics-bronze-4 -> `welfareScore_eq_benefit_of_zero_weight`

## Silver bridge mapping
- THM-ROMEthics-silver-1 -> `ethicalSurvival`
- THM-ROMEthics-silver-2 -> `ethicalSurvival_mono_benefit`
- THM-ROMEthics-silver-3 -> `ethicalSurvival_anti_harm`
- THM-ROMEthics-silver-4 -> `ethicalSurvival_eq_rom_survival_of_zero_harm`
- THM-ROMEthics-silver-5 -> `ethicalSurvival_mono_alignment_via_friction`

## Status
- silver-bridge
