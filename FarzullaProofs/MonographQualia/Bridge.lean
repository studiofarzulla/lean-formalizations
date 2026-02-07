import Mathlib
import FarzullaProofs.MonographQualia.Basic

namespace FarzullaProofs.MonographQualia

/-- THM-MonographQualia-silver-1: Squared qualia distance energy. -/
def qualiaEnergy (q₁ q₂ : ℝ) : ℝ := (qualiaDistance q₁ q₂) ^ 2

/-- THM-MonographQualia-silver-2: Qualia energy is nonnegative. -/
theorem qualiaEnergy_nonneg (q₁ q₂ : ℝ) : 0 ≤ qualiaEnergy q₁ q₂ := by
  unfold qualiaEnergy
  positivity

/-- THM-MonographQualia-silver-3: Zero self-energy. -/
theorem qualiaEnergy_self (q : ℝ) : qualiaEnergy q q = 0 := by
  unfold qualiaEnergy
  simp [qualiaDistance_self]

/-- THM-MonographQualia-silver-4: Energy is symmetric. -/
theorem qualiaEnergy_symm (q₁ q₂ : ℝ) :
    qualiaEnergy q₁ q₂ = qualiaEnergy q₂ q₁ := by
  unfold qualiaEnergy
  simp [qualiaDistance_symm q₁ q₂]

/-- THM-MonographQualia-silver-5: Triangle inequality lift for qualia distance. -/
theorem qualiaDistance_triangle (x y z : ℝ) :
    qualiaDistance x z ≤ qualiaDistance x y + qualiaDistance y z := by
  unfold qualiaDistance
  simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using abs_sub_le x y z

end FarzullaProofs.MonographQualia
