import Mathlib
import FarzullaProofs.ConsciousnessNominalisation.Basic

namespace FarzullaProofs.ConsciousnessNominalisation

/-- THM-ConsciousnessNominalisation-silver-1: Relative grounding deficit (normalized gap). -/
noncomputable def groundingDeficit (nominal grounded : ℝ) : ℝ :=
  groundingGap nominal grounded / (|nominal| + 1)

/-- THM-ConsciousnessNominalisation-silver-2: Deficit is zero when label and grounding coincide. -/
theorem groundingDeficit_self (x : ℝ) : groundingDeficit x x = 0 := by
  unfold groundingDeficit
  simp [groundingGap_self]

/-- THM-ConsciousnessNominalisation-silver-3: Positive gap implies positive deficit. -/
theorem groundingDeficit_pos {nominal grounded : ℝ}
    (hGap : 0 < groundingGap nominal grounded) :
    0 < groundingDeficit nominal grounded := by
  unfold groundingDeficit
  apply div_pos hGap
  have : (0 : ℝ) ≤ |nominal| := abs_nonneg nominal
  linarith

/-- THM-ConsciousnessNominalisation-silver-4: Increasing grounding decreases deficit. -/
theorem groundingDeficit_anti_grounded {nominal grounded₁ grounded₂ : ℝ}
    (h : grounded₁ ≤ grounded₂) :
    groundingDeficit nominal grounded₂ ≤ groundingDeficit nominal grounded₁ := by
  unfold groundingDeficit
  have hGap : groundingGap nominal grounded₂ ≤ groundingGap nominal grounded₁ :=
    groundingGap_anti_grounded h
  exact div_le_div_of_nonneg_right hGap (by linarith [abs_nonneg nominal])

/-- THM-ConsciousnessNominalisation-silver-5: Deficit is bounded above by absolute gap. -/
theorem groundingDeficit_le_abs_gap (nominal grounded : ℝ) :
    groundingDeficit nominal grounded ≤ |groundingGap nominal grounded| := by
  unfold groundingDeficit
  have hDen : (1 : ℝ) ≤ |nominal| + 1 := by linarith [abs_nonneg nominal]
  have hInv : 0 ≤ (|nominal| + 1)⁻¹ := by positivity
  have hInvLe : (|nominal| + 1)⁻¹ ≤ 1 := by
    have hPos : 0 < |nominal| + 1 := by linarith [abs_nonneg nominal]
    exact (inv_le_iff_one_le_mul₀ hPos).2 (by simp [hDen])
  have hmul : groundingGap nominal grounded / (|nominal| + 1)
      ≤ |groundingGap nominal grounded| * (|nominal| + 1)⁻¹ := by
    have hAbs : groundingGap nominal grounded ≤ |groundingGap nominal grounded| := le_abs_self _
    simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
      mul_le_mul_of_nonneg_right hAbs hInv
  calc
    groundingGap nominal grounded / (|nominal| + 1)
        ≤ |groundingGap nominal grounded| * (|nominal| + 1)⁻¹ := hmul
    _ ≤ |groundingGap nominal grounded| * 1 := by
      exact mul_le_mul_of_nonneg_left hInvLe (abs_nonneg _)
    _ = |groundingGap nominal grounded| := by ring

end FarzullaProofs.ConsciousnessNominalisation
