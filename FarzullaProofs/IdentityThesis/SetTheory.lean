/-
  Identity is Irreducibly Relational: Set-Theoretic Illustrations
  Formalization of Farzulla (2026), DOI: 10.5281/zenodo.18186445

  Section 4: ZFC-based illustrations of the delta-framework.
  - Extensional distinguishability instance for sets
  - Empty set is relationally defined (Proposition 4.1)
  - Extensionality as the set-theoretic delta relation
-/

import Mathlib.Tactic
import FarzullaProofs.IdentityThesis.Basic

namespace IdentityThesis.SetTheory

/-! ## Extensional Distinguishability (Paper Section 4.1)

In ZFC, sets are distinguished by their members (Axiom of Extensionality):
A = B iff forall z, z in A <-> z in B. We define delta as inequality,
which in a set-theoretic context means: they differ on some member. -/

/-- Sets of natural numbers form a DeltaFramework where distinguishability
is inequality. Two sets are distinguishable iff they have different members. -/
instance setNatDelta : DeltaFramework (Set ℕ) where
  delta A B := A ≠ B
  delta_irrefl := fun _ h => h rfl

/-! ## Empty Set is Relationally Defined (Paper Proposition 4.1)

"The empty set satisfies R(emptyset) != emptyset."

We exhibit {0} as a set distinguishable from the empty set. -/

/-- {0} is distinguishable from the empty set. -/
theorem empty_ne_singleton_zero : (∅ : Set ℕ) ≠ {0} := by
  intro h
  have : (0 : ℕ) ∈ (∅ : Set ℕ) := by rw [h]; exact Set.mem_singleton 0
  simp at this

/-- The empty set is Defined in the extensional delta-framework (Proposition 4.1). -/
theorem empty_set_defined : IdentityThesis.Defined (∅ : Set ℕ) :=
  ⟨{0}, empty_ne_singleton_zero⟩

/-- The referential set of the empty set is nonempty. -/
theorem empty_set_refSet_nonempty : (IdentityThesis.refSet (∅ : Set ℕ)).Nonempty :=
  empty_set_defined

/-! ## Every Non-Universal Set is Defined

In the extensional framework, any set that is not the universe has a
non-empty referential set (since it differs from at least one other set). -/

/-- Any set that is not Set.univ is distinguishable from Set.univ. -/
theorem ne_univ_defined (S : Set ℕ) (h : S ≠ Set.univ) :
    IdentityThesis.Defined S :=
  ⟨Set.univ, h⟩

/-! ## Self-Exclusion in the Set-Theoretic Instance

Instantiating the general self-exclusion theorem: no set belongs
to its own referential set (because A != A is false). -/

/-- A set is not in its own referential set. -/
theorem set_self_not_in_refSet (S : Set ℕ) : S ∉ IdentityThesis.refSet S :=
  IdentityThesis.self_not_in_refSet S

end IdentityThesis.SetTheory
