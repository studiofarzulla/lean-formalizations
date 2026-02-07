import FarzullaProofs.ConsensualSovereignty.Dynamics

namespace FarzullaProofs.ConsensualSovereignty

variable {ι : Type}

/-- THM-consov-gold-1: Total stake is nonnegative under nonnegative stake assignments. -/
theorem totalStake_nonneg [Fintype ι] (stakes : ι → ℝ)
    (hs : ∀ i, 0 ≤ stakes i) :
    0 ≤ totalStake stakes := by
  unfold totalStake
  exact Finset.sum_nonneg (fun i _ => hs i)

/-- THM-consov-gold-2: Any strictly positive stake witness makes total stake positive. -/
theorem totalStake_pos_of_exists_pos [Fintype ι] (stakes : ι → ℝ)
    (hs : ∀ i, 0 ≤ stakes i)
    (hpos : ∃ j, 0 < stakes j) :
    0 < totalStake stakes := by
  rcases hpos with ⟨j, hj⟩
  unfold totalStake
  have hle : stakes j ≤ ∑ i, stakes i := by
    exact Finset.single_le_sum (fun i _ => hs i) (by simp)
  exact lt_of_lt_of_le hj hle

/-- THM-consov-gold-3: Alignment is one when every voice weight equals one. -/
theorem alignment_eq_one_of_voice_one [Fintype ι]
    (stakes voice : ι → ℝ)
    (hvoice : ∀ i, voice i = 1)
    (hS : 0 < totalStake stakes) :
    alignment stakes voice = 1 := by
  unfold alignment totalStake
  have hden : (∑ i, stakes i) ≠ 0 := ne_of_gt hS
  simp [hvoice, hden]

/-- THM-consov-gold-4: Alignment is monotone in voice profile under fixed nonnegative stakes. -/
theorem alignment_mono_voice [Fintype ι]
    (stakes voice₁ voice₂ : ι → ℝ)
    (hs : ∀ i, 0 ≤ stakes i)
    (hvoice : ∀ i, voice₁ i ≤ voice₂ i)
    (hS : 0 < totalStake stakes) :
    alignment stakes voice₁ ≤ alignment stakes voice₂ := by
  unfold alignment totalStake
  have hterm : ∀ i, stakes i * voice₁ i ≤ stakes i * voice₂ i := by
    intro i
    exact mul_le_mul_of_nonneg_left (hvoice i) (hs i)
  have hsum : (∑ i, stakes i * voice₁ i) ≤ (∑ i, stakes i * voice₂ i) := by
    exact Finset.sum_le_sum (fun i _ => hterm i)
  exact div_le_div_of_nonneg_right hsum (le_of_lt hS)

/-- THM-consov-gold-5: Legitimacy is monotone in performance when w₂ ≥ 0. -/
theorem legitimacy_mono_performance
    (w₁ w₂ α P₁ P₂ : ℝ)
    (hw₂ : 0 ≤ w₂)
    (hP : P₁ ≤ P₂) :
    legitimacy w₁ w₂ α P₁ ≤ legitimacy w₁ w₂ α P₂ := by
  unfold legitimacy
  nlinarith [mul_le_mul_of_nonneg_left hP hw₂]

/-- THM-consov-gold-6: Legitimacy is strictly monotone in performance when w₂ > 0. -/
theorem legitimacy_strict_mono_performance
    (w₁ w₂ α P₁ P₂ : ℝ)
    (hw₂ : 0 < w₂)
    (hP : P₁ < P₂) :
    legitimacy w₁ w₂ α P₁ < legitimacy w₁ w₂ α P₂ := by
  unfold legitimacy
  nlinarith [mul_lt_mul_of_pos_left hP hw₂]

/-- THM-consov-gold-7: Zero stakes imply zero friction for any outcome/preferences. -/
theorem friction_zero_of_zero_stakes [Fintype ι]
    (stakes pref : ι → ℝ) (outcome : ℝ)
    (hzero : ∀ i, stakes i = 0) :
    friction stakes pref outcome = 0 := by
  unfold friction
  apply Finset.sum_eq_zero
  intro i _
  simp [hzero i]

end FarzullaProofs.ConsensualSovereignty
