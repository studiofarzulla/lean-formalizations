# PaperMap: MonographQualia

## Canonical paper
- papers-official/monograph-qualia/consciousness-narrative-paper.tex

## Lean entrypoints
- FarzullaProofs/MonographQualia/Basic.lean
- FarzullaProofs/MonographQualia/Bridge.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-MonographQualia-bronze-1 -> `qualiaDistance`
- THM-MonographQualia-bronze-2 -> `qualiaDistance_nonneg`
- THM-MonographQualia-bronze-3 -> `qualiaDistance_self`
- THM-MonographQualia-bronze-4 -> `qualiaDistance_symm`

## Silver bridge mapping
- THM-MonographQualia-silver-1 -> `qualiaEnergy`
- THM-MonographQualia-silver-2 -> `qualiaEnergy_nonneg`
- THM-MonographQualia-silver-3 -> `qualiaEnergy_self`
- THM-MonographQualia-silver-4 -> `qualiaEnergy_symm`
- THM-MonographQualia-silver-5 -> `qualiaDistance_triangle`

## Assumption tags
- Real absolute-difference metric scaffold for qualia distance: `A-MQ-ABS-METRIC`.
- Nonnegative square-energy transform assumptions: `A-MQ-ENERGY-SQ`.
- Triangle-inequality inheritance from absolute value geometry: `A-MQ-TRIANGLE`.

## Claim-level assumptions
- THM-MonographQualia-bronze-1 -> `A-MQ-ABS-METRIC`
- THM-MonographQualia-bronze-2 -> `A-MQ-ABS-METRIC`
- THM-MonographQualia-bronze-3 -> `A-MQ-ABS-METRIC`
- THM-MonographQualia-bronze-4 -> `A-MQ-ABS-METRIC`
- THM-MonographQualia-silver-1 -> `A-MQ-ABS-METRIC`, `A-MQ-ENERGY-SQ`
- THM-MonographQualia-silver-2 -> `A-MQ-ABS-METRIC`, `A-MQ-ENERGY-SQ`
- THM-MonographQualia-silver-3 -> `A-MQ-ABS-METRIC`, `A-MQ-ENERGY-SQ`
- THM-MonographQualia-silver-4 -> `A-MQ-ABS-METRIC`, `A-MQ-ENERGY-SQ`
- THM-MonographQualia-silver-5 -> `A-MQ-ABS-METRIC`, `A-MQ-TRIANGLE`

## Falsification boundaries
- Current mapping models qualia geometry in one-dimensional real terms; higher-dimensional or manifold models are out of scope.
- Energy claims depend on squared-distance transform and do not imply physical-energy semantics without extra assumptions.
- Triangle results cover metric consistency only, not perceptual calibration or psychometric identifiability.

## Status
- silver-bridge
