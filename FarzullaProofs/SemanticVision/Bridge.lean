import Mathlib
import FarzullaProofs.SemanticVision.Basic

namespace FarzullaProofs.SemanticVision

variable {α : Type} [DecidableEq α]

/-- THM-semvis-silver-1: Jaccard distance as 1 - similarity. -/
noncomputable def jaccardDistance (A B : Finset α) : ℝ := 1 - jaccard A B

/-- THM-semvis-silver-2: Jaccard similarity is symmetric. -/
theorem jaccard_symm (A B : Finset α) : jaccard A B = jaccard B A := by
  unfold jaccard
  simp [Finset.inter_comm, Finset.union_comm]

/-- THM-semvis-silver-3: Jaccard distance is nonnegative when union is nonempty. -/
theorem jaccardDistance_nonneg (A B : Finset α) (hU : 0 < (A ∪ B).card) :
    0 ≤ jaccardDistance A B := by
  unfold jaccardDistance
  have hle : jaccard A B ≤ 1 := jaccard_le_one A B hU
  linarith

/-- THM-semvis-silver-4: Jaccard distance is at most one. -/
theorem jaccardDistance_le_one (A B : Finset α) :
    jaccardDistance A B ≤ 1 := by
  unfold jaccardDistance
  have hnonneg : 0 ≤ jaccard A B := jaccard_nonneg A B
  linarith

/-- THM-semvis-silver-5: Distance is zero for identical nonempty sets. -/
theorem jaccardDistance_self_eq_zero (A : Finset α) (hA : 0 < A.card) :
    jaccardDistance A A = 0 := by
  unfold jaccardDistance
  rw [jaccard_self_eq_one A hA]
  ring

/-- THM-semvis-silver-6: Jaccard distance is symmetric. -/
theorem jaccardDistance_symm (A B : Finset α) :
    jaccardDistance A B = jaccardDistance B A := by
  unfold jaccardDistance
  rw [jaccard_symm A B]

end FarzullaProofs.SemanticVision
