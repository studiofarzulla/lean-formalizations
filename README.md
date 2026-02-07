# FarzullaProofs

[![Lean 4](https://img.shields.io/badge/Lean-v4.27.0-blue)](https://lean-lang.org/)
[![Mathlib](https://img.shields.io/badge/Mathlib-v4.27.0-blue)](https://leanprover-community.github.io/mathlib4_docs/)
[![CI](https://github.com/studiofarzulla/lean-formalizations/actions/workflows/lean_action_ci.yml/badge.svg)](https://github.com/studiofarzulla/lean-formalizations/actions)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Machine-checked proofs in Lean 4 for results across canonical research papers by [Murad Farzulla](https://orcid.org/0009-0002-7164-8704), plus shared formal scaffolding for empirical-heavy papers. Formalization depth is tiered (Bronze/Silver/Gold) and tracked per paper.

---

## Papers and Theorems

### Program scope and coverage

- Canonical paper coverage is tracked in `coverage.json`.
- Theorem naming convention is documented in `THEOREM_ID_CONVENTIONS.md`.
- Each paper module includes `PaperMap.md` mapping manuscript theorem IDs to Lean declarations.

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

**Paper:** *The Axiom of Consent* -- [DOI: 10.5281/zenodo.17684676](https://doi.org/10.5281/zenodo.17684676)

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
|   +-- Relations.lean                      # Shared relation utilities
|-- QuantumOscillatory/
|   +-- Interference.lean                   # TBI-QM: 11 theorems
|-- AxiomOfConsent/
|   +-- Friction.lean                       # AoC: 12 theorems + 1 definition
|-- ROM/
|   +-- Basic.lean                          # ROM: 11 theorems + 3 definitions
|-- ConsensualSovereignty/
|   +-- Basic.lean                          # Bronze scaffold
|-- ROMEthics/
|   +-- Basic.lean                          # Bronze bridge scaffold
|-- SemanticVision/
|   +-- Basic.lean                          # Bronze scaffold
|-- GenreMimicry/
|   +-- Basic.lean                          # Bronze scaffold
|-- AMLParadox/
|   +-- Basic.lean                          # Bronze scaffold
|-- AsymptoticProtection/
|   +-- Basic.lean                          # Bronze scaffold
|-- AutonomousRedteam/
|   +-- Basic.lean                          # Bronze scaffold
|-- CBDCPrivacy/
|   +-- Basic.lean                          # Bronze scaffold
|-- ConsciousnessNominalisation/
|   +-- Basic.lean                          # Bronze scaffold
|-- MonographQualia/
|   +-- Basic.lean                          # Bronze scaffold
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
  version      = {1.0.0},
  url          = {https://github.com/studiofarzulla/lean-formalizations},
  note         = {Lean 4 v4.27.0, Mathlib v4.27.0}
}
```

---

## License

This work is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
