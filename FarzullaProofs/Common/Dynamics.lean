import Mathlib

namespace FarzullaProofs.Common.Dynamics

/-- THM-common-dyn-1: Constant trajectories are equal at adjacent times. -/
def constTraj (x : α) (_t : Nat) : α := x

/-- THM-common-dyn-2: Constant trajectory value at 0 equals value at t. -/
theorem constTraj_eq (x : α) (t : Nat) : constTraj x 0 = constTraj x t := by
  rfl

end FarzullaProofs.Common.Dynamics
