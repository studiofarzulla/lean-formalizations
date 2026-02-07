import FarzullaProofs.AxiomOfConsent.Friction

namespace AxiomOfConsent

/-- THM-aoc-gold-1: Friction is monotone (non-strict) in entropy for nonnegative stakes. -/
theorem friction_mono_entropy {σ α ε₁ ε₂ : ℝ}
    (hσ : 0 ≤ σ) (hα : -1 < α) (h : ε₁ ≤ ε₂) :
    friction σ α ε₁ ≤ friction σ α ε₂ := by
  unfold friction
  have hden : 0 < 1 + α := by linarith
  have hnum : σ * (1 + ε₁) ≤ σ * (1 + ε₂) := by nlinarith
  exact div_le_div_of_nonneg_right hnum (le_of_lt hden)

/-- THM-aoc-gold-2: Friction is monotone (non-strict) in stakes for valid parameters. -/
theorem friction_mono_stake {σ₁ σ₂ α ε : ℝ}
    (hα : -1 < α) (hε : 0 ≤ ε) (h : σ₁ ≤ σ₂) :
    friction σ₁ α ε ≤ friction σ₂ α ε := by
  unfold friction
  have hden : 0 < 1 + α := by linarith
  have hnum : σ₁ * (1 + ε) ≤ σ₂ * (1 + ε) := by nlinarith
  exact div_le_div_of_nonneg_right hnum (le_of_lt hden)

/-- THM-aoc-gold-3: Zero alignment yields friction = σ(1+ε). -/
theorem friction_at_zero_alignment (σ ε : ℝ) :
    friction σ 0 ε = σ * (1 + ε) := by
  unfold friction
  ring

/-- THM-aoc-gold-4: Zero entropy yields friction = σ/(1+α). -/
theorem friction_at_zero_entropy (σ α : ℝ) :
    friction σ α 0 = σ / (1 + α) := by
  unfold friction
  ring

/-- THM-aoc-gold-5: For nonnegative alignment, friction is bounded by σ(1+ε). -/
theorem friction_le_linear_upper {σ α ε : ℝ}
    (hσ : 0 ≤ σ) (hα : 0 ≤ α) (hε : 0 ≤ ε) :
    friction σ α ε ≤ σ * (1 + ε) := by
  unfold friction
  have hden : 0 < 1 + α := by linarith
  have hnum_nonneg : 0 ≤ σ * (1 + ε) := by nlinarith
  have hfac : 1 ≤ 1 + α := by linarith
  have hscale : σ * (1 + ε) ≤ σ * (1 + ε) * (1 + α) := by
    have hmul := mul_le_mul_of_nonneg_left hfac hnum_nonneg
    simpa [mul_assoc] using hmul
  exact (div_le_iff₀ hden).2 hscale

/-- THM-aoc-gold-6: Friction at maximal entropy is exactly 2σ/(1+α). -/
theorem friction_at_max_entropy (σ α : ℝ) :
    friction σ α 1 = (2 * σ) / (1 + α) := by
  unfold friction
  ring

end AxiomOfConsent
