import FarzullaProofs.Common.Adversarial

namespace FarzullaProofs.Common.Transfers

open FarzullaProofs.Common.Adversarial

/-- Assumption bundle for nonstationary systems with no pointwise fixed point. -/
structure NoFixedPointSystem (α : Type) where
  F : Update α
  noFixed : ∀ t x, F t x ≠ x

/-- THM-transfer-1: Any no-fixed-point system has no global static equilibrium. -/
theorem no_static_of_NoFixedPointSystem {α : Type} (S : NoFixedPointSystem α) :
    ¬ ∃ x, staticEquilibrium S.F x :=
  no_static_equilibrium_of_stepwise_no_fixed S.F S.noFixed

/-- THM-transfer-2: If discrepancy is positive at all times and vanishes on equality,
then dissensus holds. -/
theorem dissensus_of_positive_discrepancy {α : Type}
    (d : Discrepancy α)
    (hEqZero : ∀ a, d a a = 0)
    (x xStar : Nat → α)
    (hPos : ∀ t, 0 < d (x t) (xStar t)) :
    dissensus x xStar := by
  intro t hEq
  have h0 : d (x t) (xStar t) = 0 := by simpa [hEq] using hEqZero (x t)
  exact (lt_irrefl (0 : ℝ)) (h0 ▸ hPos t)

/-- THM-transfer-3: Input-independent nonstationarity excludes static equilibrium. -/
theorem no_static_of_input_independent_variation {α : Type}
    (F : Update α) (g : Nat → α)
    (hIndep : ∀ t x, F t x = g t)
    (hVar : ∃ t₁ t₂, g t₁ ≠ g t₂) :
    ¬ ∃ x, staticEquilibrium F x := by
  intro h
  rcases h with ⟨x, hx⟩
  rcases hVar with ⟨t₁, t₂, hNe⟩
  have hg1 : g t₁ = x := by
    calc
      g t₁ = F t₁ x := (hIndep t₁ x).symm
      _ = x := hx t₁
  have hg2 : g t₂ = x := by
    calc
      g t₂ = F t₂ x := (hIndep t₂ x).symm
      _ = x := hx t₂
  exact hNe (hg1.trans hg2.symm)

/-- THM-transfer-4: Exact tracking instantiates bounded chase at epsilon zero. -/
theorem boundedChase_of_exact_tracking {α : Type}
    (d : Discrepancy α) (xStar : Nat → α)
    (hEqZero : ∀ a, d a a = 0) :
    boundedChase d 0 xStar xStar := by
  exact boundedChase_zero_of_exact_tracking d xStar xStar (fun t => hEqZero (xStar t))

/-- THM-transfer-5: Any bounded chase can be relaxed to a larger tolerance. -/
theorem boundedChase_relax {α : Type}
    (d : Discrepancy α) {ε₁ ε₂ : ℝ} (hε : ε₁ ≤ ε₂)
    {x xStar : Nat → α} (h : boundedChase d ε₁ x xStar) :
    boundedChase d ε₂ x xStar :=
  boundedChase_mono_epsilon d hε h

end FarzullaProofs.Common.Transfers
