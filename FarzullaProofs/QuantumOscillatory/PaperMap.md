# PaperMap: QuantumOscillatory

## Canonical paper
- papers-official/quantum-oscillation/quantum-oscillatory-sampling.tex

## Lean entrypoints
- FarzullaProofs/QuantumOscillatory/Interference.lean

## Theorem ID convention
- Manuscript: THM-<paper-slug>-<section>-<index>
- Lean: matching docstring comment above theorem declaration.

## Bronze mapping
- THM-quantum-bronze-1 (intensity non-negativity) -> `normSq_nonneg'`
- THM-quantum-bronze-2 (intensity multiplicativity) -> `normSq_mul'`
- THM-quantum-bronze-3 (zero field intensity) -> `normSq_zero'`
- THM-quantum-bronze-4 (conjugation invariance) -> `normSq_conj`
- THM-quantum-bronze-5 (real-scaling quadratic law) -> `normSq_real_mul`

## Silver mapping
- THM-quantum-silver-1 (Eq. 19 two-path interference decomposition) -> `interference_two_path`
- THM-quantum-silver-2 (cross-term equals real-conjugate product) -> `cross_term_eq_re_conj_mul`
- THM-quantum-silver-3 (Eq. 24 orthogonal no-interference limit) -> `no_interference_when_orthogonal`
- THM-quantum-silver-4 (Eq. 22 half-angle identity) -> `double_slit_trig`
- THM-quantum-silver-5 (constructive interference case) -> `constructive_interference`
- THM-quantum-silver-6 (destructive interference case) -> `destructive_interference`

## Gold candidate mapping
- THM-quantum-gold-1 (generalized interference decomposition pipeline) -> `interference_two_path`
- THM-quantum-gold-2 (cross-term algebraic witness) -> `cross_term_eq_re_conj_mul`
- THM-quantum-gold-3 (orthogonality-to-classical-addition bridge) -> `no_interference_when_orthogonal`
- THM-quantum-gold-4 (double-slit envelope identity) -> `double_slit_trig`
- THM-quantum-gold-5 (fringe-extrema duality at canonical phases) -> `constructive_interference`
- THM-quantum-gold-6 (fringe-extrema null at odd phase) -> `destructive_interference`

## Assumption tags
- Complex amplitude algebra and norm structure: `A-QO-CPLX`.
- Real trigonometric identities and cosine laws: `A-QO-TRIG`.
- Orthogonality witness condition for classical-addition limit: `A-QO-ORTHO`.

## Claim-level assumptions
- THM-quantum-bronze-1 -> `A-QO-CPLX`
- THM-quantum-bronze-2 -> `A-QO-CPLX`
- THM-quantum-bronze-3 -> `A-QO-CPLX`
- THM-quantum-bronze-4 -> `A-QO-CPLX`
- THM-quantum-bronze-5 -> `A-QO-CPLX`
- THM-quantum-silver-1 -> `A-QO-CPLX`
- THM-quantum-silver-2 -> `A-QO-CPLX`
- THM-quantum-silver-3 -> `A-QO-CPLX`, `A-QO-ORTHO`
- THM-quantum-silver-4 -> `A-QO-TRIG`
- THM-quantum-silver-5 -> `A-QO-TRIG`
- THM-quantum-silver-6 -> `A-QO-TRIG`
- THM-quantum-gold-1 -> `A-QO-CPLX`
- THM-quantum-gold-2 -> `A-QO-CPLX`
- THM-quantum-gold-3 -> `A-QO-CPLX`, `A-QO-ORTHO`
- THM-quantum-gold-4 -> `A-QO-TRIG`
- THM-quantum-gold-5 -> `A-QO-TRIG`
- THM-quantum-gold-6 -> `A-QO-TRIG`

## Falsification boundaries
- If amplitudes are not modeled in standard complex arithmetic, interference decomposition formulas may not transfer.
- The no-interference reduction requires an explicit orthogonality-style zero cross-term witness.
- Double-slit identities here are phase-model specific; empirical fringe claims need additional physical parameter assumptions beyond the current algebraic layer.

## Status
- silver-existing
