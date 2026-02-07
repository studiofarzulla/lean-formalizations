import Mathlib

namespace FarzullaProofs.ROMEthics

/-- THM-ROMEthics-bronze-1: Ethical welfare is benefit minus weighted harm. -/
def welfareScore (benefit harm weight : ℝ) : ℝ := benefit - weight * harm

/-- THM-ROMEthics-bronze-2: Welfare increases with benefit. -/
theorem welfareScore_mono_benefit {b₁ b₂ harm weight : ℝ} (h : b₁ ≤ b₂) :
    welfareScore b₁ harm weight ≤ welfareScore b₂ harm weight := by
  unfold welfareScore
  nlinarith

/-- THM-ROMEthics-bronze-3: Welfare decreases with harm when weight is nonnegative. -/
theorem welfareScore_anti_harm {benefit h₁ h₂ weight : ℝ}
    (hWeight : 0 ≤ weight) (h : h₁ ≤ h₂) :
    welfareScore benefit h₂ weight ≤ welfareScore benefit h₁ weight := by
  unfold welfareScore
  nlinarith

/-- THM-ROMEthics-bronze-4: Zero ethical weight recovers raw benefit. -/
theorem welfareScore_eq_benefit_of_zero_weight {benefit harm : ℝ} :
    welfareScore benefit harm 0 = benefit := by
  unfold welfareScore
  ring

end FarzullaProofs.ROMEthics
