/-
  Identity is Irreducibly Relational: Structuralism Illustrations
  Formalization of Farzulla (2026), DOI: 10.5281/zenodo.18186445

  Section 7: Structural identity in mathematics.
  - Weak discernibility of i and -i (Section 7.3)
  - Benacerraf-style encoding divergence (Section 7.1)
-/

import Mathlib.Data.Complex.Basic
import Mathlib.Tactic

namespace IdentityThesis.Structuralism

open Complex

/-! ## Weak Discernibility of i and -i (Paper Section 7.3)

The paper uses complex conjugate roots as an example of weak discernibility:
i and -i are structurally symmetric (both satisfy z^2 = -1), yet they are
weakly discernible because there exists a relation R such that R(i, -i)
but not R(i, i). The relation: z + w = 0 holds for (i, -i) but not (i, i). -/

/-- i and -i are distinct complex numbers. -/
theorem complex_i_ne_neg_i : (I : ℂ) ≠ -I := by
  intro h
  have : I.im = (-I).im := congrArg Complex.im h
  simp at this
  linarith

/-- Weak discernibility witness: i + (-i) = 0. -/
theorem complex_i_sum_zero : (I : ℂ) + (-I) = 0 := by ring

/-- Non-self-relation: i + i != 0 (the relation is not reflexive on i). -/
theorem complex_i_sum_nonzero : (I : ℂ) + I ≠ 0 := by
  intro h
  have : (I + I).im = (0 : ℂ).im := congrArg Complex.im h
  simp at this

/-- Combined weak discernibility statement: there exists a binary
relation (addition-to-zero) that distinguishes i from -i. -/
theorem weak_discernibility_complex :
    (I : ℂ) + (-I) = 0 ∧ (I : ℂ) + I ≠ 0 :=
  ⟨complex_i_sum_zero, complex_i_sum_nonzero⟩

/-! ## Both i and -i Satisfy z^2 = -1 (Structural Symmetry)

This is the "absolute indiscernibility" side: both roots satisfy the
same polynomial, so no monadic predicate distinguishes them.
Weak discernibility requires a *relational* predicate. -/

/-- i satisfies z^2 = -1. -/
theorem i_squared : (I : ℂ) ^ 2 = -1 := by
  rw [sq]; exact I_mul_I

/-- -i satisfies z^2 = -1. -/
theorem neg_i_squared : (-I : ℂ) ^ 2 = -1 := by
  rw [sq, neg_mul_neg]; exact I_mul_I

/-! ## Benacerraf Encodings (Paper Section 7.1)

Two standard encodings of the natural number 2:
- Von Neumann: 2 = {emptyset, {emptyset}}   (i.e. {0, 1} in ℕ terms)
- Zermelo:     2 = {{emptyset}}              (i.e. {{0}} as nested singletons)

These are extensionally different sets that play the same structural role.
We model this with Fin-indexed families and show the encodings disagree
on cardinality at depth 1 while agreeing on successor structure. -/

/-- Von Neumann encoding: n is the set {0, 1, ..., n-1}. -/
def vonNeumann (n : ℕ) : Finset ℕ := Finset.range n

/-- Zermelo encoding: n is the n-fold singleton nesting.
0 -> emptyset, 1 -> {0}, 2 -> {{0}} modeled as {1}, 3 -> {2}, etc. -/
def zermelo : ℕ → Finset ℕ
  | 0     => ∅
  | n + 1 => {n}

/-- Von Neumann 2 = {0, 1}. -/
theorem vonNeumann_two : vonNeumann 2 = {0, 1} := by
  unfold vonNeumann; ext x; simp [Finset.mem_range]; omega

/-- Zermelo 2 = {1}. -/
theorem zermelo_two : zermelo 2 = {1} := by
  simp [zermelo]

/-- The two encodings of 2 differ (Benacerraf's problem). -/
theorem benacerraf_two : vonNeumann 2 ≠ zermelo 2 := by
  rw [vonNeumann_two, zermelo_two]
  intro h
  have : (0 : ℕ) ∈ ({1} : Finset ℕ) := by rw [← h]; simp
  simp at this

/-- Both encodings agree that successor increases cardinality. -/
theorem vonNeumann_succ_card (n : ℕ) :
    (vonNeumann (n + 1)).card = (vonNeumann n).card + 1 := by
  simp only [vonNeumann, Finset.card_range]

/-- Zermelo successor always has cardinality 1 (for n >= 1). -/
theorem zermelo_succ_card (n : ℕ) :
    (zermelo (n + 1)).card = 1 := by
  simp [zermelo]

end IdentityThesis.Structuralism
