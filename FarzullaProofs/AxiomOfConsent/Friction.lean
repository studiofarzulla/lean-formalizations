/-
  Axiom of Consent: Friction Function Properties
  Formalization of Farzulla (2025), DOI: 10.48550/arXiv.2601.06692

  Core friction function: F(σ, α, ε) = σ · (1 + ε) / (1 + α)

  Parameters (Paper §2):
    σ ≥ 0       total stake
    α ∈ (-1, 1]  aggregate alignment
    ε ∈ [0, 1]   information entropy
-/

import Mathlib.Tactic

namespace AxiomOfConsent

/-! ## Core Definition -/

/-- The friction function F(σ, α, ε) = σ · (1 + ε) / (1 + α) (Paper Def. 2.4). -/
noncomputable def friction (σ α ε : ℝ) : ℝ := σ * (1 + ε) / (1 + α)

/-! ## Zero Friction Condition (Paper §2, Proposition)
F = 0 ↔ σ = 0, provided α > -1 and ε ≥ 0. -/

/-- Zero stakes ⟹ zero friction. -/
theorem friction_zero_of_stake_zero (α ε : ℝ) :
    friction 0 α ε = 0 := by
  unfold friction; ring

/-- Zero friction ⟹ zero stakes (converse). -/
theorem stake_zero_of_friction_zero {σ α ε : ℝ}
    (hα : -1 < α) (hε : 0 ≤ ε) (hF : friction σ α ε = 0) :
    σ = 0 := by
  unfold friction at hF
  have hα' : (1 + α) ≠ 0 := by linarith
  have hε' : (0 : ℝ) < 1 + ε := by linarith
  have hF' : σ * (1 + ε) = 0 := by
    have := (div_eq_iff hα').mp hF
    linarith
  rcases mul_eq_zero.mp hF' with h | h
  · exact h
  · linarith

/-- Zero Friction ↔ Zero Stakes (biconditional). -/
theorem friction_eq_zero_iff {σ α ε : ℝ} (hα : -1 < α) (hε : 0 ≤ ε) :
    friction σ α ε = 0 ↔ σ = 0 :=
  ⟨stake_zero_of_friction_zero hα hε, fun h => h ▸ friction_zero_of_stake_zero α ε⟩

/-! ## Inevitable Friction (Paper §4, Theorem)
Positive stakes necessarily generate positive friction. -/

/-- σ > 0 ⟹ F > 0. -/
theorem friction_pos {σ α ε : ℝ}
    (hσ : 0 < σ) (hα : -1 < α) (hε : 0 ≤ ε) :
    0 < friction σ α ε := by
  unfold friction
  apply div_pos
  · exact mul_pos hσ (by linarith)
  · linarith

/-! ## Irreducible Minimum (Paper §4, Corollary)
F_min = σ/2 at perfect alignment (α = 1, ε = 0). -/

/-- At perfect alignment and zero entropy, F = σ/2. -/
theorem friction_at_perfect_alignment (σ : ℝ) :
    friction σ 1 0 = σ / 2 := by
  unfold friction; ring

/-- Global lower bound: F ≥ σ/2 for all valid parameters. -/
theorem friction_ge_half_stake {σ α ε : ℝ}
    (hσ : 0 ≤ σ) (hα : -1 < α) (hα' : α ≤ 1) (hε : 0 ≤ ε) :
    σ / 2 ≤ friction σ α ε := by
  unfold friction
  have h1 : (0 : ℝ) < 1 + α := by linarith
  -- Show F - σ/2 ≥ 0 by common denominator
  suffices h : 0 ≤ σ * (1 + ε) / (1 + α) - σ / 2 by linarith
  rw [div_sub_div _ _ (ne_of_gt h1) (by norm_num : (2 : ℝ) ≠ 0)]
  apply div_nonneg
  · nlinarith
  · positivity

/-! ## Monotonicity Propositions (Paper §2)
Three results characterizing how F responds to each parameter. -/

/-- Alignment Effect: F is strictly decreasing in α.
∂F/∂α = -σ(1+ε)/(1+α)² < 0 -/
theorem friction_strict_anti_alignment {σ α₁ α₂ ε : ℝ}
    (hσ : 0 < σ) (hε : 0 ≤ ε)
    (hα₁ : -1 < α₁) (h : α₁ < α₂) :
    friction σ α₂ ε < friction σ α₁ ε := by
  unfold friction
  have h1 : (0 : ℝ) < 1 + α₁ := by linarith
  have h3 : (0 : ℝ) < σ * (1 + ε) := by positivity
  exact div_lt_div_of_pos_left h3 h1 (by linarith)

/-- Stake Effect: F is strictly increasing in σ.
∂F/∂σ = (1+ε)/(1+α) > 0 -/
theorem friction_strict_mono_stake {σ₁ σ₂ α ε : ℝ}
    (hα : -1 < α) (hε : 0 ≤ ε) (h : σ₁ < σ₂) :
    friction σ₁ α ε < friction σ₂ α ε := by
  unfold friction
  have h1 : (0 : ℝ) < 1 + α := by linarith
  apply div_lt_div_of_pos_right _ h1
  nlinarith

/-- Entropy Effect: F is strictly increasing in ε.
∂F/∂ε = σ/(1+α) > 0 -/
theorem friction_strict_mono_entropy {σ α ε₁ ε₂ : ℝ}
    (hσ : 0 < σ) (hα : -1 < α) (h : ε₁ < ε₂) :
    friction σ α ε₁ < friction σ α ε₂ := by
  unfold friction
  have h1 : (0 : ℝ) < 1 + α := by linarith
  apply div_lt_div_of_pos_right _ h1
  nlinarith

/-! ## Scaling and Structural Properties -/

/-- Friction scales linearly in stakes: F(c·σ, α, ε) = c · F(σ, α, ε). -/
theorem friction_stake_linear (c σ α ε : ℝ) :
    friction (c * σ) α ε = c * friction σ α ε := by
  unfold friction; ring

/-- Friction is non-negative for non-negative stakes and valid parameters. -/
theorem friction_nonneg {σ α ε : ℝ}
    (hσ : 0 ≤ σ) (hα : -1 < α) (hε : 0 ≤ ε) :
    0 ≤ friction σ α ε := by
  unfold friction
  apply div_nonneg
  · exact mul_nonneg hσ (by linarith)
  · linarith

/-- Misalignment divergence: as α → -1⁺, friction grows without bound.
For any bound B > 0, there exists valid α with F > B. -/
theorem friction_unbounded {σ ε B : ℝ}
    (hσ : 0 < σ) (hε : 0 ≤ ε) (hB : 0 < B) :
    ∃ α : ℝ, -1 < α ∧ B < friction σ α ε := by
  refine ⟨-1 + σ * (1 + ε) / (2 * B), ?_, ?_⟩
  · have : 0 < σ * (1 + ε) / (2 * B) := by positivity
    linarith
  · unfold friction
    have h1 : 0 < σ * (1 + ε) := by positivity
    have h2 : 0 < 2 * B := by positivity
    have h3 : 0 < σ * (1 + ε) / (2 * B) := by positivity
    rw [show 1 + (-1 + σ * (1 + ε) / (2 * B)) = σ * (1 + ε) / (2 * B) from by ring]
    -- Goal: B < σ * (1 + ε) / (σ * (1 + ε) / (2 * B))
    -- = σ * (1 + ε) * (2 * B) / (σ * (1 + ε)) = 2 * B
    have h4 : σ * (1 + ε) ≠ 0 := ne_of_gt h1
    have h5 : (2 * B) ≠ 0 := ne_of_gt h2
    have h6 : σ * (1 + ε) / (2 * B) ≠ 0 := div_ne_zero h4 h5
    suffices heq : σ * (1 + ε) / (σ * (1 + ε) / (2 * B)) = 2 * B by
      rw [heq]; linarith
    rw [div_eq_iff h6, mul_comm (2 * B)]
    exact (div_mul_cancel₀ _ h5).symm

/-! ## Quadratic Friction Form (Paper Remark 2.5, Appendix B.7)

Historical/exploratory variant: F^(2)(σ, α, ε) = σ · (1 + ε) / (1 + α²),
maximal at α = 0 and bounded on [-1, 1]. Originally motivated by an apparent
U-shape in the companion MARL factorial; the companion's sign-aware control
battery showed that U-shape was a sign-blind data-generating-process artifact,
and the quadratic refinement was withdrawn as an empirical claim. The paper
(v2) retains F^(2) only as a formal illustration that the desiderata, with
divergence D6 relaxed to the symmetric condition D6′, under-determine F
(Remark 2.5; Appendix B.7). The theorems below are properties of the
mathematical form itself, independent of its empirical adequacy. -/

/-- Quadratic friction: F^(2)(σ, α, ε) = σ · (1 + ε) / (1 + α²). -/
noncomputable def friction_quad (σ α ε : ℝ) : ℝ := σ * (1 + ε) / (1 + α ^ 2)

/-- Quadratic friction is non-negative for non-negative stakes. -/
theorem friction_quad_nonneg {σ α ε : ℝ}
    (hσ : 0 ≤ σ) (hε : 0 ≤ ε) :
    0 ≤ friction_quad σ α ε := by
  unfold friction_quad
  apply div_nonneg
  · exact mul_nonneg hσ (by linarith)
  · positivity

/-- Quadratic friction is bounded: no singularity at α = -1. -/
theorem friction_quad_le {σ α ε : ℝ}
    (hσ : 0 ≤ σ) (hε : 0 ≤ ε) :
    friction_quad σ α ε ≤ σ * (1 + ε) := by
  unfold friction_quad
  have h1 : (0 : ℝ) < 1 + α ^ 2 := by positivity
  have h2 : (1 : ℝ) ≤ 1 + α ^ 2 := by nlinarith [sq_nonneg α]
  exact div_le_self (mul_nonneg hσ (by linarith)) h2

/-- Maximum friction at α = 0: F^(2)(σ, 0, ε) = σ(1+ε). -/
theorem friction_quad_max_at_zero (σ ε : ℝ) :
    friction_quad σ 0 ε = σ * (1 + ε) := by
  unfold friction_quad; simp

/-- Agreement with canonical form at α = 0. -/
theorem friction_quad_agrees_at_zero (σ ε : ℝ) :
    friction_quad σ 0 ε = friction σ 0 ε := by
  unfold friction_quad friction; simp

/-- Agreement with canonical form at α = 1: both yield σ(1+ε)/2. -/
theorem friction_quad_agrees_at_one (σ ε : ℝ) :
    friction_quad σ 1 ε = friction σ 1 ε := by
  unfold friction_quad friction; norm_num

end AxiomOfConsent
