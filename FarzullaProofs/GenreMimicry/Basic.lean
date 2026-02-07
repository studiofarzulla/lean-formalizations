import Mathlib

namespace FarzullaProofs.GenreMimicry

/-- Disclaimer rate as disclaimers/total. -/
noncomputable def rate (disclaimers total : ℝ) : ℝ := disclaimers / total

/-- Odds transformation p/(1-p). -/
noncomputable def odds (p : ℝ) : ℝ := p / (1 - p)

/-- THM-genre-bronze-1: Rate is nonnegative under nonnegative counts. -/
theorem rate_nonneg {d t : ℝ} (hd : 0 ≤ d) (ht : 0 < t) : 0 ≤ rate d t := by
  unfold rate
  exact div_nonneg hd (le_of_lt ht)

/-- THM-genre-bronze-2: Rate is at most one when d ≤ t. -/
theorem rate_le_one {d t : ℝ} (hdt : d ≤ t) (ht : 0 < t) : rate d t ≤ 1 := by
  unfold rate
  exact (div_le_iff₀ ht).2 (by simpa using hdt)

/-- THM-genre-bronze-3: Positive gap between two rates when numerator gap is positive. -/
theorem rate_gap_pos {a b t : ℝ} (hab : a < b) (ht : 0 < t) :
    rate a t < rate b t := by
  unfold rate
  have hmul : a * t < b * t := by
    exact mul_lt_mul_of_pos_right hab ht
  exact (div_lt_div_iff₀ ht ht).2 hmul

/-- THM-genre-bronze-4: Odds are positive for probabilities in (0,1). -/
theorem odds_pos {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) : 0 < odds p := by
  unfold odds
  exact div_pos hp0 (by linarith)

end FarzullaProofs.GenreMimicry
