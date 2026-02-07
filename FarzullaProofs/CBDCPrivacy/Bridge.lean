import Mathlib
import FarzullaProofs.CBDCPrivacy.Basic

namespace FarzullaProofs.CBDCPrivacy

/-- THM-CBDCPrivacy-silver-1: n-step sequential composition with constant epsilon. -/
def repeatedEpsilon (n : ℕ) (ε : ℝ) : ℝ := (n : ℝ) * ε

/-- THM-CBDCPrivacy-silver-2: Successor-step recurrence for repeated epsilon. -/
theorem repeatedEpsilon_succ (n : ℕ) (ε : ℝ) :
    repeatedEpsilon (n + 1) ε = repeatedEpsilon n ε + ε := by
  unfold repeatedEpsilon
  norm_num
  ring

/-- THM-CBDCPrivacy-silver-3: Repeated epsilon is nonnegative for nonnegative epsilon. -/
theorem repeatedEpsilon_nonneg {n : ℕ} {ε : ℝ} (hε : 0 ≤ ε) :
    0 ≤ repeatedEpsilon n ε := by
  unfold repeatedEpsilon
  positivity

/-- THM-CBDCPrivacy-silver-4: More releases weakly increase cumulative privacy loss. -/
theorem repeatedEpsilon_mono_steps {n m : ℕ} {ε : ℝ}
    (hnm : n ≤ m) (hε : 0 ≤ ε) :
    repeatedEpsilon n ε ≤ repeatedEpsilon m ε := by
  unfold repeatedEpsilon
  have hnmR : (n : ℝ) ≤ (m : ℝ) := by exact_mod_cast hnm
  nlinarith

/-- THM-CBDCPrivacy-silver-5: Two-step composition matches the Bronze composition rule. -/
theorem repeatedEpsilon_two_eq_composed (ε : ℝ) :
    repeatedEpsilon 2 ε = composedEpsilon ε ε := by
  unfold repeatedEpsilon composedEpsilon
  ring

end FarzullaProofs.CBDCPrivacy
