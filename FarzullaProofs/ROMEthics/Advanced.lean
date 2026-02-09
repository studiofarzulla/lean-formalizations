import Mathlib
import FarzullaProofs.ROMEthics.Bridge

namespace FarzullaProofs.ROMEthics

/-- THM-ROMEthics-gold-1: Zero friction recovers welfare score exactly. -/
theorem ethicalSurvival_eq_welfare_of_zero_friction (benefit harm weight : ℝ) :
    ethicalSurvival benefit harm weight 0 = welfareScore benefit harm weight := by
  unfold ethicalSurvival
  ring

/-- THM-ROMEthics-gold-2:
Ethical survival is nonnegative when welfare is nonnegative and friction is nonnegative. -/
theorem ethicalSurvival_nonneg {benefit harm weight F : ℝ}
    (hW : 0 ≤ welfareScore benefit harm weight) (hF : 0 ≤ F) :
    0 ≤ ethicalSurvival benefit harm weight F := by
  unfold ethicalSurvival
  exact div_nonneg hW (by linarith)

/-- THM-ROMEthics-gold-3:
Ethical survival is bounded above by welfare under nonnegative friction. -/
theorem ethicalSurvival_le_welfare {benefit harm weight F : ℝ}
    (hW : 0 ≤ welfareScore benefit harm weight) (hF : 0 ≤ F) :
    ethicalSurvival benefit harm weight F ≤ welfareScore benefit harm weight := by
  unfold ethicalSurvival
  have hden : 0 < 1 + F := by linarith
  by_cases hZero : welfareScore benefit harm weight = 0
  · simp [hZero]
  · have hdiv : welfareScore benefit harm weight / (1 + F)
      ≤ welfareScore benefit harm weight / 1 :=
      div_le_div_of_nonneg_left hW (by linarith) (by linarith)
    simpa using hdiv

/-- THM-ROMEthics-gold-4:
Monotonicity in benefit at zero friction equals welfare monotonicity. -/
theorem ethicalSurvival_mono_benefit_zero_friction {b₁ b₂ harm weight : ℝ}
    (hb : b₁ ≤ b₂) :
    ethicalSurvival b₁ harm weight 0 ≤ ethicalSurvival b₂ harm weight 0 := by
  rw [ethicalSurvival_eq_welfare_of_zero_friction, ethicalSurvival_eq_welfare_of_zero_friction]
  exact welfareScore_mono_benefit hb

end FarzullaProofs.ROMEthics
