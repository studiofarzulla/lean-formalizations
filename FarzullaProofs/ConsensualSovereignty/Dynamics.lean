import FarzullaProofs.ConsensualSovereignty.Definitions

namespace FarzullaProofs.ConsensualSovereignty

/-- THM-consov-4-6: Legitimacy is monotone in alignment when w₁ ≥ 0. -/
theorem legitimacy_mono_alignment
    (w₁ w₂ α₁ α₂ P : ℝ)
    (hw : 0 ≤ w₁)
    (hα : α₁ ≤ α₂) :
    legitimacy w₁ w₂ α₁ P ≤ legitimacy w₁ w₂ α₂ P := by
  unfold legitimacy
  nlinarith [mul_le_mul_of_nonneg_left hα hw]

/-- THM-consov-4-7: Strict monotonicity in alignment when w₁ > 0. -/
theorem legitimacy_strict_mono_alignment
    (w₁ w₂ α₁ α₂ P : ℝ)
    (hw : 0 < w₁)
    (hα : α₁ < α₂) :
    legitimacy w₁ w₂ α₁ P < legitimacy w₁ w₂ α₂ P := by
  unfold legitimacy
  nlinarith [mul_lt_mul_of_pos_left hα hw]

end FarzullaProofs.ConsensualSovereignty
