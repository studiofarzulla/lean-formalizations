import Mathlib

namespace FarzullaProofs.AMLParadox

/-- THM-AMLParadox-bronze-1:
Compliance utility balances true positives against false-positive burden. -/
def amlUtility (tp fp penalty : ℝ) : ℝ := tp - penalty * fp

/-- THM-AMLParadox-bronze-2: Utility is monotone in true positives. -/
theorem amlUtility_mono_tp {tp₁ tp₂ fp penalty : ℝ} (h : tp₁ ≤ tp₂) :
    amlUtility tp₁ fp penalty ≤ amlUtility tp₂ fp penalty := by
  unfold amlUtility
  nlinarith

/-- THM-AMLParadox-bronze-3: Utility decreases with false positives when penalty is nonnegative. -/
theorem amlUtility_anti_fp {tp fp₁ fp₂ penalty : ℝ}
    (hPenalty : 0 ≤ penalty) (h : fp₁ ≤ fp₂) :
    amlUtility tp fp₂ penalty ≤ amlUtility tp fp₁ penalty := by
  unfold amlUtility
  nlinarith

/-- THM-AMLParadox-bronze-4: Zero penalty collapses utility to true positives. -/
theorem amlUtility_eq_tp_of_zero_penalty {tp fp : ℝ} : amlUtility tp fp 0 = tp := by
  unfold amlUtility
  ring

end FarzullaProofs.AMLParadox
