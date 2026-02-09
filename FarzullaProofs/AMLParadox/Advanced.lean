import Mathlib
import FarzullaProofs.AMLParadox.Bridge

namespace FarzullaProofs.AMLParadox

/-- THM-AMLParadox-gold-1: Net advantage vanishes when TP and FP coincide. -/
theorem netDetectionAdvantage_eq_zero_of_eq {x total : ℝ} :
    netDetectionAdvantage x x total = 0 := by
  rw [netDetectionAdvantage_eq_scaled_gap]
  ring

/-- THM-AMLParadox-gold-2: Net advantage is nonnegative when TP dominates FP. -/
theorem netDetectionAdvantage_nonneg_of_tp_ge_fp {tp fp total : ℝ}
    (h : fp ≤ tp) (ht : 0 < total) :
    0 ≤ netDetectionAdvantage tp fp total := by
  rw [netDetectionAdvantage_eq_scaled_gap]
  exact div_nonneg (by linarith) (le_of_lt ht)

/-- THM-AMLParadox-gold-3: Utility is affine in TP-FP components. -/
theorem amlUtility_eq_add_scaled (tp fp penalty : ℝ) :
    amlUtility tp fp penalty = tp + (-penalty) * fp := by
  unfold amlUtility
  ring

/-- THM-AMLParadox-gold-4: Utility at unit penalty equals TP-FP gap. -/
theorem amlUtility_eq_gap_of_unit_penalty (tp fp : ℝ) :
    amlUtility tp fp 1 = tp - fp := by
  unfold amlUtility
  ring

end FarzullaProofs.AMLParadox
