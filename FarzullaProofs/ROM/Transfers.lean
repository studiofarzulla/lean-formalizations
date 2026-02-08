import FarzullaProofs.ROM.Advanced
import FarzullaProofs.Common.Transfers

namespace ROM

open FarzullaProofs.Common.Adversarial
open FarzullaProofs.Common.Transfers

/-- ROM observable path under external legitimacy/friction signals. -/
noncomputable def romPath (L F : Nat → ℝ) : Nat → ℝ :=
  fun t => consent_survival (L t) (F t)

/-- Input-independent ROM update that emits the current observable path value. -/
noncomputable def romObservableUpdate (L F : Nat → ℝ) : Update ℝ :=
  fun t _x => romPath L F t

/-- Shifted ROM update aligned with moving-equilibrium recursion. -/
noncomputable def romShiftUpdate (L F : Nat → ℝ) : Update ℝ :=
  fun t _x => romPath L F (t + 1)

/-- THM-rom-transfer-1: Shifted ROM update admits the ROM path as moving equilibrium. -/
theorem rom_movingEquilibrium (L F : Nat → ℝ) :
    movingEquilibrium (romShiftUpdate L F) (romPath L F) := by
  intro t
  rfl

/-- THM-rom-transfer-2: If ROM observable path varies over time, no static equilibrium exists
for the input-independent observable update. -/
theorem rom_no_static_if_path_varies (L F : Nat → ℝ)
    (hVar : ∃ t₁ t₂, romPath L F t₁ ≠ romPath L F t₂) :
    ¬ ∃ x, staticEquilibrium (romObservableUpdate L F) x := by
  exact no_static_of_input_independent_variation
    (romObservableUpdate L F)
    (romPath L F)
    (by intro t x; rfl)
    hVar

/-- THM-rom-transfer-3: ROM path exactly tracks itself with zero chase error. -/
theorem rom_path_boundedChase_zero (L F : Nat → ℝ)
    (d : Discrepancy ℝ) (hEqZero : ∀ a, d a a = 0) :
    boundedChase d 0 (romPath L F) (romPath L F) := by
  exact boundedChase_of_exact_tracking d (romPath L F) hEqZero

/-- THM-rom-transfer-4: Positive discrepancy from target implies dissensus. -/
theorem rom_dissensus_of_positive_discrepancy
    (d : Discrepancy ℝ)
    (hEqZero : ∀ a, d a a = 0)
    (x : Nat → ℝ) (L F : Nat → ℝ)
    (hPos : ∀ t, 0 < d (x t) (romPath L F t)) :
    dissensus x (romPath L F) := by
  exact dissensus_of_positive_discrepancy d hEqZero x (romPath L F) hPos

/-- THM-rom-transfer-5: Under nonnegative legitimacy/friction signals,
ROM path is pointwise nonnegative. -/
theorem romPath_nonneg (L F : Nat → ℝ)
    (hL : ∀ t, 0 ≤ L t) (hF : ∀ t, 0 ≤ F t) :
    ∀ t, 0 ≤ romPath L F t := by
  intro t
  unfold romPath
  exact consent_survival_nonneg (hL t) (hF t)

end ROM
