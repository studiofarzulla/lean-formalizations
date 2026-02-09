import Mathlib
import FarzullaProofs.AutonomousRedteam.Bridge

namespace FarzullaProofs.AutonomousRedteam

/-- THM-AutonomousRedteam-gold-1:
Residual plus blocked incidents reconstructs total incidents. -/
theorem residualIncidents_add_blocked (incidents blocked : ℝ) :
    residualIncidents incidents blocked + blocked = incidents := by
  unfold residualIncidents
  ring

/-- THM-AutonomousRedteam-gold-2:
Residual incidents are bounded above by total incidents under nonnegative blocking. -/
theorem residualIncidents_le_incidents {incidents blocked : ℝ} (hBlk : 0 ≤ blocked) :
    residualIncidents incidents blocked ≤ incidents := by
  unfold residualIncidents
  nlinarith

/-- THM-AutonomousRedteam-gold-3:
Reduction ratio is zero when blocked incidents are zero. -/
theorem reductionRatio_zero_blocked {incidents : ℝ} :
    reductionRatio incidents 0 = 0 := by
  unfold reductionRatio
  simp

/-- THM-AutonomousRedteam-gold-4:
Residual formula under a reduction ratio can be rewritten into linear form. -/
theorem incidents_mul_one_sub_ratio_eq_residual {incidents blocked : ℝ}
    (hInc : incidents ≠ 0) :
    incidents * (1 - reductionRatio incidents blocked) = residualIncidents incidents blocked := by
  rw [residualIncidents_eq_incidents_mul_one_sub_ratio hInc]

end FarzullaProofs.AutonomousRedteam
