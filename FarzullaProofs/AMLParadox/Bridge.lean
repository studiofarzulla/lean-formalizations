import Mathlib
import FarzullaProofs.AMLParadox.Basic

namespace FarzullaProofs.AMLParadox

/-- THM-AMLParadox-silver-1: False-positive rate as false positives over total alerts. -/
noncomputable def falsePositiveRate (fp total : ℝ) : ℝ := fp / total

/-- THM-AMLParadox-silver-2: True-positive rate as true positives over total alerts. -/
noncomputable def truePositiveRate (tp total : ℝ) : ℝ := tp / total

/-- THM-AMLParadox-silver-3: Net detection advantage (TPR - FPR). -/
noncomputable def netDetectionAdvantage (tp fp total : ℝ) : ℝ :=
  truePositiveRate tp total - falsePositiveRate fp total

/-- THM-AMLParadox-silver-4: Net detection advantage equals scaled TP-FP gap. -/
theorem netDetectionAdvantage_eq_scaled_gap {tp fp total : ℝ} :
    netDetectionAdvantage tp fp total = (tp - fp) / total := by
  unfold netDetectionAdvantage truePositiveRate falsePositiveRate
  ring_nf

/-- THM-AMLParadox-silver-5: TP > FP implies positive net detection advantage. -/
theorem netDetectionAdvantage_pos_of_tp_gt_fp {tp fp total : ℝ}
    (h : fp < tp) (ht : 0 < total) :
    0 < netDetectionAdvantage tp fp total := by
  rw [netDetectionAdvantage_eq_scaled_gap]
  apply div_pos
  · linarith
  · exact ht

/-- THM-AMLParadox-silver-6: Utility decreases with penalty when false positives are nonnegative. -/
theorem amlUtility_anti_penalty {tp fp p₁ p₂ : ℝ}
    (hfp : 0 ≤ fp) (hp : p₁ ≤ p₂) :
    amlUtility tp fp p₂ ≤ amlUtility tp fp p₁ := by
  unfold amlUtility
  nlinarith

end FarzullaProofs.AMLParadox
