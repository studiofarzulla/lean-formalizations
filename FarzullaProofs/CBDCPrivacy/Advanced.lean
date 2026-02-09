import Mathlib
import FarzullaProofs.CBDCPrivacy.Bridge

namespace FarzullaProofs.CBDCPrivacy

/-- THM-CBDCPrivacy-gold-1: Zero-step composition yields zero privacy loss. -/
theorem repeatedEpsilon_zero (ε : ℝ) : repeatedEpsilon 0 ε = 0 := by
  unfold repeatedEpsilon
  simp

/-- THM-CBDCPrivacy-gold-2: Addition in epsilon argument distributes over repetition. -/
theorem repeatedEpsilon_add_eps (n : ℕ) (ε₁ ε₂ : ℝ) :
    repeatedEpsilon n (ε₁ + ε₂) = repeatedEpsilon n ε₁ + repeatedEpsilon n ε₂ := by
  unfold repeatedEpsilon
  ring

/-- THM-CBDCPrivacy-gold-3: Repeated composition is additive in step count. -/
theorem repeatedEpsilon_add_steps (n m : ℕ) (ε : ℝ) :
    repeatedEpsilon (n + m) ε = repeatedEpsilon n ε + repeatedEpsilon m ε := by
  unfold repeatedEpsilon
  norm_num
  ring

/-- THM-CBDCPrivacy-gold-4: Composed epsilon equals two-step repeated epsilon. -/
theorem composedEpsilon_eq_repeated_two (ε₁ ε₂ : ℝ) :
    composedEpsilon ε₁ ε₂ = repeatedEpsilon 2 ((ε₁ + ε₂) / 2) := by
  unfold composedEpsilon repeatedEpsilon
  ring

end FarzullaProofs.CBDCPrivacy
