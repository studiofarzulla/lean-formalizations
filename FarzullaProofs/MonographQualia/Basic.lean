import Mathlib

namespace FarzullaProofs.MonographQualia

/-- THM-MonographQualia-bronze-1: Qualia distance as absolute experiential difference. -/
def qualiaDistance (q₁ q₂ : ℝ) : ℝ := |q₁ - q₂|

/-- THM-MonographQualia-bronze-2: Qualia distance is nonnegative. -/
theorem qualiaDistance_nonneg (q₁ q₂ : ℝ) : 0 ≤ qualiaDistance q₁ q₂ := by
  unfold qualiaDistance
  exact abs_nonneg (q₁ - q₂)

/-- THM-MonographQualia-bronze-3: Self-distance is zero. -/
theorem qualiaDistance_self (q : ℝ) : qualiaDistance q q = 0 := by
  unfold qualiaDistance
  simp

/-- THM-MonographQualia-bronze-4: Distance is symmetric. -/
theorem qualiaDistance_symm (q₁ q₂ : ℝ) :
    qualiaDistance q₁ q₂ = qualiaDistance q₂ q₁ := by
  unfold qualiaDistance
  simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using abs_sub_comm q₁ q₂

end FarzullaProofs.MonographQualia
