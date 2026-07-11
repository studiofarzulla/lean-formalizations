# RegimeTenure

Canonical source paper:
- papers-official/rom-ethics/legitimacy-carve/main.tex ("When Suppression Fails")

Lean module(s):
- FarzullaProofs/RegimeTenure/Basic.lean

Scope:
- Machine-checked tenure law for the suppression dynamic: survival dichotomy,
  strict tenure positivity, and the comparative statics of T = C₀/b in
  friction, repression intensity, replenishment, reserves, and legitimacy
  (on the gated burden b = γκ(1−L)F − r). Sixteen theorems.
- The file is byte-identical to the paper's companion `RegimeTenure.lean`;
  the stochastic first-passage escape law is verified numerically in the
  paper (`tenure_law_verify.py`), not formalized here.

Tiered depth policy:
- Bronze: definitions + 2+ checked claims
- Silver: core theorem family
- Gold: near-parity for formal core
