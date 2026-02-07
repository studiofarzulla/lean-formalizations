import Mathlib

namespace FarzullaProofs.Common.Adversarial

/-! ## Relational Identity Core -/

/-- Time-indexed relational identity profile. -/
def IdentityProfile (α β : Type) := Nat → α → β → ℝ

/-- Two entities are identical at time `t` iff all relational coordinates match. -/
def identityAt {α β : Type} (ρ : IdentityProfile α β) (t : Nat) (x y : α) : Prop :=
  ∀ b, ρ t x b = ρ t y b

/-- THM-dissensus-id-1: Relational identity is reflexive at every time. -/
theorem identityAt_refl {α β : Type} (ρ : IdentityProfile α β) (t : Nat) (x : α) :
    identityAt ρ t x x := by
  intro b
  rfl

/-- THM-dissensus-id-2: Relational identity is symmetric at every time. -/
theorem identityAt_symm {α β : Type} (ρ : IdentityProfile α β) (t : Nat) {x y : α} :
    identityAt ρ t x y → identityAt ρ t y x := by
  intro h b
  symm
  exact h b

/-- THM-dissensus-id-3: Relational identity is transitive at every time. -/
theorem identityAt_trans {α β : Type} (ρ : IdentityProfile α β) (t : Nat) {x y z : α} :
    identityAt ρ t x y → identityAt ρ t y z → identityAt ρ t x z := by
  intro hxy hyz b
  rw [hxy b, hyz b]

/-- THM-dissensus-id-4: Any relational-profile difference breaks identity at that time. -/
theorem not_identityAt_of_witness_diff {α β : Type}
    (ρ : IdentityProfile α β) (t : Nat) {x y : α}
    (b : β) (h : ρ t x b ≠ ρ t y b) :
    ¬ identityAt ρ t x y := by
  intro hId
  exact h (hId b)

/-- THM-dissensus-id-5: Time-varying relational profiles can force identity change. -/
theorem identity_shift_of_profile_shift {α β : Type}
    (ρ : IdentityProfile α β) (t : Nat) {x y : α}
    (hNow : identityAt ρ t x y)
    (b : β)
    (hNext : ρ (t + 1) x b ≠ ρ (t + 1) y b) :
    identityAt ρ t x y ∧ ¬ identityAt ρ (t + 1) x y := by
  exact ⟨hNow, not_identityAt_of_witness_diff ρ (t + 1) b hNext⟩

/-! ## Moving Equilibrium + Dissensus Dynamics -/

/-- Time-varying update operator. -/
def Update (α : Type) := Nat → α → α

/-- A moving equilibrium path for a nonstationary update rule. -/
def movingEquilibrium {α : Type} (F : Update α) (xStar : Nat → α) : Prop :=
  ∀ t, F t (xStar t) = xStar (t + 1)

/-- Static equilibrium for all times. -/
def staticEquilibrium {α : Type} (F : Update α) (x : α) : Prop :=
  ∀ t, F t x = x

/-- Dissensus trajectory: never exactly at target equilibrium path. -/
def dissensus {α : Type} (x xStar : Nat → α) : Prop :=
  ∀ t, x t ≠ xStar t

/-- THM-dissensus-dyn-1: Static equilibrium implies one-step invariance everywhere. -/
theorem staticEquilibrium_step {α : Type} (F : Update α) (x : α)
    (h : staticEquilibrium F x) :
    ∀ t, F t x = x := h

/-- THM-dissensus-dyn-2: Dissensus is pointwise non-coincidence. -/
theorem dissensus_pointwise {α : Type} (x xStar : Nat → α)
    (h : dissensus x xStar) (t : Nat) :
    x t ≠ xStar t :=
  h t

/-- THM-dissensus-dyn-3: Moving equilibrium gives next-step target recursion. -/
theorem movingEquilibrium_recursion {α : Type} (F : Update α) (xStar : Nat → α)
    (h : movingEquilibrium F xStar) (t : Nat) :
    F t (xStar t) = xStar (t + 1) :=
  h t

/-- THM-dissensus-dyn-4:
If every time-step has no fixed point, no global static equilibrium exists. -/
theorem no_static_equilibrium_of_stepwise_no_fixed {α : Type}
    (F : Update α)
    (hNoFix : ∀ t x, F t x ≠ x) :
    ¬ ∃ x, staticEquilibrium F x := by
  intro h
  rcases h with ⟨x, hx⟩
  exact (hNoFix 0 x) (hx 0)

/-! ## Bounded Chase (moving-target tracking) -/

/-- Nonnegative discrepancy between current state and moving target. -/
def Discrepancy (α : Type) := α → α → ℝ

/-- Bounded chase: tracking error stays under `ε` at all times. -/
def boundedChase {α : Type}
    (d : Discrepancy α) (ε : ℝ) (x xStar : Nat → α) : Prop :=
  ∀ t, d (x t) (xStar t) ≤ ε

/-- THM-dissensus-chase-1: Bounded chase gives a pointwise tracking bound. -/
theorem boundedChase_pointwise {α : Type}
    (d : Discrepancy α) (ε : ℝ) (x xStar : Nat → α)
    (h : boundedChase d ε x xStar) (t : Nat) :
    d (x t) (xStar t) ≤ ε :=
  h t

/-- THM-dissensus-chase-2: Bound monotonicity in epsilon. -/
theorem boundedChase_mono_epsilon {α : Type}
    (d : Discrepancy α) {ε₁ ε₂ : ℝ} (hε : ε₁ ≤ ε₂)
    {x xStar : Nat → α}
    (h : boundedChase d ε₁ x xStar) :
    boundedChase d ε₂ x xStar := by
  intro t
  exact le_trans (h t) hε

/-- THM-dissensus-chase-3: Zero discrepancy everywhere implies bounded chase at 0. -/
theorem boundedChase_zero_of_exact_tracking {α : Type}
    (d : Discrepancy α) (x xStar : Nat → α)
    (h : ∀ t, d (x t) (xStar t) = 0) :
    boundedChase d 0 x xStar := by
  intro t
  rw [h t]

/-- THM-dissensus-chase-4:
If discrepancy is nonnegative, any bounded chase has nonnegative error. -/
theorem discrepancy_nonneg_of_boundedChase {α : Type}
    (d : Discrepancy α)
    (hNonneg : ∀ a b, 0 ≤ d a b)
    {ε : ℝ} {x xStar : Nat → α}
    (_h : boundedChase d ε x xStar) (t : Nat) :
    0 ≤ d (x t) (xStar t) :=
  hNonneg _ _

end FarzullaProofs.Common.Adversarial
