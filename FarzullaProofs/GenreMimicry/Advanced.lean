import Mathlib
import FarzullaProofs.GenreMimicry.Bridge

namespace FarzullaProofs.GenreMimicry

/-- THM-genre-gold-1: Rate is strictly positive with positive numerator/total. -/
theorem rate_pos {d t : ℝ} (hd : 0 < d) (ht : 0 < t) : 0 < rate d t := by
  unfold rate
  exact div_pos hd ht

/-- THM-genre-gold-2: Rate is strictly below one when numerator is below total. -/
theorem rate_lt_one {d t : ℝ} (hdt : d < t) (ht : 0 < t) : rate d t < 1 := by
  unfold rate
  have hmul : d < 1 * t := by simpa using hdt
  exact (div_lt_iff₀ ht).2 hmul

/-- THM-genre-gold-3: Odds of the rate has closed form d / (t - d). -/
theorem odds_rate_eq_ratio {d t : ℝ} (ht : t ≠ 0) :
    odds (rate d t) = d / (t - d) := by
  unfold odds rate
  field_simp [ht]

/-- THM-genre-gold-4: Odds of the rate is nonnegative under bounded counts. -/
theorem odds_rate_nonneg_of_bounds {d t : ℝ}
    (hd : 0 ≤ d) (hdt : d < t) (ht : 0 < t) :
    0 ≤ odds (rate d t) := by
  have hp : 0 ≤ rate d t := rate_nonneg hd ht
  have hlt : rate d t < 1 := rate_lt_one hdt ht
  unfold odds
  apply div_nonneg hp
  linarith

end FarzullaProofs.GenreMimicry
