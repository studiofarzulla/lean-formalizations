import Mathlib
import FarzullaProofs.ROMEthics.Basic
import FarzullaProofs.ROM.Basic
import FarzullaProofs.AxiomOfConsent.Friction

namespace FarzullaProofs.ROMEthics

/-- THM-ROMEthics-silver-1: Ethical survival is welfare discounted by friction. -/
noncomputable def ethicalSurvival (benefit harm weight F : ℝ) : ℝ :=
  welfareScore benefit harm weight / (1 + F)

/-- THM-ROMEthics-silver-2: Ethical survival is monotone in benefit for nonnegative friction. -/
theorem ethicalSurvival_mono_benefit {b₁ b₂ harm weight F : ℝ}
    (hb : b₁ ≤ b₂) (hF : 0 ≤ F) :
    ethicalSurvival b₁ harm weight F ≤ ethicalSurvival b₂ harm weight F := by
  unfold ethicalSurvival
  exact div_le_div_of_nonneg_right (welfareScore_mono_benefit hb) (by linarith)

/-- THM-ROMEthics-silver-3:
Ethical survival is anti-monotone in harm for nonnegative weight/friction. -/
theorem ethicalSurvival_anti_harm {benefit h₁ h₂ weight F : ℝ}
    (hWeight : 0 ≤ weight) (hh : h₁ ≤ h₂) (hF : 0 ≤ F) :
    ethicalSurvival benefit h₂ weight F ≤ ethicalSurvival benefit h₁ weight F := by
  unfold ethicalSurvival
  exact div_le_div_of_nonneg_right
    (welfareScore_anti_harm hWeight hh)
    (by linarith)

/-- THM-ROMEthics-silver-4: At zero harm, ethical survival equals ROM consent survival. -/
theorem ethicalSurvival_eq_rom_survival_of_zero_harm (benefit weight F : ℝ) :
    ethicalSurvival benefit 0 weight F = ROM.consent_survival benefit F := by
  unfold ethicalSurvival ROM.consent_survival welfareScore
  ring_nf

/-- THM-ROMEthics-silver-5: Better alignment increases ethical survival via reduced friction. -/
theorem ethicalSurvival_mono_alignment_via_friction
    {benefit harm weight σ α₁ α₂ ε : ℝ}
    (hW : 0 < welfareScore benefit harm weight)
    (hσ : 0 < σ)
    (hε : 0 ≤ ε)
    (hα₁ : -1 < α₁)
    (hα : α₁ < α₂) :
    ethicalSurvival benefit harm weight (AxiomOfConsent.friction σ α₁ ε) <
      ethicalSurvival benefit harm weight (AxiomOfConsent.friction σ α₂ ε) := by
  have hF : AxiomOfConsent.friction σ α₂ ε < AxiomOfConsent.friction σ α₁ ε :=
    AxiomOfConsent.friction_strict_anti_alignment hσ hε hα₁ hα
  have hα₂ : -1 < α₂ := by linarith
  have hFnonneg : 0 ≤ AxiomOfConsent.friction σ α₂ ε :=
    AxiomOfConsent.friction_nonneg (by linarith) hα₂ hε
  unfold ethicalSurvival
  simpa [ROM.consent_survival] using
    (ROM.consent_survival_anti_friction (L := welfareScore benefit harm weight)
      (F₁ := AxiomOfConsent.friction σ α₂ ε)
      (F₂ := AxiomOfConsent.friction σ α₁ ε)
      hW hFnonneg hF)

end FarzullaProofs.ROMEthics
