import FarzullaProofs.AxiomOfConsent.Advanced
import FarzullaProofs.Common.Transfers

namespace AxiomOfConsent

open FarzullaProofs.Common.Adversarial
open FarzullaProofs.Common.Transfers

/-- AoC observable path under time-varying parameters. -/
noncomputable def aocPath (σ α ε : Nat → ℝ) : Nat → ℝ :=
  fun t => friction (σ t) (α t) (ε t)

/-- Input-independent AoC observable update. -/
noncomputable def aocObservableUpdate (σ α ε : Nat → ℝ) : Update ℝ :=
  fun t _x => aocPath σ α ε t

/-- Shifted AoC update aligned to moving-equilibrium recursion. -/
noncomputable def aocShiftUpdate (σ α ε : Nat → ℝ) : Update ℝ :=
  fun t _x => aocPath σ α ε (t + 1)

/-- THM-aoc-transfer-1: Shifted AoC update admits the AoC path as moving equilibrium. -/
theorem aoc_movingEquilibrium (σ α ε : Nat → ℝ) :
    movingEquilibrium (aocShiftUpdate σ α ε) (aocPath σ α ε) := by
  intro t
  rfl

/-- THM-aoc-transfer-2: If AoC path varies over time,
there is no global static equilibrium for the observable update. -/
theorem aoc_no_static_if_path_varies (σ α ε : Nat → ℝ)
    (hVar : ∃ t₁ t₂, aocPath σ α ε t₁ ≠ aocPath σ α ε t₂) :
    ¬ ∃ x, staticEquilibrium (aocObservableUpdate σ α ε) x := by
  exact no_static_of_input_independent_variation
    (aocObservableUpdate σ α ε)
    (aocPath σ α ε)
    (by intro t x; rfl)
    hVar

/-- THM-aoc-transfer-3: AoC path is pointwise nonnegative under valid parameter bounds. -/
theorem aocPath_nonneg (σ α ε : Nat → ℝ)
    (hσ : ∀ t, 0 ≤ σ t)
    (hα : ∀ t, -1 < α t)
    (hε : ∀ t, 0 ≤ ε t) :
    ∀ t, 0 ≤ aocPath σ α ε t := by
  intro t
  unfold aocPath
  exact friction_nonneg (hσ t) (hα t) (hε t)

/-- THM-aoc-transfer-4: Positive discrepancy from AoC path implies dissensus. -/
theorem aoc_dissensus_of_positive_discrepancy
    (d : Discrepancy ℝ)
    (hEqZero : ∀ a, d a a = 0)
    (x : Nat → ℝ) (σ α ε : Nat → ℝ)
    (hPos : ∀ t, 0 < d (x t) (aocPath σ α ε t)) :
    dissensus x (aocPath σ α ε) := by
  exact dissensus_of_positive_discrepancy d hEqZero x (aocPath σ α ε) hPos

/-- THM-aoc-transfer-5: AoC path exactly tracks itself with zero chase error. -/
theorem aoc_path_boundedChase_zero (σ α ε : Nat → ℝ)
    (d : Discrepancy ℝ) (hEqZero : ∀ a, d a a = 0) :
    boundedChase d 0 (aocPath σ α ε) (aocPath σ α ε) := by
  exact boundedChase_of_exact_tracking d (aocPath σ α ε) hEqZero

end AxiomOfConsent
