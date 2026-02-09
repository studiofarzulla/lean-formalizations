# PaperMap: ROMEthics

## Canonical paper
- papers-official/rom-ethics/main.tex

## Lean entrypoints
- FarzullaProofs/ROMEthics/Basic.lean
- FarzullaProofs/ROMEthics/Bridge.lean
- FarzullaProofs/ROMEthics/Advanced.lean

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

## Gold mapping
- THM-ROMEthics-gold-1 -> `ethicalSurvival_eq_welfare_of_zero_friction`
- THM-ROMEthics-gold-2 -> `ethicalSurvival_nonneg`
- THM-ROMEthics-gold-3 -> `ethicalSurvival_le_welfare`
- THM-ROMEthics-gold-4 -> `ethicalSurvival_mono_benefit_zero_friction`

## Assumption tags
- Linear welfare model in benefit/harm and ethical weight: `A-RE-LINEAR-WELFARE`.
- Nonnegative friction / denominator domain for survival normalization: `A-RE-FRICTION-DOM`.
- Nonnegative ethical weight assumptions for anti-harm claims: `A-RE-WEIGHT-NN`.
- AoC/ROM bridge assumptions for alignment-through-friction transfer: `A-RE-AOC-ROM-BRIDGE`.
- Nonnegative welfare domain assumptions for sign/bound claims: `A-RE-WELFARE-NN`.

## Claim-level assumptions
- THM-ROMEthics-bronze-1 -> `A-RE-LINEAR-WELFARE`
- THM-ROMEthics-bronze-2 -> `A-RE-LINEAR-WELFARE`
- THM-ROMEthics-bronze-3 -> `A-RE-LINEAR-WELFARE`, `A-RE-WEIGHT-NN`
- THM-ROMEthics-bronze-4 -> `A-RE-LINEAR-WELFARE`
- THM-ROMEthics-silver-1 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`
- THM-ROMEthics-silver-2 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`
- THM-ROMEthics-silver-3 -> `A-RE-LINEAR-WELFARE`, `A-RE-WEIGHT-NN`, `A-RE-FRICTION-DOM`
- THM-ROMEthics-silver-4 -> `A-RE-LINEAR-WELFARE`, `A-RE-AOC-ROM-BRIDGE`
- THM-ROMEthics-silver-5 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`, `A-RE-AOC-ROM-BRIDGE`
- THM-ROMEthics-gold-1 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`
- THM-ROMEthics-gold-2 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`, `A-RE-WELFARE-NN`
- THM-ROMEthics-gold-3 -> `A-RE-LINEAR-WELFARE`, `A-RE-FRICTION-DOM`, `A-RE-WELFARE-NN`
- THM-ROMEthics-gold-4 -> `A-RE-LINEAR-WELFARE`

## Falsification boundaries
- Ethical survival results assume denominator positivity (`1 + F > 0`) and do not cover singular regimes.
- Welfare monotonicity claims rely on linear welfare specification and may fail under nonlinear ethical utility.
- Alignment-transfer claims depend on AoC friction monotonicity and ROM anti-friction survival assumptions as imported.

## Status
- gold-formal-core
