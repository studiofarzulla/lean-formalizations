import Mathlib

namespace FarzullaProofs.ConsensualSovereignty

variable {ι : Type} [Fintype ι]

/-- Consent-holder mapping over time and domains. -/
abbrev Holders (τ δ : Type) := τ → δ → Set ι

/-- Total stakes across agents. -/
noncomputable def totalStake (stakes : ι → ℝ) : ℝ := ∑ i, stakes i

/-- Stakes-weighted consent alignment. -/
noncomputable def alignment (stakes voice : ι → ℝ) : ℝ :=
  (∑ i, stakes i * voice i) / totalStake stakes

/-- Stakes-weighted friction around an outcome. -/
noncomputable def friction (stakes pref : ι → ℝ) (outcome : ℝ) : ℝ :=
  ∑ i, stakes i * |outcome - pref i|

/-- Legitimacy as a weighted combination of alignment and performance. -/
noncomputable def legitimacy (w₁ w₂ α P : ℝ) : ℝ := w₁ * α + w₂ * P

end FarzullaProofs.ConsensualSovereignty
