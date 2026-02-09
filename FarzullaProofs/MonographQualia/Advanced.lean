import Mathlib
import FarzullaProofs.MonographQualia.Bridge

namespace FarzullaProofs.MonographQualia

/-- THM-MonographQualia-gold-1: Distance zero iff the two qualia values are equal. -/
theorem qualiaDistance_eq_zero_iff (q₁ q₂ : ℝ) :
    qualiaDistance q₁ q₂ = 0 ↔ q₁ = q₂ := by
  unfold qualiaDistance
  constructor
  · intro h
    have : q₁ - q₂ = 0 := abs_eq_zero.mp h
    linarith
  · intro h
    subst h
    simp

/-- THM-MonographQualia-gold-2: Energy zero iff distance zero. -/
theorem qualiaEnergy_eq_zero_iff_distance_eq_zero (q₁ q₂ : ℝ) :
    qualiaEnergy q₁ q₂ = 0 ↔ qualiaDistance q₁ q₂ = 0 := by
  unfold qualiaEnergy
  constructor
  · intro h
    exact sq_eq_zero_iff.mp h
  · intro h
    exact sq_eq_zero_iff.mpr h

/-- THM-MonographQualia-gold-3: Energy zero iff the two qualia values are equal. -/
theorem qualiaEnergy_eq_zero_iff (q₁ q₂ : ℝ) :
    qualiaEnergy q₁ q₂ = 0 ↔ q₁ = q₂ := by
  rw [qualiaEnergy_eq_zero_iff_distance_eq_zero, qualiaDistance_eq_zero_iff]

/-- THM-MonographQualia-gold-4:
Distance is bounded by energy plus one (coarse algebraic envelope). -/
theorem qualiaDistance_le_energy_add_one (q₁ q₂ : ℝ) :
    qualiaDistance q₁ q₂ ≤ qualiaEnergy q₁ q₂ + 1 := by
  unfold qualiaEnergy
  have h := sq_nonneg (qualiaDistance q₁ q₂)
  nlinarith [qualiaDistance_nonneg q₁ q₂, h]

end FarzullaProofs.MonographQualia
