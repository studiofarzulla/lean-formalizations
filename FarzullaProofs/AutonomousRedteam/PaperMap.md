# PaperMap: AutonomousRedteam

## Canonical paper
- papers-official/autonomous/autonomous-redteam.tex

## Lean entrypoints
- FarzullaProofs/AutonomousRedteam/Basic.lean
- FarzullaProofs/AutonomousRedteam/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-AutonomousRedteam-bronze-1 -> `residualIncidents`
- THM-AutonomousRedteam-bronze-2 -> `residualIncidents_anti_blocked`
- THM-AutonomousRedteam-bronze-3 -> `residualIncidents_zero_of_full_block`
- THM-AutonomousRedteam-bronze-4 -> `residualIncidents_nonneg`

## Silver bridge mapping
- THM-AutonomousRedteam-silver-1 -> `reductionRatio`
- THM-AutonomousRedteam-silver-2 -> `reductionRatio_bounds`
- THM-AutonomousRedteam-silver-3 -> `residualIncidents_eq_incidents_mul_one_sub_ratio`
- THM-AutonomousRedteam-silver-4 -> `residualIncidents_anti_ratio`
- THM-AutonomousRedteam-silver-5 -> `residualIncidents_zero_of_ratio_one`

## Status
- silver-bridge
