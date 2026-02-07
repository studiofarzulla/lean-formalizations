import Mathlib
import FarzullaProofs.AsymptoticProtection.Basic

namespace FarzullaProofs.AsymptoticProtection

/-- THM-AsymptoticProtection-silver-1: Protection gap to saturation level 1. -/
noncomputable def saturationGap (k n : ℝ) : ℝ := 1 - protectionLevel k n

/-- THM-AsymptoticProtection-silver-2: Saturation gap is nonnegative for valid parameters. -/
theorem saturationGap_nonneg {k n : ℝ} (hk : 0 ≤ k) (hn : 0 ≤ n) :
    0 ≤ saturationGap k n := by
  unfold saturationGap
  have hpl : protectionLevel k n ≤ 1 := protectionLevel_le_one hk hn
  linarith

/-- THM-AsymptoticProtection-silver-3: Closed form for saturation gap. -/
theorem saturationGap_eq_inv {k n : ℝ} (hden : 0 < 1 + k * n) :
    saturationGap k n = 1 / (1 + k * n) := by
  unfold saturationGap protectionLevel
  have hne : 1 + k * n ≠ 0 := ne_of_gt hden
  field_simp [hne]
  ring

/-- THM-AsymptoticProtection-silver-4: More effort decreases the saturation gap. -/
theorem saturationGap_anti_effort {k n₁ n₂ : ℝ}
    (hk : 0 ≤ k) (hn : 0 ≤ n₁) (hmono : n₁ ≤ n₂) :
    saturationGap k n₂ ≤ saturationGap k n₁ := by
  have hden : 0 < 1 + k * n₁ := by nlinarith
  have hden₂ : 0 < 1 + k * n₂ := by nlinarith
  rw [saturationGap_eq_inv hden₂, saturationGap_eq_inv hden]
  have hbase : 1 + k * n₁ ≤ 1 + k * n₂ := by nlinarith
  exact one_div_le_one_div_of_le hden hbase

/-- THM-AsymptoticProtection-silver-5: Zero effort maximizes saturation gap at one. -/
theorem saturationGap_zero_effort (k : ℝ) : saturationGap k 0 = 1 := by
  unfold saturationGap
  simp [protectionLevel_zero_effort]

end FarzullaProofs.AsymptoticProtection
