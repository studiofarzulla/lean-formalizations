import FarzullaProofs.ConsensualSovereignty.Advanced
import FarzullaProofs.Common.Transfers

namespace FarzullaProofs.ConsensualSovereignty

open FarzullaProofs.Common.Adversarial
open FarzullaProofs.Common.Transfers

/-- Consensual-sovereignty observable legitimacy path. -/
noncomputable def consovPath (w₁ w₂ α P : Nat → ℝ) : Nat → ℝ :=
  fun t => legitimacy (w₁ t) (w₂ t) (α t) (P t)

/-- Input-independent observable update for legitimacy path. -/
noncomputable def consovObservableUpdate (w₁ w₂ α P : Nat → ℝ) : Update ℝ :=
  fun t _x => consovPath w₁ w₂ α P t

/-- Shifted update aligned with moving-equilibrium recursion. -/
noncomputable def consovShiftUpdate (w₁ w₂ α P : Nat → ℝ) : Update ℝ :=
  fun t _x => consovPath w₁ w₂ α P (t + 1)

/-- THM-consov-transfer-1:
Shifted legitimacy update admits legitimacy path as moving equilibrium. -/
theorem consov_movingEquilibrium (w₁ w₂ α P : Nat → ℝ) :
    movingEquilibrium (consovShiftUpdate w₁ w₂ α P) (consovPath w₁ w₂ α P) := by
  intro t
  rfl

/-- THM-consov-transfer-2: If legitimacy path varies over time,
there is no global static equilibrium for the observable update. -/
theorem consov_no_static_if_path_varies (w₁ w₂ α P : Nat → ℝ)
    (hVar : ∃ t₁ t₂, consovPath w₁ w₂ α P t₁ ≠ consovPath w₁ w₂ α P t₂) :
    ¬ ∃ x, staticEquilibrium (consovObservableUpdate w₁ w₂ α P) x := by
  exact no_static_of_input_independent_variation
    (consovObservableUpdate w₁ w₂ α P)
    (consovPath w₁ w₂ α P)
    (by intro t x; rfl)
    hVar

/-- THM-consov-transfer-3: Pointwise larger alignment gives pointwise larger legitimacy
when w₁ is pointwise nonnegative. -/
theorem consovPath_mono_alignment
    (w₁ w₂ α₁ α₂ P : Nat → ℝ)
    (hw₁ : ∀ t, 0 ≤ w₁ t)
    (hα : ∀ t, α₁ t ≤ α₂ t) :
    ∀ t, consovPath w₁ w₂ α₁ P t ≤ consovPath w₁ w₂ α₂ P t := by
  intro t
  unfold consovPath
  exact legitimacy_mono_alignment (w₁ t) (w₂ t) (α₁ t) (α₂ t) (P t) (hw₁ t) (hα t)

/-- THM-consov-transfer-4: Positive discrepancy from legitimacy path implies dissensus. -/
theorem consov_dissensus_of_positive_discrepancy
    (d : Discrepancy ℝ)
    (hEqZero : ∀ a, d a a = 0)
    (x : Nat → ℝ) (w₁ w₂ α P : Nat → ℝ)
    (hPos : ∀ t, 0 < d (x t) (consovPath w₁ w₂ α P t)) :
    dissensus x (consovPath w₁ w₂ α P) := by
  exact dissensus_of_positive_discrepancy d hEqZero x (consovPath w₁ w₂ α P) hPos

/-- THM-consov-transfer-5: Legitimacy path exactly tracks itself with zero chase error. -/
theorem consov_path_boundedChase_zero (w₁ w₂ α P : Nat → ℝ)
    (d : Discrepancy ℝ) (hEqZero : ∀ a, d a a = 0) :
    boundedChase d 0 (consovPath w₁ w₂ α P) (consovPath w₁ w₂ α P) := by
  exact boundedChase_of_exact_tracking d (consovPath w₁ w₂ α P) hEqZero

end FarzullaProofs.ConsensualSovereignty
