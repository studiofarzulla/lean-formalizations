/-
  Replicator-Optimization Mechanism (ROM): Core Results
  Formalization of Farzulla (2026), arXiv:2601.06363

  Key results formalized:
  - ROM simplex preservation (sum of dynamics = 0)
  - Row-stochastic kernel normalization identity
  - Identity kernel → Bayesian update (Remark 3.1)
  - RPS non-potential (Appendix D counterexample)
  - Detailed balance and its violation
  - Consent-weighted survival monotonicity
-/

import Mathlib.Tactic

namespace ROM

open Finset

/-! ## Row-Stochastic Kernel: Normalization Identity

The fundamental algebraic identity underlying simplex preservation:
when M is row-stochastic, Σᵢ Σⱼ f(j)·M(j,i) = Σⱼ f(j). -/

/-- Row-stochastic kernel normalization: distributing over a row-stochastic matrix
preserves the total mass. (Paper §4.1) -/
theorem row_stochastic_sum {n : ℕ} (f : Fin n → ℝ) (M : Fin n → Fin n → ℝ)
    (hM : ∀ j, ∑ i : Fin n, M j i = 1) :
    ∑ i : Fin n, ∑ j : Fin n, f j * M j i = ∑ j : Fin n, f j := by
  rw [Finset.sum_comm]
  congr 1; ext j
  rw [← Finset.mul_sum, hM j, mul_one]

/-! ## ROM Simplex Invariance

The ROM equation preserves the probability simplex.
dp(i)/dt = Σⱼ f(j)·M(j,i) - p(i)·φ̄
where f(j) = p(j)·w(j)·ρ(j) and φ̄ = Σⱼ f(j). -/

/-- The ROM dynamics preserve total probability mass. -/
theorem rom_simplex_invariant {n : ℕ} (f p : Fin n → ℝ) (M : Fin n → Fin n → ℝ)
    (hM : ∀ j, ∑ i : Fin n, M j i = 1)
    (hp : ∑ i : Fin n, p i = 1) :
    ∑ i : Fin n, ((∑ j : Fin n, f j * M j i) - p i * (∑ j : Fin n, f j)) = 0 := by
  have h1 : ∑ i : Fin n, ∑ j : Fin n, f j * M j i = ∑ j : Fin n, f j :=
    row_stochastic_sum f M hM
  have h2 : ∑ i : Fin n, p i * (∑ j : Fin n, f j) = ∑ j : Fin n, f j := by
    rw [← Finset.sum_mul, hp, one_mul]
  -- Σ (A_i - B_i) = Σ A_i - Σ B_i = C - C = 0
  have h3 : ∑ i : Fin n, ((∑ j : Fin n, f j * M j i) - p i * (∑ j : Fin n, f j)) =
      (∑ i : Fin n, ∑ j : Fin n, f j * M j i) -
      (∑ i : Fin n, p i * (∑ j : Fin n, f j)) := by
    simp_rw [sub_eq_add_neg]
    rw [Finset.sum_add_distrib, Finset.sum_neg_distrib]
  rw [h3, h1, h2, sub_self]

/-! ## Identity Kernel → Bayesian Update (Paper Remark 3.1)

Under pure selection (M = Id), the ROM update reduces to Bayes' rule. -/

/-- With the identity kernel, the ROM transfer sum collapses to a single term. -/
theorem identity_kernel_selection {n : ℕ} (f : Fin n → ℝ) (i : Fin n) :
    ∑ j : Fin n, f j * (if j = i then (1 : ℝ) else 0) = f i := by
  simp [Finset.sum_ite_eq', Finset.mem_univ]

/-- The identity kernel is row-stochastic. -/
theorem identity_kernel_row_stochastic (n : ℕ) :
    ∀ j : Fin n, ∑ i : Fin n, (if j = i then (1 : ℝ) else 0) = 1 := by
  intro j
  simp [Finset.mem_univ]

/-! ## Detailed Balance (Paper Appendix D) -/

/-- Detailed balance implies zero net flow between any pair of types. -/
theorem detailed_balance_zero_flow {M : ℕ → ℕ → ℝ} {π : ℕ → ℝ} {i j : ℕ}
    (hdb : M i j * π i = M j i * π j) :
    π i * M i j - π j * M j i = 0 := by linarith

/-- Asymmetric mutation violates detailed balance for uniform distributions. -/
theorem asymmetric_kernel_no_uniform_balance {a b : ℝ} (h : a ≠ b) (c : ℝ) (hc : 0 < c) :
    a * c ≠ b * c := by
  intro hab
  exact h (mul_right_cancel₀ (ne_of_gt hc) hab)

/-! ## RPS Non-Potential (Paper Appendix D)

The Rock-Paper-Scissors payoff matrix is skew-symmetric.
A potential game requires A_{ij} = A_{ji}, which fails for RPS. -/

/-- The RPS payoff matrix. -/
def rps_payoff : Fin 3 → Fin 3 → ℝ
  | 0, 0 => 0  | 0, 1 => -1 | 0, 2 => 1
  | 1, 0 => 1  | 1, 1 => 0  | 1, 2 => -1
  | 2, 0 => -1 | 2, 1 => 1  | 2, 2 => 0

/-- RPS payoff is skew-symmetric: A_{ij} = -A_{ji}. -/
theorem rps_skew_symmetric (i j : Fin 3) :
    rps_payoff i j = -rps_payoff j i := by
  fin_cases i <;> fin_cases j <;> simp [rps_payoff]

/-- RPS violates the potential game integrability condition. -/
theorem rps_not_potential : rps_payoff 0 1 ≠ rps_payoff 1 0 := by
  simp [rps_payoff]; norm_num

/-- Any game with a nonzero skew-symmetric entry violates
the potential game condition: a ≠ 0 → a ≠ -a. -/
theorem skew_symmetric_nonzero_not_potential {a : ℝ} (ha : a ≠ 0) :
    a ≠ -a := by
  intro h
  have : 2 * a = 0 := by linarith
  have : a = 0 := by linarith
  exact ha this

/-! ## Consent-Weighted Survival (Paper §5)

ρ(τ) = L(τ) / (1 + F(τ)) -/

/-- Consent-weighted survival function. -/
noncomputable def consent_survival (L F : ℝ) : ℝ := L / (1 + F)

/-- Higher legitimacy increases survival. -/
theorem consent_survival_mono_legitimacy {L₁ L₂ F : ℝ}
    (hF : 0 ≤ F) (h : L₁ < L₂) :
    consent_survival L₁ F < consent_survival L₂ F := by
  unfold consent_survival
  exact div_lt_div_of_pos_right h (by linarith)

/-- Higher friction decreases survival (when L > 0). -/
theorem consent_survival_anti_friction {L F₁ F₂ : ℝ}
    (hL : 0 < L) (hF₁ : 0 ≤ F₁) (h : F₁ < F₂) :
    consent_survival L F₂ < consent_survival L F₁ := by
  unfold consent_survival
  exact div_lt_div_of_pos_left hL (by linarith) (by linarith)

end ROM
