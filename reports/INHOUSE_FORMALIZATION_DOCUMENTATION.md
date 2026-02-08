# In-House Formalization Documentation

## Purpose
This document records what has been implemented in the Lean formalization stack, how modules are organized, what verification controls exist, and how to operate the pipeline for internal research and publication workflows.

## Scope
Repository: `/home/purrpower/Resurrexi/projects/lean-formalizations`

Primary goals covered:
- Formal theorem development across canonical papers.
- Cross-paper unification through common adversarial/relational dynamics.
- Traceable claim registry (`claims_matrix.json`) with reproducible generation.
- Validity-domain and falsification-boundary tracking for gold-core modules.
- Automated consistency verification across mappings, status metadata, and declarations.

## Architecture
### 1. Paper modules
Each paper module contains:
- Lean source files (`Basic.lean`, optional `Bridge.lean`, `Advanced.lean`, `Transfers.lean`).
- `PaperMap.md` linking manuscript theorem identifiers to Lean declarations.
- `README.md` with canonical source and module entrypoints.

### 2. Common layer
`FarzullaProofs/Common/` provides shared abstractions and theorem utilities:
- `Probability.lean`, `Optimization.lean`, `Dynamics.lean`, `Relations.lean`
- `Adversarial.lean`: relational identity, moving equilibrium, dissensus, bounded chase.
- `Transfers.lean`: generic transfer theorems used by domain instantiations.

### 3. Transfer instantiations
Implemented instantiations of the adversarial transfer layer:
- `FarzullaProofs/ROM/Transfers.lean`
- `FarzullaProofs/AxiomOfConsent/Transfers.lean`
- `FarzullaProofs/ConsensualSovereignty/Transfers.lean`

These provide concrete paths, update operators, moving-equilibrium theorems, no-static-equilibrium conditions under path variation, and dissensus/bounded-chase bridges.

## Maturity model
Status values are tracked in:
- `coverage.json`
- each module's `PaperMap.md` (`## Status`)
- `claims_matrix.json` (derived)

Current model includes:
- `silver-existing`
- `silver-bridge`
- `gold-formal-core`

Gold-core modules currently include:
- `ROM`
- `AxiomOfConsent`
- `ConsensualSovereignty`

## Assumptions and validity boundaries
Assumption tags and interpretation rules are defined in:
- `ASSUMPTIONS_LEDGER.md`

For gold-core modules, `PaperMap.md` includes:
- `## Assumption tags`
- `## Falsification boundaries`

These sections encode where theorem claims are valid and where they should not be generalized.

## Claims registry
### Artifact
- `claims_matrix.json`

### Generator
- `tools/generate_claims_matrix.py`

### Behavior
- Parses every `FarzullaProofs/*/PaperMap.md`
- Extracts module metadata and mapped theorem claims
- Produces machine-readable registry for appendix tables and audits
- Supports `--check` for out-of-sync detection

## Verification controls
### 1. Mapping-to-declaration verification
Tool: `tools/verify_papermap_refs.py`

Checks:
- All `Lean entrypoints` paths resolve (including glob patterns).
- All mapped declarations in mapping sections exist in the referenced Lean files.

### 2. Cross-artifact consistency verification
Tool: `tools/verify_claims_consistency.py`

Checks:
- Status synchronization across `coverage.json`, `PaperMap.md`, and `claims_matrix.json`.
- Gold modules have non-empty assumption tags.
- Modules with transfer mappings expose assumption tags.

Output:
- `reports/paper_verification_report.md`

### 3. Lean compile verification
Command:
- `lake build`

Ensures theorem and module graph correctness.

## One-command operations
A `Makefile` is provided.

### Full verification
```bash
make verify
```
Runs:
1. `tools/verify_papermap_refs.py`
2. `tools/generate_claims_matrix.py --check`
3. `tools/verify_claims_consistency.py --report reports/paper_verification_report.md`
4. `lake build`

### Fast metadata verification (no build)
```bash
make verify-fast
```

### Regenerate claims matrix
```bash
make claims
```

### Regenerate report
```bash
make report
```

## Change management pattern used
Implementation was performed in checkpointed waves with green builds between waves:
- bronze scaffolds -> silver bridges -> gold cores (target modules)
- common transfer abstractions
- per-paper transfer instantiations
- ledger + machine-readable claim matrix
- automated verification/report tooling

This pattern is recommended for future expansions:
1. Add/modify theorem family
2. Update `PaperMap.md`
3. Regenerate `claims_matrix.json`
4. Run consistency/mapping checks
5. Run `lake build`
6. Commit checkpoint

## Recommended next internal upgrades
- Add CI step invoking `make verify`.
- Add per-claim assumption granularity in `claims_matrix.json` (claim-level tags, not paper-level scope only).
- Add theorem dependency graph export for internal review dashboards.
- Add release snapshots for report and matrix artifacts tied to commit hashes.

## Operational note
The verification pipeline is now reproducible and can be run by any collaborator without manual bookkeeping, using repository-local tools only.
