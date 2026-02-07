import Mathlib

namespace FarzullaProofs.AsymptoticProtection

/-- THM-AsymptoticProtection-bronze-1: Protection level with diminishing returns. -/
noncomputable def protectionLevel (k n : ℝ) : ℝ := (k * n) / (1 + k * n)

/-- THM-AsymptoticProtection-bronze-2:
Protection level is nonnegative for nonnegative parameters. -/
theorem protectionLevel_nonneg {k n : ℝ} (hk : 0 ≤ k) (hn : 0 ≤ n) :
    0 ≤ protectionLevel k n := by
  unfold protectionLevel
  apply div_nonneg
  · nlinarith
  · nlinarith

/-- THM-AsymptoticProtection-bronze-3:
Protection level is bounded above by 1 for nonnegative parameters. -/
theorem protectionLevel_le_one {k n : ℝ} (hk : 0 ≤ k) (hn : 0 ≤ n) :
    protectionLevel k n ≤ 1 := by
  unfold protectionLevel
  have hDen : 0 < 1 + k * n := by nlinarith
  exact (div_le_iff₀ hDen).2 (by nlinarith)

/-- THM-AsymptoticProtection-bronze-4: Zero effort yields zero protection level. -/
theorem protectionLevel_zero_effort (k : ℝ) : protectionLevel k 0 = 0 := by
  unfold protectionLevel
  ring

end FarzullaProofs.AsymptoticProtection
