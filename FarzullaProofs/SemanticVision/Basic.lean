import Mathlib

namespace FarzullaProofs.SemanticVision

variable {α : Type} [DecidableEq α]

/-- Jaccard similarity on finite sets. -/
noncomputable def jaccard (A B : Finset α) : ℝ :=
  ((A ∩ B).card : ℝ) / ((A ∪ B).card : ℝ)

/-- THM-semvis-bronze-1: Jaccard is nonnegative. -/
theorem jaccard_nonneg (A B : Finset α) : 0 ≤ jaccard A B := by
  unfold jaccard
  exact div_nonneg (by positivity) (by positivity)

/-- THM-semvis-bronze-2: Jaccard is at most one when union is nonempty. -/
theorem jaccard_le_one (A B : Finset α) (hU : 0 < (A ∪ B).card) :
    jaccard A B ≤ 1 := by
  unfold jaccard
  have hsubset : A ∩ B ⊆ A ∪ B := by
    intro x hx
    exact Finset.mem_union.mpr (Or.inl (Finset.mem_of_mem_inter_left hx))
  have hcard : (A ∩ B).card ≤ (A ∪ B).card := by
    exact Finset.card_le_card hsubset
  have hcardR : ((A ∩ B).card : ℝ) ≤ ((A ∪ B).card : ℝ) := by
    exact_mod_cast hcard
  have hden : (0 : ℝ) < ((A ∪ B).card : ℝ) := by
    exact_mod_cast hU
  have hdiv : ((A ∩ B).card : ℝ) / ((A ∪ B).card : ℝ) ≤
      ((A ∪ B).card : ℝ) / ((A ∪ B).card : ℝ) :=
    div_le_div_of_nonneg_right hcardR (le_of_lt hden)
  have hden_ne : ((A ∪ B).card : ℝ) ≠ 0 := by linarith
  simpa [hden_ne] using hdiv

/-- THM-semvis-bronze-3: Jaccard of a set with itself is one (if nonempty). -/
theorem jaccard_self_eq_one (A : Finset α) (hA : 0 < A.card) :
    jaccard A A = 1 := by
  unfold jaccard
  have hAne : ((A.card : Nat) : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt hA)
  simp [hAne]

end FarzullaProofs.SemanticVision
