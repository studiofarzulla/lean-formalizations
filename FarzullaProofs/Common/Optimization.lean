import Mathlib

namespace FarzullaProofs.Common.Optimization

/-- THM-common-opt-1: Squared deviation is nonnegative. -/
def sqDev (x y : ℝ) : ℝ := (x - y) ^ 2

/-- THM-common-opt-2: Squared deviation is nonnegative. -/
theorem sqDev_nonneg (x y : ℝ) : 0 ≤ sqDev x y := by
  dsimp [sqDev]
  nlinarith [sq_nonneg (x - y)]

end FarzullaProofs.Common.Optimization
