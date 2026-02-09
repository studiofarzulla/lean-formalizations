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

## Assumption tags
- Residual model as linear subtraction (`incidents - blocked`): `A-AR-LINEAR-RESIDUAL`.
- Positive incident-volume denominator for ratio claims: `A-AR-INC-POS`.
- Nonnegative/ordered blocking and ratio-domain assumptions: `A-AR-BOUNDS`.

## Claim-level assumptions
- THM-AutonomousRedteam-bronze-1 -> `A-AR-LINEAR-RESIDUAL`
- THM-AutonomousRedteam-bronze-2 -> `A-AR-LINEAR-RESIDUAL`, `A-AR-BOUNDS`
- THM-AutonomousRedteam-bronze-3 -> `A-AR-LINEAR-RESIDUAL`
- THM-AutonomousRedteam-bronze-4 -> `A-AR-LINEAR-RESIDUAL`, `A-AR-BOUNDS`
- THM-AutonomousRedteam-silver-1 -> `A-AR-INC-POS`
- THM-AutonomousRedteam-silver-2 -> `A-AR-INC-POS`, `A-AR-BOUNDS`
- THM-AutonomousRedteam-silver-3 -> `A-AR-LINEAR-RESIDUAL`, `A-AR-INC-POS`
- THM-AutonomousRedteam-silver-4 -> `A-AR-BOUNDS`
- THM-AutonomousRedteam-silver-5 -> `A-AR-LINEAR-RESIDUAL`

## Falsification boundaries
- Ratio-based statements require strictly positive incident baseline and fail at zero-denominator edge cases.
- Residual monotonicity/anti-ratio claims assume linear residual accounting; nonlinear mitigation-response models are out of scope.
- Bounds claims rely on explicit nonnegativity/order witnesses for blocked incidents and ratios.

## Status
- silver-bridge
