import FarzullaProofs.ROM.Basic

namespace ROM

/-- THM-rom-gold-1: Consent survival is nonnegative for nonnegative legitimacy and friction. -/
theorem consent_survival_nonneg {L F : ℝ} (hL : 0 ≤ L) (hF : 0 ≤ F) :
    0 ≤ consent_survival L F := by
  unfold consent_survival
  exact div_nonneg hL (by linarith)

/-- THM-rom-gold-2: Zero legitimacy gives zero survival regardless of friction. -/
theorem consent_survival_zero_legitimacy (F : ℝ) :
    consent_survival 0 F = 0 := by
  unfold consent_survival
  ring

/-- THM-rom-gold-3: Survival scales linearly with legitimacy. -/
theorem consent_survival_scale_legitimacy (c L F : ℝ) :
    consent_survival (c * L) F = c * consent_survival L F := by
  unfold consent_survival
  ring

/-- THM-rom-gold-4: Survival is upper-bounded by legitimacy when friction is nonnegative. -/
theorem consent_survival_le_legitimacy {L F : ℝ} (hL : 0 ≤ L) (hF : 0 ≤ F) :
    consent_survival L F ≤ L := by
  unfold consent_survival
  have hden : 0 < 1 + F := by linarith
  exact (div_le_iff₀ hden).2 (by nlinarith)

/-- THM-rom-gold-5: Positive legitimacy and nonnegative friction imply positive survival. -/
theorem consent_survival_pos {L F : ℝ} (hL : 0 < L) (hF : 0 ≤ F) :
    0 < consent_survival L F := by
  unfold consent_survival
  exact div_pos hL (by linarith)

/-- THM-rom-gold-6: Constant source mass through row-stochastic kernel yields c*n total. -/
theorem row_stochastic_sum_const {n : ℕ} (c : ℝ) (M : Fin n → Fin n → ℝ)
    (hM : ∀ j, ∑ i : Fin n, M j i = 1) :
    ∑ i : Fin n, ∑ j : Fin n, c * M j i = c * n := by
  simpa [Finset.mul_sum, mul_assoc, mul_left_comm, mul_comm] using
    (row_stochastic_sum (f := fun _ => c) M hM)

end ROM
