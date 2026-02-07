import Mathlib

namespace FarzullaProofs.AutonomousRedteam

/-- THM-AutonomousRedteam-bronze-1: Residual incidents after red-team blocking. -/
def residualIncidents (incidents blocked : ℝ) : ℝ := incidents - blocked

/-- THM-AutonomousRedteam-bronze-2: More blocked incidents lowers residual incidents. -/
theorem residualIncidents_anti_blocked {incidents blocked₁ blocked₂ : ℝ}
    (h : blocked₁ ≤ blocked₂) :
    residualIncidents incidents blocked₂ ≤ residualIncidents incidents blocked₁ := by
  unfold residualIncidents
  nlinarith

/-- THM-AutonomousRedteam-bronze-3: Blocking all incidents yields zero residual incidents. -/
theorem residualIncidents_zero_of_full_block (incidents : ℝ) :
    residualIncidents incidents incidents = 0 := by
  unfold residualIncidents
  ring

/-- THM-AutonomousRedteam-bronze-4:
Residual incidents remain nonnegative when blocked does not exceed incidents. -/
theorem residualIncidents_nonneg {incidents blocked : ℝ} (h : blocked ≤ incidents) :
    0 ≤ residualIncidents incidents blocked := by
  unfold residualIncidents
  nlinarith

end FarzullaProofs.AutonomousRedteam
