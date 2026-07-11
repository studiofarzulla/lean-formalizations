/-
  RegimeTenure.lean — machine-checked tenure law for the suppression dynamic.

  Model: suppression capacity C(t) ≥ 0 drains at net burden b = γκF − r.
  Draining case (b > 0): mean tenure T = C₀ / b = C₀ / (γκF − r).
  Verified analytically here; the stochastic escape law is verified numerically
  (tenure_law_verify.py). Companion to "When Suppression Fails".
-/
import Mathlib

namespace RegimeTenure

/-- Net suppression burden: the rate at which suppression capacity drains. -/
def burden (γ κ F r : ℝ) : ℝ := γ * κ * F - r

/-- Mean tenure of a suppression-dependent regime in the draining case. -/
noncomputable def tenure (C₀ b : ℝ) : ℝ := C₀ / b

/-- Survival dichotomy: if `γκF ≤ r`, the net burden is non-positive — the regime
    is not draining and sustains suppression (no finite tenure). -/
theorem survival_threshold (γ κ F r : ℝ) (h : γ * κ * F ≤ r) :
    burden γ κ F r ≤ 0 := by
  unfold burden; linarith

/-- Conversely, `γκF > r` is exactly the draining regime (positive burden). -/
theorem draining_iff (γ κ F r : ℝ) : 0 < burden γ κ F r ↔ r < γ * κ * F := by
  unfold burden; constructor <;> intro h <;> linarith

/-- Tenure is strictly positive when reserves and burden are positive. -/
theorem tenure_pos (C₀ b : ℝ) (hC : 0 < C₀) (hb : 0 < b) : 0 < tenure C₀ b := by
  unfold tenure; positivity

/-- Core comparative static: tenure strictly DECREASES as the burden grows. -/
theorem tenure_anti_burden (C₀ b₁ b₂ : ℝ) (hC : 0 < C₀) (h1 : 0 < b₁) (h12 : b₁ < b₂) :
    tenure C₀ b₂ < tenure C₀ b₁ := by
  unfold tenure
  gcongr

/-- The burden strictly increases in friction `F` when suppression has positive
    unit cost (`γκ > 0`). -/
theorem burden_mono_friction (γ κ r F₁ F₂ : ℝ) (hγκ : 0 < γ * κ) (h : F₁ < F₂) :
    burden γ κ F₁ r < burden γ κ F₂ r := by
  unfold burden
  have : γ * κ * F₁ < γ * κ * F₂ := by nlinarith
  linarith

/-- ∂T/∂F < 0 : tenure strictly DECREASES in friction — friction is the order
    parameter that shortens regime tenure. -/
theorem tenure_anti_friction (C₀ γ κ r F₁ F₂ : ℝ)
    (hC : 0 < C₀) (hγκ : 0 < γ * κ) (hpos : 0 < burden γ κ F₁ r) (h : F₁ < F₂) :
    tenure C₀ (burden γ κ F₂ r) < tenure C₀ (burden γ κ F₁ r) :=
  tenure_anti_burden C₀ _ _ hC hpos (burden_mono_friction γ κ r F₁ F₂ hγκ h)

/-- ∂T/∂r > 0 : tenure strictly INCREASES in replenishment — resource rents and
    external backing buy tenure. (Higher `r` lowers the burden, lengthening tenure.) -/
theorem tenure_mono_replenishment (C₀ γ κ F r₁ r₂ : ℝ)
    (hC : 0 < C₀) (hpos : 0 < burden γ κ F r₂) (h : r₁ < r₂) :
    tenure C₀ (burden γ κ F r₁) < tenure C₀ (burden γ κ F r₂) := by
  apply tenure_anti_burden C₀ (burden γ κ F r₂) (burden γ κ F r₁) hC hpos
  unfold burden; linarith

/-- ∂T/∂κ < 0 : tenure strictly DECREASES in suppression intensity (γ, F > 0). -/
theorem tenure_anti_intensity (C₀ γ F r κ₁ κ₂ : ℝ)
    (hC : 0 < C₀) (hγ : 0 < γ) (hF : 0 < F) (hpos : 0 < burden γ κ₁ F r) (h : κ₁ < κ₂) :
    tenure C₀ (burden γ κ₂ F r) < tenure C₀ (burden γ κ₁ F r) := by
  apply tenure_anti_burden C₀ _ _ hC hpos
  unfold burden
  have : γ * κ₁ * F < γ * κ₂ * F := by
    nlinarith [mul_pos (mul_pos hγ hF) (sub_pos.mpr h)]
  linarith

