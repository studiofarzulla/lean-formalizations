/-
  Quantum Statistics from Oscillatory Sampling
  Formalization of Farzulla (2026), DOI: 10.5281/zenodo.18091063

  This file formalizes the interference results from Section 5:
  - Two-path interference formula (Eq. 19)
  - Which-path information destroys interference (Eq. 24)
  - Double-slit pattern (Eq. 22)
  - Structural properties of normSq
-/

import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

namespace QuantumOscillatory

open Complex

/-! ## Section 5.1: Two-Path Interference

Paper Eq. 19: |ψ₁ + ψ₂|² = |ψ₁|² + |ψ₂|² + 2Re(ψ₁* · ψ₂)

where Re(conj(ψ₁) · ψ₂) = ψ₁.re · ψ₂.re + ψ₁.im · ψ₂.im
-/

/-- Two-path interference formula (Paper Eq. 19).
|ψ₁ + ψ₂|² = |ψ₁|² + |ψ₂|² + 2(ψ₁.re·ψ₂.re + ψ₁.im·ψ₂.im) -/
theorem interference_two_path (ψ₁ ψ₂ : ℂ) :
    normSq (ψ₁ + ψ₂) = normSq ψ₁ + normSq ψ₂ +
    2 * (ψ₁.re * ψ₂.re + ψ₁.im * ψ₂.im) := by
  simp only [normSq_apply, add_re, add_im]
  ring

/-- The cross-term in component form equals Re(conj(ψ₁) · ψ₂).
We prove this by expanding conj as (re, -im). -/
theorem cross_term_eq_re_conj_mul (ψ₁ ψ₂ : ℂ) :
    ψ₁.re * ψ₂.re + ψ₁.im * ψ₂.im =
    ((⟨ψ₁.re, -ψ₁.im⟩ : ℂ) * ψ₂).re := by
  simp only [mul_re]
  ring

/-! ## Section 5.3: Which-Path Information

If a measurement determines which path the particle took,
the superposition is replaced by a statistical mixture.
The interference cross-term vanishes.
-/

/-- When the cross-term vanishes, intensities add classically (Paper Eq. 24). -/
theorem no_interference_when_orthogonal (ψ₁ ψ₂ : ℂ)
    (h : ψ₁.re * ψ₂.re + ψ₁.im * ψ₂.im = 0) :
    normSq (ψ₁ + ψ₂) = normSq ψ₁ + normSq ψ₂ := by
  rw [interference_two_path, h, mul_zero, add_zero]

/-! ## Section 4.4-4.5: Structural Properties of Intensity

The Born rule P ∝ |Ψ|² is quadratic. Key structural properties
of normSq that constrain detection statistics.
-/

/-- normSq is non-negative — detection probabilities are non-negative. -/
theorem normSq_nonneg' (z : ℂ) : 0 ≤ normSq z :=
  normSq_nonneg z

/-- normSq is multiplicative — intensity of product = product of intensities. -/
theorem normSq_mul' (z w : ℂ) : normSq (z * w) = normSq z * normSq w :=
  map_mul normSq z w

/-- Zero field gives zero intensity. -/
theorem normSq_zero' : normSq (0 : ℂ) = 0 :=
  map_zero normSq

/-- Conjugation preserves intensity. Proven by component expansion. -/
theorem normSq_conj (z : ℂ) :
    normSq (⟨z.re, -z.im⟩ : ℂ) = normSq z := by
  simp only [normSq_apply]
  ring

/-- Scaling by a real number: |r·z|² = r²·|z|². -/
theorem normSq_real_mul (r : ℝ) (z : ℂ) :
    normSq (↑r * z) = r ^ 2 * normSq z := by
  simp only [normSq_apply, mul_re, mul_im, ofReal_re, ofReal_im,
    zero_mul, sub_zero, add_zero]
  ring

/-! ## Double-Slit: Trigonometric Identity

For the double-slit pattern with equal amplitudes and phase difference δ:
4A²cos²(δ/2) = 2A²(1 + cos δ) (Paper Eq. 22)

This is the half-angle formula that produces the fringe pattern.
-/

/-- The half-angle formula underlying the double-slit pattern (Paper Eq. 22).
4A²cos²(δ/2) = 2A²(1 + cos δ) -/
theorem double_slit_trig (A δ : ℝ) :
    4 * A ^ 2 * Real.cos (δ / 2) ^ 2 = 2 * A ^ 2 * (1 + Real.cos δ) := by
  rw [Real.cos_sq]
  have h : 2 * (δ / 2) = δ := by ring
  rw [h]
  ring

/-- Constructive interference: maxima at δ = 2πn give intensity 4A².
We prove the δ = 0 case (n = 0). -/
theorem constructive_interference (A : ℝ) :
    4 * A ^ 2 * Real.cos (0 / 2) ^ 2 = 4 * A ^ 2 := by
  simp [Real.cos_zero]

/-- Destructive interference: minima at δ = (2n+1)π give intensity 0.
We prove the δ = π case (n = 0). -/
theorem destructive_interference (A : ℝ) :
    4 * A ^ 2 * Real.cos (Real.pi / 2) ^ 2 = 0 := by
  simp [Real.cos_pi_div_two]

end QuantumOscillatory
