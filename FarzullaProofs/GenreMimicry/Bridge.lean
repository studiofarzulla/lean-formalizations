import Mathlib
import FarzullaProofs.GenreMimicry.Basic

namespace FarzullaProofs.GenreMimicry

/-- THM-genre-silver-1: Complement rate for non-disclaimer responses. -/
noncomputable def rateComplement (d t : ℝ) : ℝ := 1 - rate d t

/-- THM-genre-silver-2: Rate is monotone in numerator for fixed positive total. -/
theorem rate_mono_numerator {d₁ d₂ t : ℝ} (h : d₁ ≤ d₂) (ht : 0 < t) :
    rate d₁ t ≤ rate d₂ t := by
  unfold rate
  have hmul : d₁ * t ≤ d₂ * t := mul_le_mul_of_nonneg_right h (le_of_lt ht)
  exact (div_le_div_iff₀ ht ht).2 hmul

/-- THM-genre-silver-3: Complement rate is nonnegative under count bounds. -/
theorem rateComplement_nonneg {d t : ℝ} (hdt : d ≤ t) (ht : 0 < t) :
    0 ≤ rateComplement d t := by
  unfold rateComplement
  have hle : rate d t ≤ 1 := rate_le_one hdt ht
  linarith

/-- THM-genre-silver-4: Complement rate is at most one for nonnegative counts. -/
theorem rateComplement_le_one {d t : ℝ} (hd : 0 ≤ d) (ht : 0 < t) :
    rateComplement d t ≤ 1 := by
  unfold rateComplement
  have hnonneg : 0 ≤ rate d t := rate_nonneg hd ht
  linarith

/-- THM-genre-silver-5: Rate plus complement equals one. -/
theorem rate_add_rateComplement (d t : ℝ) :
    rate d t + rateComplement d t = 1 := by
  unfold rateComplement
  ring

/-- THM-genre-silver-6: Higher disclaimer counts lower complement rate. -/
theorem rateComplement_anti_numerator {d₁ d₂ t : ℝ}
    (h : d₁ ≤ d₂) (ht : 0 < t) :
    rateComplement d₂ t ≤ rateComplement d₁ t := by
  unfold rateComplement
  have hr : rate d₁ t ≤ rate d₂ t := rate_mono_numerator h ht
  linarith

/-- THM-genre-silver-7: Odds of the rate are positive when rate is in (0,1). -/
theorem odds_rate_pos_of_bounds {d t : ℝ}
    (hd : 0 < d) (hdt : d < t) (ht : 0 < t) :
    0 < odds (rate d t) := by
  have hp0 : 0 < rate d t := by
    unfold rate
    exact div_pos hd ht
  have hp1 : rate d t < 1 := by
    unfold rate
    have hmul : d * t < t * t := by
      exact mul_lt_mul_of_pos_right hdt ht
    have hlt : d / t < t / t := (div_lt_div_iff₀ ht ht).2 hmul
    have htnz : t ≠ 0 := ne_of_gt ht
    simpa [htnz] using hlt
  exact odds_pos hp0 hp1

end FarzullaProofs.GenreMimicry
