import Mathlib

namespace FarzullaProofs.Common.Relations

/-- THM-common-rel-1: Reflexive closure always relates an element to itself. -/
def reflClosure {α : Type} (r : α → α → Prop) : α → α → Prop := fun a b => a = b ∨ r a b

/-- THM-common-rel-2: Reflexive closure is reflexive. -/
theorem reflClosure_refl {α : Type} (r : α → α → Prop) (a : α) : reflClosure r a a := by
  left
  rfl

end FarzullaProofs.Common.Relations
