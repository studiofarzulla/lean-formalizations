# FarzullaProofs

[![Lean 4](https://img.shields.io/badge/Lean-v4.27.0-blue)](https://lean-lang.org/)
[![Mathlib](https://img.shields.io/badge/Mathlib-v4.27.0-blue)](https://leanprover-community.github.io/mathlib4_docs/)
[![CI](https://github.com/studiofarzulla/lean-formalizations/actions/workflows/lean_action_ci.yml/badge.svg)](https://github.com/studiofarzulla/lean-formalizations/actions)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Machine-checked proofs in Lean 4 for results across canonical research papers by [Murad Farzulla](https://orcid.org/0009-0002-7164-8704), plus shared formal scaffolding for empirical-heavy papers. Formalization depth is tiered (Bronze/Silver/Gold) and tracked per paper.

**Current scope:** 15 paper modules and shared `Common/` infrastructure — **246 machine-checked theorems**, ~2,700 lines of Lean, **zero `sorry`, zero custom axioms** (Lean 4 v4.27.0, Mathlib v4.27.0).

---

## Papers and Theorems

### Program scope and coverage

- Canonical paper coverage is tracked in `coverage.json`.
- Theorem naming convention is documented in `THEOREM_ID_CONVENTIONS.md`.
- Each paper module includes `PaperMap.md` mapping manuscript theorem IDs to Lean declarations.
- Assumption tags and validity domains are tracked in `ASSUMPTIONS_LEDGER.md`.

| Module | Paper | Status | Theorems |
|---|---|---|---:|
| `AxiomOfConsent` | The Axiom of Consent ([arXiv:2601.06692](https://arxiv.org/abs/2601.06692)) | gold-formal-core | 28 |
| `ROM` | The Replicator-Optimization Mechanism ([arXiv:2601.06363](https://arxiv.org/abs/2601.06363)) | gold-formal-core | 25 |
| `RegimeTenure` | When Suppression Fails (ROM legitimacy carve) | gold-formal-core | 16 |
| `ConsensualSovereignty` | Consensual Sovereignty | gold-formal-core | 19 |
| `ROMEthics` | ROM ethics bridge (welfare/survival) | gold-formal-core | 11 |
| `IdentityThesis` | Identity is Irreducibly Relational | gold-formal-core | 22 |
| `QuantumOscillatory` | Quantum Statistics from Oscillatory Sampling | gold-formal-core | 11 |
| `SemanticVision` | Semantic Vision | gold-formal-core | 12 |
| `GenreMimicry` | Genre Mimicry | gold-formal-core | 14 |
| `AMLParadox` | Legitimate Extraction (AML paradox) | gold-formal-core | 10 |
| `AsymptoticProtection` | Asymptotic Protection | gold-formal-core | 11 |
| `AutonomousRedteam` | Autonomous Red Team | gold-formal-core | 11 |
| `CBDCPrivacy` | CBDC Privacy Architecture | gold-formal-core | 11 |
| `ConsciousnessNominalisation` | Consciousness as Nominalisation Error | gold-formal-core | 11 |
| `MonographQualia` | Consciousness Monograph (qualia) | gold-formal-core | 11 |
| `Common` | shared dynamics/transfer/relation infrastructure | — | 23 |

Detailed theorem tables for four representative papers follow; the full claim-by-claim mapping for every module lives in `claims_matrix.json`.

### Quantum Oscillatory Sampling (TBI-QM)

**Paper:** *Quantum Statistics from Oscillatory Sampling* -- [DOI: 10.5281/zenodo.18091063](https://doi.org/10.5281/zenodo.18091063)

| Lean theorem | Paper result | Description |
|---|---|---|
| `interference_two_path` | Eq. 19 | Two-path interference formula |
| `cross_term_eq_re_conj_mul` | Eq. 19 (corollary) | Cross-term equals Re(conj(psi\_1) \* psi\_2) |
| `no_interference_when_orthogonal` | Eq. 24 | Which-path info destroys interference |
| `normSq_nonneg'` | Section 4.4 | Detection probabilities are non-negative |
| `normSq_mul'` | Section 4.5 | Intensity is multiplicative |
| `normSq_zero'` | Section 4.4 | Zero field gives zero intensity |
| `normSq_conj` | Section 4.5 | Conjugation preserves intensity |
| `normSq_real_mul` | Section 4.5 | Real scaling: \|rz\|^2 = r^2\|z\|^2 |
| `double_slit_trig` | Eq. 22 | Half-angle formula for double-slit pattern |
| `constructive_interference` | Eq. 22 (case) | Maxima at delta=0 give intensity 4A^2 |
| `destructive_interference` | Eq. 22 (case) | Minima at delta=pi give intensity 0 |

### Axiom of Consent (Friction Dynamics)

**Paper:** *The Axiom of Consent* -- [arXiv: 2601.06692](https://arxiv.org/abs/2601.06692)

| Lean theorem | Paper result | Description |
|---|---|---|
| `friction_zero_of_stake_zero` | Section 2 | Zero stakes implies zero friction |
| `stake_zero_of_friction_zero` | Section 2 | Zero friction implies zero stakes |
| `friction_eq_zero_iff` | Section 2 | F=0 iff sigma=0 (biconditional) |
| `friction_pos` | Section 4, Theorem | Positive stakes generate positive friction |
| `friction_at_perfect_alignment` | Section 4, Corollary | F(sigma,1,0) = sigma/2 |
| `friction_ge_half_stake` | Section 4, Corollary | Global lower bound F >= sigma/2 |
| `friction_strict_anti_alignment` | Section 2 | F is strictly decreasing in alignment |
| `friction_strict_mono_stake` | Section 2 | F is strictly increasing in stake |
| `friction_strict_mono_entropy` | Section 2 | F is strictly increasing in entropy |
| `friction_stake_linear` | Section 2 | F scales linearly in stakes |
| `friction_nonneg` | Section 2 | F >= 0 for valid parameters |
| `friction_unbounded` | Section 4 | F diverges as alignment approaches -1 |
| `friction_quad_nonneg` | Appendix F | Quadratic form F2 = sigma(1+eps)/(1+alpha^2) is non-negative |
| `friction_quad_le` | Appendix F | Quadratic form is bounded: no pole at alpha = -1 |
| `friction_quad_max_at_zero` | Remark 2.3 | Maximum friction at alpha = 0 |
| `friction_quad_agrees_at_zero` | Remark 2.3 | Agrees with canonical form at alpha = 0 |
| `friction_quad_agrees_at_one` | Remark 2.3 | Agrees with canonical form at alpha = 1 |

### Replicator-Optimization Mechanism (ROM)

**Paper:** *The Replicator-Optimization Mechanism* -- [DOI: 10.5281/zenodo.18090979](https://doi.org/10.5281/zenodo.18090979) / [arXiv: 2601.06363](https://arxiv.org/abs/2601.06363)

| Lean theorem | Paper result | Description |
|---|---|---|
| `row_stochastic_sum` | Section 4.1 | Row-stochastic kernel preserves total mass |
| `rom_simplex_invariant` | Section 4.1 | ROM dynamics preserve probability simplex |
| `identity_kernel_selection` | Remark 3.1 | Identity kernel collapses transfer to selection |
| `identity_kernel_row_stochastic` | Remark 3.1 | Identity kernel is row-stochastic |
| `detailed_balance_zero_flow` | Appendix D | Detailed balance implies zero net flow |
| `asymmetric_kernel_no_uniform_balance` | Appendix D | Asymmetric mutation violates detailed balance |
| `rps_skew_symmetric` | Appendix D | RPS payoff is skew-symmetric |
| `rps_not_potential` | Appendix D | RPS violates potential game condition |
| `skew_symmetric_nonzero_not_potential` | Appendix D | Skew-symmetric entry implies non-potential |
| `consent_survival_mono_legitimacy` | Section 5 | Survival increases with legitimacy |
| `consent_survival_anti_friction` | Section 5 | Survival decreases with friction |
| `generalized_recovers_consent` | Section 5.4 | Setting w2 = 0 recovers consent survival |
| `generalized_legitimacy_nonneg` | Section 5.4 | Generalized legitimacy is non-negative |
| `generalized_survival_mono` | Section 5.4 | Generalized survival preserves monotonicity |

### Regime Tenure (When Suppression Fails)

**Paper:** *When Suppression Fails* -- ROM legitimacy carve, companion paper (in preparation). Its appendix cites this module (sixteen theorems, zero `sorry`) as the machine-checked verification of the tenure law's comparative statics; the first-passage identity T = C0/b is proved by hand there and is not formalized.

| Lean theorem | Paper result | Description |
|---|---|---|
| `survival_threshold` | Survival dichotomy | gamma kappa F <= r implies non-positive burden |
| `draining_iff` | Survival dichotomy | Positive burden iff r < gamma kappa F |
| `tenure_pos` | Tenure law | Tenure is strictly positive in the draining case |
| `tenure_anti_burden` | Structural statics | Tenure strictly decreases in the burden |
| `burden_mono_friction` | Structural statics | Burden strictly increases in friction |
| `tenure_anti_friction` | dT/dF < 0 | Friction shortens tenure |
| `tenure_mono_replenishment` | dT/dr > 0 | Replenishment lengthens tenure |
| `tenure_anti_intensity` | dT/dkappa < 0 | Repression intensity shortens tenure |
| `tenure_mono_reserves` | dT/dC0 > 0 | Larger reserves lengthen tenure |
| `full_legitimacy_no_drain` | L = 1 corner | Full legitimacy leaves burden -r <= 0 |
| `burden_anti_legitimacy` | Legitimacy gate | Legitimacy strictly lowers the burden |
| `tenure_mono_legitimacy` | dT/dL > 0 | Legitimacy lengthens tenure |
| `burden_eq_burdenL_zero` | Legitimacy gate | Un-gated burden is the L = 0 slice |
| `burdenL_mono_friction` | Gated statics | Friction raises the gated burden |
| `tenure_anti_friction_L` | Gated statics | dT/dF < 0 on the coupled burden |
| `tenure_mono_replenishment_L` | Gated statics | dT/dr > 0 on the coupled burden |

### Identity is Irreducibly Relational (Identity Thesis)

**Paper:** *Identity is Irreducibly Relational* -- [DOI: 10.5281/zenodo.18186445](https://doi.org/10.5281/zenodo.18186445)

| Lean theorem | Paper result | Description |
|---|---|---|
| `self_not_in_refSet` | Axiom 2.2 | A is not in its own referential set |
| `defined_iff_refSet_nonempty` | Axiom 2.4 | Defined(A) iff R(A) is nonempty |
| `identity_thesis` | **Theorem 2.5** | Identity presupposes relational structure |
| `no_self_sufficient` | **Corollary 2.6** | No entity is self-sufficiently identical |
| `mutual_membership_of_symmetric` | Section 2 | Symmetric delta implies mutual membership |
| `delta_ext_of_refSet_eq` | Section 2 | Referential identity (Leibniz analogue) |
| `empty_ne_singleton_zero` | Proposition 4.1 | Empty set differs from {0} |
| `empty_set_defined` | Proposition 4.1 | Empty set is relationally defined |
| `empty_set_refSet_nonempty` | Proposition 4.1 | R(emptyset) is nonempty |
| `ne_univ_defined` | Section 4 | Non-universal sets are defined |
| `set_self_not_in_refSet` | Section 4 | Set instance of self-exclusion |
| `complex_i_ne_neg_i` | Section 7.3 | i and -i are distinct |
| `complex_i_sum_zero` | Section 7.3 | i + (-i) = 0 |
| `complex_i_sum_nonzero` | Section 7.3 | i + i != 0 |
| `weak_discernibility_complex` | Section 7.3 | Weak discernibility of conjugate roots |
| `i_squared` | Section 7.3 | i^2 = -1 |
| `neg_i_squared` | Section 7.3 | (-i)^2 = -1 |
| `vonNeumann_two` | Section 7.1 | Von Neumann encoding: 2 = {0,1} |
| `zermelo_two` | Section 7.1 | Zermelo encoding: 2 = {1} |
| `benacerraf_two` | **Section 7.1** | Benacerraf: encodings of 2 diverge |
| `vonNeumann_succ_card` | Section 7.1 | Von Neumann successor cardinality |
| `zermelo_succ_card` | Section 7.1 | Zermelo successor cardinality |

---

## Building

### Prerequisites

Install [elan](https://github.com/leanprover/elan) (the Lean version manager):

```bash
curl https://elan.lean-lang.org/install.sh -sSf | sh
```

### Build

```bash
lake exe cache get   # download pre-built Mathlib oleans (~5 min first time)
lake build           # build FarzullaProofs (~30 sec)
```

### Claims Matrix

```bash
tools/generate_claims_matrix.py           # regenerate claims_matrix.json
tools/generate_claims_matrix.py --check   # fail if out of sync
```

### Verification

```bash
tools/verify_papermap_refs.py                               # mapping -> declaration existence
tools/verify_claims_consistency.py --report reports/paper_verification_report.md
make verify                                                 # one-command full verification
```

### In-House Documentation

- `reports/INHOUSE_FORMALIZATION_DOCUMENTATION.md`
- `reports/METHODS_FORMAL_VERIFICATION_WORKFLOW.md`
- `reports/ALL_PAPERS_VERIFICATION_EXECUTION_PLAN.md`

### CI

GitHub Actions runs `lake build` on every push via [lean-action](https://github.com/leanprover/lean-action). Documentation is auto-deployed to GitHub Pages via [docgen-action](https://github.com/leanprover-community/docgen-action).

---

## Project Structure

```
FarzullaProofs/
|-- Basic.lean                              # Root module documentation
|-- Common/
|   |-- Probability.lean                    # Shared probability utilities
|   |-- Optimization.lean                   # Shared optimization utilities
|   |-- Dynamics.lean                       # Shared dynamics utilities
|   |-- Adversarial.lean                    # Relational identity + dissensus skeletons
|   |-- Transfers.lean                      # Generic transfer theorems
|   +-- Relations.lean                      # Shared relation utilities
|-- QuantumOscillatory/
|   +-- Interference.lean                   # TBI-QM: 11 theorems
|-- AxiomOfConsent/
|   |-- Friction.lean                       # AoC core friction theorems
|   +-- Advanced.lean                       # AoC gold extensions
|   +-- Transfers.lean                      # AoC instantiation of adversarial transfers
|-- ROM/
|   |-- Basic.lean                          # ROM core dynamics/results
|   +-- Advanced.lean                       # ROM gold extensions
|   +-- Transfers.lean                      # ROM instantiation of adversarial transfers
|-- RegimeTenure/
|   +-- Basic.lean                          # Tenure law for the ROM legitimacy carve: 16 theorems
|-- ConsensualSovereignty/
|   |-- Definitions.lean                    # Consent primitives
|   |-- Core.lean                           # Core alignment/friction claims
|   |-- Dynamics.lean                       # Legitimacy dynamics
|   +-- Advanced.lean                       # Gold extensions
|   +-- Transfers.lean                      # Consov instantiation of adversarial transfers
|-- ROMEthics/
|   |-- Basic.lean                          # Bronze welfare core
|   +-- Bridge.lean                         # Silver bridge to ROM + AoC friction
|   +-- Advanced.lean                       # Gold survival/welfare bounds extensions
|-- SemanticVision/
|   |-- Basic.lean                          # Bronze Jaccard core
|   +-- Bridge.lean                         # Silver distance/symmetry bridge
|   +-- Advanced.lean                       # Gold disjointness/bounds extensions
|-- GenreMimicry/
|   |-- Basic.lean                          # Bronze rate/odds core
|   +-- Bridge.lean                         # Silver complement/monotonicity bridge
|   +-- Advanced.lean                       # Gold odds/rate closed-form extensions
|-- AMLParadox/
|   |-- Basic.lean                          # Bronze AML utility core
|   +-- Bridge.lean                         # Silver rates/advantage bridge
|   +-- Advanced.lean                       # Gold utility/advantage extensions
|-- AsymptoticProtection/
|   |-- Basic.lean                          # Bronze protection-level core
|   +-- Bridge.lean                         # Silver saturation-gap bridge
|   +-- Advanced.lean                       # Gold monotonicity/saturation extensions
|-- AutonomousRedteam/
|   |-- Basic.lean                          # Bronze residual-incidents core
|   +-- Bridge.lean                         # Silver reduction-ratio bridge
|   +-- Advanced.lean                       # Gold residual-ratio equivalence extensions
|-- CBDCPrivacy/
|   |-- Basic.lean                          # Bronze epsilon composition core
|   +-- Bridge.lean                         # Silver repeated-composition bridge
|   +-- Advanced.lean                       # Gold composition algebra extensions
|-- ConsciousnessNominalisation/
|   |-- Basic.lean                          # Bronze grounding-gap core
|   +-- Bridge.lean                         # Silver grounding-deficit bridge
|   +-- Advanced.lean                       # Gold grounding-gap/deficit equivalence extensions
|-- MonographQualia/
|   |-- Basic.lean                          # Bronze qualia-distance core
|   +-- Bridge.lean                         # Silver qualia-energy/metric bridge
|   +-- Advanced.lean                       # Gold distance/energy equivalence extensions
+-- IdentityThesis/
    |-- Basic.lean                          # Delta-framework: 6 theorems + 1 class
    |-- SetTheory.lean                      # ZFC instance: 5 theorems + 1 instance
    +-- Structuralism.lean                  # Weak discernibility + Benacerraf: 11 theorems + 2 defs
```

---

## Citation

If you use this code in your research, please cite:

```bibtex
@software{farzulla2026leanformalizations,
  author       = {Farzulla, Murad},
  title        = {{FarzullaProofs}: Machine-Checked Proofs for Interdisciplinary Research},
  year         = {2026},
  version      = {2.0.0},
  url          = {https://github.com/studiofarzulla/lean-formalizations},
  note         = {Lean 4 v4.27.0, Mathlib v4.27.0}
}
```

---

## License

This work is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
