# Methods: Formal Verification Workflow

## Short Version (for abstract/summary sections)
We formalize manuscript claims in Lean 4 and maintain a claim registry that links theorem IDs in each paper to machine-checked declarations. Assumptions are tracked with explicit tags (`ASSUMPTIONS_LEDGER.md`) and propagated to a generated claim matrix (`claims_matrix.json`). A verification pipeline checks (i) mapping integrity between paper claims and Lean declarations, (ii) status consistency across metadata artifacts, and (iii) full compilation of all theorem files. This pipeline is run reproducibly via `make verify` and produces a per-paper verification report (`reports/paper_verification_report.md`) used for internal review and release checks.

## Standard Version (for Methods section)
### Overview
Our verification workflow converts manuscript-level mathematical claims into machine-checkable theorems and continuously validates artifact consistency across the research stack.

### Formalization structure
Claims are organized per paper module in `FarzullaProofs/<Module>/`. Each module includes:
- Lean source files (`Basic.lean`, optional `Bridge.lean`, `Advanced.lean`, `Transfers.lean`)
- `PaperMap.md` linking manuscript theorem references to Lean declarations
- module README metadata

Cross-paper abstractions are centralized in `FarzullaProofs/Common/`, including adversarial dynamics and transfer theorem interfaces.

### Claim registry and assumptions
We generate a machine-readable matrix (`claims_matrix.json`) from all `PaperMap.md` files using `tools/generate_claims_matrix.py`. Each claim record includes:
- manuscript claim identifier/reference
- Lean declaration
- module/status metadata
- assumption scope (`claim_level` or `paper_level`)
- assumption tags
- falsification boundaries

Assumption tags are defined in `ASSUMPTIONS_LEDGER.md` and used to delimit theorem validity domains.

### Automated verification checks
We run three automated checks:
1. `tools/verify_papermap_refs.py`
- validates every mapped declaration exists in the declared Lean entrypoints
- fails on unresolved entrypoint paths

2. `tools/verify_claims_consistency.py`
- checks status synchronization among `coverage.json`, `claims_matrix.json`, and `PaperMap.md`
- enforces assumption-tag rules (including claim-level coverage for gold/transfer claims)
- emits `reports/paper_verification_report.md`

3. `lake build`
- ensures all Lean modules compile with current theorem dependencies

These are composed into a single reproducible command:
```bash
make verify
```

### Reproducibility and governance
The same verification pipeline is run locally and in CI (GitHub Actions workflow `verify.yml`). CI uploads the generated verification report as an artifact, providing traceability for each commit and pull request.

## Grant/Compliance Version (auditability framing)
We implement a formal assurance workflow that links narrative claims to machine-verified proofs and explicit assumption boundaries. Every mapped theorem is traceable from manuscript reference to Lean declaration through generated registry artifacts. A deterministic verification pipeline performs structural integrity checks (mapping completeness, status consistency), assumption-governance checks (tag coverage by claim class), and full proof compilation. Results are emitted as versioned artifacts suitable for audit and reproducibility review. This design reduces hidden assumption drift, improves falsifiability accounting, and provides evidence continuity across iterative manuscript updates.

## Operational commands
```bash
make verify
make verify-fast
tools/generate_claims_matrix.py --check
tools/verify_claims_consistency.py --report reports/paper_verification_report.md
```
