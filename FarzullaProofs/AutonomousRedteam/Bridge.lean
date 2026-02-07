import Mathlib
import FarzullaProofs.AutonomousRedteam.Basic

namespace FarzullaProofs.AutonomousRedteam

/-- THM-AutonomousRedteam-silver-1: Incident reduction ratio blocked/incidents. -/
noncomputable def reductionRatio (incidents blocked : ℝ) : ℝ := blocked / incidents

/-- THM-AutonomousRedteam-silver-2: Reduction ratio is in [0,1] under valid bounds. -/
theorem reductionRatio_bounds {incidents blocked : ℝ}
    (hInc : 0 < incidents) (hBlk0 : 0 ≤ blocked) (hBlkLe : blocked ≤ incidents) :
    0 ≤ reductionRatio incidents blocked ∧ reductionRatio incidents blocked ≤ 1 := by
  constructor
  · unfold reductionRatio
    exact div_nonneg hBlk0 (le_of_lt hInc)
  · unfold reductionRatio
    exact (div_le_iff₀ hInc).2 (by simpa using hBlkLe)

/-- THM-AutonomousRedteam-silver-3: Residual incidents equal incidents times (1-ratio). -/
theorem residualIncidents_eq_incidents_mul_one_sub_ratio {incidents blocked : ℝ}
    (hInc : incidents ≠ 0) :
    residualIncidents incidents blocked = incidents * (1 - reductionRatio incidents blocked) := by
  unfold residualIncidents reductionRatio
  field_simp [hInc]

/-- THM-AutonomousRedteam-silver-4: Higher reduction ratio implies lower residual incidents. -/
theorem residualIncidents_anti_ratio {incidents r₁ r₂ : ℝ}
    (hInc : 0 ≤ incidents) (h : r₁ ≤ r₂) :
    incidents * (1 - r₂) ≤ incidents * (1 - r₁) := by
  nlinarith

/-- THM-AutonomousRedteam-silver-5: Full ratio yields zero residual incidents. -/
theorem residualIncidents_zero_of_ratio_one {incidents : ℝ} :
    incidents * (1 - (1 : ℝ)) = 0 := by
  ring

end FarzullaProofs.AutonomousRedteam
