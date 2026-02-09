import Mathlib
import FarzullaProofs.AsymptoticProtection.Bridge

namespace FarzullaProofs.AsymptoticProtection

/-- THM-AsymptoticProtection-gold-1: Saturation gap is bounded above by one on valid domain. -/
theorem saturationGap_le_one {k n : ℝ} (hk : 0 ≤ k) (hn : 0 ≤ n) :
    saturationGap k n ≤ 1 := by
  unfold saturationGap
  have hnonneg : 0 ≤ protectionLevel k n := protectionLevel_nonneg hk hn
  linarith

/-- THM-AsymptoticProtection-gold-2: Protection level plus saturation gap equals one. -/
theorem protectionLevel_add_saturationGap (k n : ℝ) :
    protectionLevel k n + saturationGap k n = 1 := by
  unfold saturationGap
  ring

/-- THM-AsymptoticProtection-gold-3:
Saturation gap is definitionally one minus protection level. -/
theorem saturationGap_eq_one_sub_protectionLevel (k n : ℝ) :
    saturationGap k n = 1 - protectionLevel k n := by
  rfl

/-- THM-AsymptoticProtection-gold-4:
Protection level is definitionally one minus saturation gap. -/
theorem protectionLevel_eq_one_sub_saturationGap (k n : ℝ) :
    protectionLevel k n = 1 - saturationGap k n := by
  unfold saturationGap
  ring

end FarzullaProofs.AsymptoticProtection