/-- ∂T/∂C₀ > 0 : larger reserves give longer tenure (fixed positive burden). -/
theorem tenure_mono_reserves (C₁ C₂ b : ℝ) (hb : 0 < b) (h : C₁ < C₂) :
    tenure C₁ b < tenure C₂ b := by
  unfold tenure
  gcongr

/-! ### Legitimacy coupling: a legitimate regime suppresses less.

A regime accommodates the fraction `L` of its friction through proportional voice
and must suppress only the un-accommodated remainder `(1-L)F`. Legitimacy `L ∈ [0,1]`
therefore enters the burden, and lengthens tenure. -/

/-- Burden with legitimacy coupling: only `(1-L)F` reaches the suppression ledger. -/
def burdenL (γ κ L F r : ℝ) : ℝ := γ * κ * (1 - L) * F - r

/-- A fully legitimate regime (`L = 1`) suppresses nothing: its burden is `-r ≤ 0`,
    so (for `r ≥ 0`) it never exhausts capacity. -/
theorem full_legitimacy_no_drain (γ κ F r : ℝ) (hr : 0 ≤ r) :
    burdenL γ κ 1 F r ≤ 0 := by
  unfold burdenL; simp; linarith

/-- Legitimacy strictly lowers the burden (more voice → less to suppress), when
    `γκF > 0`. -/
theorem burden_anti_legitimacy (γ κ F r L₁ L₂ : ℝ) (hγκF : 0 < γ * κ * F) (h : L₁ < L₂) :
    burdenL γ κ L₂ F r < burdenL γ κ L₁ F r := by
  unfold burdenL
  nlinarith [mul_pos hγκF (sub_pos.mpr h)]

/-- ∂T/∂L > 0 : legitimacy strictly LENGTHENS tenure — the load-bearing coupling
    that makes legitimacy do dynamical work. -/
theorem tenure_mono_legitimacy (C₀ γ κ F r L₁ L₂ : ℝ)
    (hC : 0 < C₀) (hγκF : 0 < γ * κ * F) (hpos : 0 < burdenL γ κ L₂ F r) (h : L₁ < L₂) :
    tenure C₀ (burdenL γ κ L₁ F r) < tenure C₀ (burdenL γ κ L₂ F r) :=
  tenure_anti_burden C₀ (burdenL γ κ L₂ F r) (burdenL γ κ L₁ F r) hC hpos
    (burden_anti_legitimacy γ κ F r L₁ L₂ hγκF h)

/-- The un-gated burden is the `L = 0` slice of the coupled burden. -/
theorem burden_eq_burdenL_zero (γ κ F r : ℝ) : burden γ κ F r = burdenL γ κ 0 F r := by
  unfold burden burdenL; ring

/-- The friction/replenishment comparative statics hold on the COUPLED burden too,
    so the paper's stated statics are literally about `burdenL`. -/
theorem burdenL_mono_friction (γ κ L r F₁ F₂ : ℝ) (hc : 0 < γ * κ * (1 - L)) (h : F₁ < F₂) :
    burdenL γ κ L F₁ r < burdenL γ κ L F₂ r := by
  unfold burdenL; nlinarith [mul_pos hc (sub_pos.mpr h)]

/-- ∂T/∂F < 0 on the coupled burden (friction shortens tenure, legitimacy-gated). -/
theorem tenure_anti_friction_L (C₀ γ κ L r F₁ F₂ : ℝ)
    (hC : 0 < C₀) (hc : 0 < γ * κ * (1 - L)) (hpos : 0 < burdenL γ κ L F₁ r) (h : F₁ < F₂) :
    tenure C₀ (burdenL γ κ L F₂ r) < tenure C₀ (burdenL γ κ L F₁ r) :=
  tenure_anti_burden C₀ _ _ hC hpos (burdenL_mono_friction γ κ L r F₁ F₂ hc h)

/-- ∂T/∂r > 0 on the coupled burden (replenishment lengthens tenure). -/
theorem tenure_mono_replenishment_L (C₀ γ κ L F r₁ r₂ : ℝ)
    (hC : 0 < C₀) (hpos : 0 < burdenL γ κ L F r₂) (h : r₁ < r₂) :
    tenure C₀ (burdenL γ κ L F r₁) < tenure C₀ (burdenL γ κ L F r₂) := by
  apply tenure_anti_burden C₀ (burdenL γ κ L F r₂) (burdenL γ κ L F r₁) hC hpos
  unfold burdenL; linarith

end RegimeTenure
