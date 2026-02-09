import Mathlib
import FarzullaProofs.SemanticVision.Bridge

namespace FarzullaProofs.SemanticVision

variable {α : Type} [DecidableEq α]

/-- THM-semvis-gold-1: Jaccard similarity is zero for disjoint nonempty unions. -/
theorem jaccard_eq_zero_of_disjoint (A B : Finset α)
    (hU : 0 < (A ∪ B).card) (hDisj : Disjoint A B) :
    jaccard A B = 0 := by
  unfold jaccard
  have hInter : A ∩ B = (∅ : Finset α) := by
    exact Finset.disjoint_iff_inter_eq_empty.mp hDisj
  have hden : ((A ∪ B).card : ℝ) ≠ 0 := by
    exact_mod_cast (Nat.ne_of_gt hU)
  rw [hInter]
  simp

/-- THM-semvis-gold-2: Jaccard distance is one for disjoint nonempty unions. -/
theorem jaccardDistance_eq_one_of_disjoint (A B : Finset α)
    (hU : 0 < (A ∪ B).card) (hDisj : Disjoint A B) :
    jaccardDistance A B = 1 := by
  unfold jaccardDistance
  rw [jaccard_eq_zero_of_disjoint A B hU hDisj]
  ring

/-- THM-semvis-gold-3: Distance lies in [0,1] whenever the union is nonempty. -/
theorem jaccardDistance_bounds (A B : Finset α) (hU : 0 < (A ∪ B).card) :
    0 ≤ jaccardDistance A B ∧ jaccardDistance A B ≤ 1 :=
  ⟨jaccardDistance_nonneg A B hU, jaccardDistance_le_one A B⟩

/-- THM-semvis-gold-4: Equal nonempty sets have zero Jaccard distance. -/
theorem jaccardDistance_eq_zero_of_eq (A B : Finset α)
    (hEq : A = B) (hA : 0 < A.card) :
    jaccardDistance A B = 0 := by
  subst hEq
  exact jaccardDistance_self_eq_zero A hA

end FarzullaProofs.SemanticVision
