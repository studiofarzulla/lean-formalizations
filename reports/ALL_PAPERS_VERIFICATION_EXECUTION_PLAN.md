# All-Papers Verification Execution Plan

## Objective
Drive every canonical paper module in `FarzullaProofs/` to a reproducible, auditable formalization state with clear upgrade paths into gold-level theorem guarantees.

## Current baseline (already implemented)
- Gold formal cores: `ROM`, `AxiomOfConsent`, `ConsensualSovereignty`.
- Repository-wide verification command: `make verify`.
- CI gate for verification: `.github/workflows/verify.yml`.
- Claim registry with assumption scope/tags: `claims_matrix.json`.
- Per-claim assumption enforcement for gold/transfer claims.

## Program structure
### Track 1: Gold hardening (stability + audit rigor)
- Scope: `ROM`, `AxiomOfConsent`, `ConsensualSovereignty`.
- Required outcomes:
- Keep all gold/transfer claims claim-level tagged.
- Expand falsification-boundary statements where boundary assumptions are implicit.
- Keep `make verify` green on every merge.

### Track 2: Silver-existing promotion to gold candidates
- Scope: `IdentityThesis`, `QuantumOscillatory`.
- Required outcomes:
- Introduce explicit theorem-ID mapped gold candidate claims in `PaperMap.md`.
- Add assumption tags and claim-level assumptions for those claims.
- Add/extend `Advanced.lean` or equivalent files for gold-ready lemmas.

### Track 3: Silver-bridge expansion to promotion-ready packs
- Scope: `ROMEthics`, `SemanticVision`, `GenreMimicry`, `AMLParadox`, `AsymptoticProtection`, `AutonomousRedteam`, `CBDCPrivacy`, `ConsciousnessNominalisation`, `MonographQualia`.
- Required outcomes:
- Select top three mathematically central claims per module.
- Convert to explicit theorem IDs and map to concrete Lean declarations.
- Add assumption tags and falsification boundaries for mapped claims.

## Priority order (recommended)
1. `IdentityThesis` (existing deep formal substrate; high mathematical leverage).
2. `QuantumOscillatory` (tight analytic core; clean theorem promotion path).
3. `SemanticVision` (distance/symmetry claims are formalization-friendly).
4. `GenreMimicry` (probabilistic/odds structure can be sharpened quickly).
5. `AsymptoticProtection` (monotonic/inversion structure is tractable).
6. `CBDCPrivacy` (composition bounds map well to theorem hierarchies).
7. `AutonomousRedteam` (ratio/incident residual dynamics likely medium effort).
8. `AMLParadox` (utility tradeoff claims require careful boundary tagging).
9. `ROMEthics` (promote from bridge after core silver modules harden).
10. `MonographQualia` (metric abstractions may need extra modeling choices).
11. `ConsciousnessNominalisation` (higher conceptual modeling overhead).

## Per-module deliverable template
For each module promotion batch:
1. Update `PaperMap.md`:
- Add theorem IDs for promoted claims.
- Add `## Assumption tags`.
- Add `## Claim-level assumptions` for promoted claims.
- Add `## Falsification boundaries`.
2. Update Lean files:
- Ensure declaration names exactly match mappings.
- Add gold candidate lemmas/theorems in `Advanced.lean` or `Bridge.lean`.
3. Regenerate and verify:
```bash
tools/generate_claims_matrix.py
tools/verify_claims_consistency.py --report reports/paper_verification_report.md
make verify
```

## Integration into master GitHub workflow
### Branch model
- Use one branch per module promotion wave:
- `promote/<Module>-wave-<n>`

### PR checklist (required)
- `PaperMap.md` changed for target module.
- `claims_matrix.json` regenerated.
- `reports/paper_verification_report.md` regenerated.
- `make verify` passes locally and in CI.
- Commit message includes module + wave + status delta.

### Release cadence
- Cut a version tag after each completed 2-module promotion wave.
- Include these artifacts in release notes:
- `coverage.json`
- `claims_matrix.json`
- `reports/paper_verification_report.md`
- `reports/METHODS_FORMAL_VERIFICATION_WORKFLOW.md`

## Success criteria
- No status drift across `coverage.json`, `PaperMap.md`, `claims_matrix.json`.
- Every gold module keeps claim-level assumptions for gold and transfer claims.
- Every non-gold module has a dated promotion plan and theorem-ID mapping backlog.
- CI blocks merges on verification failure.
