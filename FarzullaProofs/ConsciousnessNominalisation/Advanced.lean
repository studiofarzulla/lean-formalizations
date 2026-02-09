import Mathlib
import FarzullaProofs.ConsciousnessNominalisation.Bridge

namespace FarzullaProofs.ConsciousnessNominalisation

/-- THM-ConsciousnessNominalisation-gold-1:
Grounding gap is zero iff nominal and grounded values are equal. -/
theorem groundingGap_eq_zero_iff (nominal grounded : ℝ) :
    groundingGap nominal grounded = 0 ↔ nominal = grounded := by
  unfold groundingGap
  constructor
  · intro h
    linarith
  · intro h
    subst h
    ring

/-- THM-ConsciousnessNominalisation-gold-2:
Deficit is nonnegative when nominalization dominates grounding. -/
theorem groundingDeficit_nonneg_of_gap_nonneg {nominal grounded : ℝ}
    (hGap : 0 ≤ groundingGap nominal grounded) :
    0 ≤ groundingDeficit nominal grounded := by
  unfold groundingDeficit
  exact div_nonneg hGap (by linarith [abs_nonneg nominal])

/-- THM-ConsciousnessNominalisation-gold-3:
Deficit is bounded below by negative absolute gap. -/
theorem groundingDeficit_ge_neg_abs_gap (nominal grounded : ℝ) :
    -|groundingGap nominal grounded| ≤ groundingDeficit nominal grounded := by
  unfold groundingDeficit
  have hPos : 0 < |nominal| + 1 := by linarith [abs_nonneg nominal]
  have hGapLower : -|groundingGap nominal grounded| ≤ groundingGap nominal grounded := by
    exact neg_abs_le (groundingGap nominal grounded)
  have hDivLower : -|groundingGap nominal grounded| / (|nominal| + 1)
      ≤ groundingGap nominal grounded / (|nominal| + 1) :=
    div_le_div_of_nonneg_right hGapLower (le_of_lt hPos)
  have hNeg : -|groundingGap nominal grounded| ≤ 0 := by
    exact neg_nonpos.mpr (abs_nonneg _)
  have hScale : -|groundingGap nominal grounded|
      ≤ -|groundingGap nominal grounded| / (|nominal| + 1) := by
    have hDenGeOne : (1 : ℝ) ≤ |nominal| + 1 := by linarith [abs_nonneg nominal]
    have hInvLeOne : (|nominal| + 1)⁻¹ ≤ 1 := by
      exact (inv_le_iff_one_le_mul₀ hPos).2 (by simpa using hDenGeOne)
    have hMul : -|groundingGap nominal grounded| * 1
        ≤ -|groundingGap nominal grounded| * (|nominal| + 1)⁻¹ :=
      mul_le_mul_of_nonpos_left hInvLeOne hNeg
    simpa [div_eq_mul_inv] using hMul
  exact le_trans hScale hDivLower

/-- THM-ConsciousnessNominalisation-gold-4:
Deficit is zero whenever nominal and grounded values coincide. -/
theorem groundingDeficit_eq_zero_of_eq (x : ℝ) :
    groundingDeficit x x = 0 :=
  groundingDeficit_self x

end FarzullaProofs.ConsciousnessNominalisation
