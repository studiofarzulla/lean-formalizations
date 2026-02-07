import Mathlib

namespace FarzullaProofs.CBDCPrivacy

/-- THM-CBDCPrivacy-bronze-1: Sequential privacy composition (epsilon accounting). -/
def composedEpsilon (ε₁ ε₂ : ℝ) : ℝ := ε₁ + ε₂

/-- THM-CBDCPrivacy-bronze-2: Composition preserves nonnegativity. -/
theorem composedEpsilon_nonneg {ε₁ ε₂ : ℝ} (h₁ : 0 ≤ ε₁) (h₂ : 0 ≤ ε₂) :
    0 ≤ composedEpsilon ε₁ ε₂ := by
  unfold composedEpsilon
  nlinarith

/-- THM-CBDCPrivacy-bronze-3: Composition is commutative. -/
theorem composedEpsilon_comm (ε₁ ε₂ : ℝ) :
    composedEpsilon ε₁ ε₂ = composedEpsilon ε₂ ε₁ := by
  unfold composedEpsilon
  ring

/-- THM-CBDCPrivacy-bronze-4: Monotonicity in the first privacy budget term. -/
theorem composedEpsilon_mono_left {ε₁ ε₁' ε₂ : ℝ} (h : ε₁ ≤ ε₁') :
    composedEpsilon ε₁ ε₂ ≤ composedEpsilon ε₁' ε₂ := by
  unfold composedEpsilon
  nlinarith

end FarzullaProofs.CBDCPrivacy
