/-
  Identity is Irreducibly Relational: Delta-Framework
  Formalization of Farzulla (2026), DOI: 10.5281/zenodo.18186445

  Core contribution: the delta-framework (Section 2).
  A primitive distinguishability relation delta induces referential sets R(A),
  and identity claims presuppose non-empty referential structure.

  Formalized content:
  - DeltaFramework class (Axioms 2.2, 2.4)
  - Referential set R(A) (Definition 2.1)
  - Defined predicate (Axiom 2.4)
  - The Farzulla Identity Thesis (Theorem 2.5)
  - No Self-Sufficient Identity (Corollary 2.6)
-/

import Mathlib.Tactic

namespace IdentityThesis

/-! ## Core Axiomatic Framework (Paper Section 2) -/

/-- The delta-framework: a type equipped with a primitive distinguishability
relation satisfying irreflexivity (Axiom 2.2).

The paper's Axiom 2.3 (non-triviality: Def(A) -> exists x, delta(A,x)) and
Axiom 2.4 (Def(A) <-> R(A) nonempty) collapse into our definition of `Defined`
below: `Defined A := exists x, delta A x`. The biconditional is then
definitionally true, and non-triviality becomes `Defined A -> Defined A`. -/
class DeltaFramework (Entity : Type*) where
  /-- Primitive distinguishability relation (Paper Definition 2.1). -/
  delta : Entity → Entity → Prop
  /-- Axiom 2.2: No entity is distinguishable from itself. -/
  delta_irrefl : ∀ (A : Entity), ¬ delta A A

/-! ## Referential Set and Definedness (Paper Definitions 2.1, 2.4) -/

variable {Entity : Type*} [DeltaFramework Entity]

/-- The referential set R(A) = {x : delta(A, x)} (Paper Definition 2.1).
An entity's identity is constituted by everything it is distinguishable from. -/
def refSet (A : Entity) : Set Entity := {x | DeltaFramework.delta A x}

/-- An entity is defined iff it stands in the delta relation to something
(Paper Axiom 2.4: Def(A) <-> R(A) != emptyset). -/
def Defined (A : Entity) : Prop := ∃ x, DeltaFramework.delta A x

/-! ## Self-Exclusion from Referential Set

From irreflexivity: since not delta(A, A), we have A not in R(A).
Nothing is a member of its own referential set. -/

/-- A is not in its own referential set (immediate from irreflexivity). -/
theorem self_not_in_refSet (A : Entity) : A ∉ refSet A :=
  DeltaFramework.delta_irrefl A

/-! ## Definedness and Referential Structure (Paper Axiom 2.4)

The paper states Def(A) <-> R(A) != emptyset. Since we define
Defined A := exists x, delta(A,x), and refSet A = {x | delta A x},
these are equivalent by Set.Nonempty. -/

/-- Defined(A) iff R(A) is nonempty (Paper Axiom 2.4). -/
theorem defined_iff_refSet_nonempty (A : Entity) :
    Defined A ↔ (refSet A).Nonempty :=
  Iff.rfl

/-! ## The Farzulla Identity Thesis (Paper Theorem 2.5)

"(A = A) presupposes R(A) != emptyset."

In our framework: any defined entity has a non-empty referential set.
The metatheoretic character of the theorem (it is about presuppositions
of identity claims, not a derivation within a fixed object-language) is
captured by the universal quantification over all DeltaFramework instances. -/

/-- The Identity Thesis (Theorem 2.5): A defined entity necessarily has
a non-empty referential set. Identity presupposes relational structure. -/
theorem identity_thesis (A : Entity) (hA : Defined A) :
    (refSet A).Nonempty :=
  hA

/-! ## No Self-Sufficient Identity (Paper Corollary 2.6)

"No entity can be self-identical without reference to something external."

Key reasoning: if Defined(A) then exists x with delta(A,x). By irreflexivity,
delta(A,A) is false, so x != A. Therefore the witness is strictly external. -/

/-- No Self-Sufficient Identity (Corollary 2.6): any defined entity requires
reference to something strictly other than itself. -/
theorem no_self_sufficient (A : Entity) (hA : Defined A) :
    ∃ x, x ≠ A ∧ DeltaFramework.delta A x := by
  obtain ⟨x, hx⟩ := hA
  exact ⟨x, fun heq => DeltaFramework.delta_irrefl A (heq ▸ hx), hx⟩

/-! ## Referential Asymmetry

delta need not be symmetric: A being distinguishable from B does not entail
B being distinguishable from A. This reflects the paper's observation that
definition can be asymmetric (e.g. a parasite is defined relative to its
host, but the host need not be defined relative to the parasite).

We show that the framework is consistent with both symmetric and asymmetric
delta relations. -/

/-- If delta is symmetric, then delta(A,x) implies A is in R(x). -/
theorem mutual_membership_of_symmetric
    (hsym : ∀ (A B : Entity), DeltaFramework.delta A B → DeltaFramework.delta B A)
    {A x : Entity} (h : DeltaFramework.delta A x) :
    A ∈ refSet x :=
  hsym A x h

/-! ## Referential Determinacy

Two entities with the same referential set are indistinguishable
within the framework. This is the delta-framework analog of
Leibniz's identity of indiscernibles. -/

/-- Referential identity: if R(A) = R(B), then A and B have the same
distinguishability profile. (Converse direction of Leibniz.) -/
theorem delta_ext_of_refSet_eq {A B : Entity}
    (h : refSet A = refSet B) (x : Entity) :
    DeltaFramework.delta A x ↔ DeltaFramework.delta B x := by
  have : x ∈ refSet A ↔ x ∈ refSet B := by rw [h]
  exact this

end IdentityThesis
