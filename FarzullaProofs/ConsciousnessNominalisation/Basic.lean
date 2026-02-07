import Mathlib

namespace FarzullaProofs.ConsciousnessNominalisation

/-- THM-ConsciousnessNominalisation-bronze-1:
Nominalisation gap between label and grounding. -/
def groundingGap (nominal grounded : ℝ) : ℝ := nominal - grounded

/-- THM-ConsciousnessNominalisation-bronze-2:
Gap is zero when nominal and grounded content coincide. -/
theorem groundingGap_self (x : ℝ) : groundingGap x x = 0 := by
  unfold groundingGap
  ring

/-- THM-ConsciousnessNominalisation-bronze-3:
Gap is positive when nominalization exceeds grounding. -/
theorem groundingGap_pos {nominal grounded : ℝ} (h : grounded < nominal) :
    0 < groundingGap nominal grounded := by
  unfold groundingGap
  nlinarith

/-- THM-ConsciousnessNominalisation-bronze-4:
Increasing grounding reduces the gap. -/
theorem groundingGap_anti_grounded {nominal grounded₁ grounded₂ : ℝ}
    (h : grounded₁ ≤ grounded₂) :
    groundingGap nominal grounded₂ ≤ groundingGap nominal grounded₁ := by
  unfold groundingGap
  nlinarith

end FarzullaProofs.ConsciousnessNominalisation
