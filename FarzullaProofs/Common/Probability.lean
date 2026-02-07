import Mathlib

namespace FarzullaProofs.Common.Probability

/-- THM-common-prob-1: Probabilities are nonnegative. -/
theorem prob_nonneg (p : ℝ) (hp : 0 ≤ p) : 0 ≤ p := hp

/-- THM-common-prob-2: Probabilities bounded above by one are at most one. -/
theorem prob_le_one (p : ℝ) (hp : p ≤ 1) : p ≤ 1 := hp

end FarzullaProofs.Common.Probability
