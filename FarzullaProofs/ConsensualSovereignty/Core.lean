import FarzullaProofs.ConsensualSovereignty.Definitions

namespace FarzullaProofs.ConsensualSovereignty

variable {ι : Type}

/-- THM-consov-4-1: Consent-holder existence for any nonempty holder set. -/
theorem consent_holder_exists {τ δ : Type} (H : Holders (ι := ι) τ δ)
    (t : τ) (d : δ) (h : (H t d).Nonempty) :
    ∃ i, i ∈ H t d := h

/-- THM-consov-4-2: Alignment is nonnegative under nonnegative stakes/voice. -/
theorem alignment_nonneg
    [Fintype ι]
    (stakes voice : ι → ℝ)
    (hs : ∀ i, 0 ≤ stakes i)
    (hv : ∀ i, 0 ≤ voice i)
    (hS : 0 < totalStake stakes) :
    0 ≤ alignment stakes voice := by
  unfold alignment totalStake
  apply div_nonneg
  · exact Finset.sum_nonneg (fun i _ => mul_nonneg (hs i) (hv i))
  · exact le_of_lt hS

/-- THM-consov-4-3: Alignment is at most one when voice is bounded by one. -/
theorem alignment_le_one
    [Fintype ι]
    (stakes voice : ι → ℝ)
    (hs : ∀ i, 0 ≤ stakes i)
    (hv1 : ∀ i, voice i ≤ 1)
    (hS : 0 < totalStake stakes) :
    alignment stakes voice ≤ 1 := by
  unfold alignment totalStake
  have hterm : ∀ i, stakes i * voice i ≤ stakes i := by
    intro i
    have hmul : stakes i * voice i ≤ stakes i * 1 :=
      mul_le_mul_of_nonneg_left (hv1 i) (hs i)
    simpa using hmul
  have hsum : (∑ i, stakes i * voice i) ≤ ∑ i, stakes i := by
    exact Finset.sum_le_sum (fun i _ => hterm i)
  have hdiv : (∑ i, stakes i * voice i) / (∑ i, stakes i) ≤ 1 := by
    have hle :
        (∑ i, stakes i * voice i) / (∑ i, stakes i) ≤
          (∑ i, stakes i) / (∑ i, stakes i) :=
      div_le_div_of_nonneg_right hsum (le_of_lt hS)
    have hden : (∑ i, stakes i) ≠ 0 := ne_of_gt hS
    simpa [hden] using hle
  simpa [alignment, totalStake] using hdiv

/-- THM-consov-4-4: Friction is nonnegative under nonnegative stakes. -/
theorem friction_nonneg
    [Fintype ι]
    (stakes pref : ι → ℝ) (outcome : ℝ)
    (hs : ∀ i, 0 ≤ stakes i) :
    0 ≤ friction stakes pref outcome := by
  unfold friction
  exact Finset.sum_nonneg (fun i _ => mul_nonneg (hs i) (abs_nonneg _))

/-- THM-consov-4-5: Friction is zero at perfect alignment with each preference. -/
theorem friction_zero_of_perfect_alignment
    [Fintype ι]
    (stakes pref : ι → ℝ) (outcome : ℝ)
    (hperfect : ∀ i, pref i = outcome) :
    friction stakes pref outcome = 0 := by
  unfold friction
  apply Finset.sum_eq_zero
  intro i _
  simp [hperfect i]

end FarzullaProofs.ConsensualSovereignty
