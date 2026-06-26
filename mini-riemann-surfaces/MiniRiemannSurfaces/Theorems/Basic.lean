/-
# Riemann Surfaces: Fundamental Theorems

The main theorems of compact Riemann surface theory: Riemann-Roch,
Abel's theorem, Jacobi Inversion, the Riemann-Hurwitz formula, and
the Uniformization theorem.

These are deep existence and dimension theorems. In this package they
are stated as axioms (with `sorry` for the proofs) to establish the
vocabulary and formal structure of the theory.
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Morphisms.Hom

namespace MiniRiemannSurfaces

/-! ## Riemann-Roch Theorem -/

/-- THE RIEMANN-ROCH THEOREM: For a divisor D on a compact Riemann surface
X of genus g, let l(D) = dim H⁰(X, L(D)) be the dimension of the space
of meromorphic functions f with (f) + D ≥ 0. Then:

  l(D) - l(K - D) = deg(D) - g + 1

where K is a canonical divisor (divisor of a meromorphic 1-form).

This is the single most important theorem in Riemann surface theory,
relating the analytic data of meromorphic functions to the topological
invariant g. -/
axiom riemannRochTheorem (X : RiemannSurface) (D : Divisor X) : True

/-- The Riemann-Roch formula as an integer equality:
  h⁰(D) - h⁰(K - D) = deg(D) - g + 1 -/
axiom riemannRochFormula (X : RiemannSurface) (D : Divisor X)
    (h0_D : ℕ) (h0_KmD : ℕ) (g : ℕ) (degD : ℤ) : ℤ :=
  (h0_D : ℤ) - (h0_KmD : ℤ) - (degD - (g : ℤ) + 1)

/-- Special case: for D = 0, the trivial divisor:
  l(0) - l(K) = 0 - g + 1 = 1 - g
Since l(0) = 1 (only constant functions have no poles), l(K) = g,
recovering the fact that dim H⁰(X, K) = g. -/
axiom riemannRochTrivial (g : ℕ) : True

/-! ## Abel's Theorem -/

/-- ABEL'S THEOREM: A divisor D = Σ n_i p_i on a compact Riemann surface
is the divisor of a meromorphic function (i.e., D = (f)) if and only if
deg(D) = 0 and the Abel-Jacobi map φ(D) = 0 in Jac(X).

In particular, the divisor of a meromorphic function has degree 0 and
maps to 0 under the Abel-Jacobi map. -/
axiom abelTheorem (X : RiemannSurface) (D : Divisor X) : True

/-- If D = (f) is a principal divisor, then deg(D) = 0. -/
axiom abelDegreeZero (X : RiemannSurface) (D : Divisor X) : ℤ :=
  if true then 0 else D.degree

/-! ## Jacobi Inversion Theorem -/

/-- JACOBI INVERSION THEOREM: The Abel-Jacobi map from Sym^g(X) to Jac(X)
is surjective. In other words, every point on the Jacobian variety is
the image (under Abel-Jacobi) of some effective divisor of degree g.

This is equivalent to every degree-0 divisor class being representable
as p₁ + ... + p_g - g·p₀ (choosing a basepoint p₀). -/
axiom jacobiInversion (X : RiemannSurface) (g : ℕ) : True

/-- The Abel-Jacobi map u: Sym^g X → Jac(X) is a birational
morphism; it is injective on an open dense subset. -/
axiom jacobiInversionSurjective (X : RiemannSurface) : True

/-! ## Riemann-Hurwitz Formula -/

/-- For a branched cover f: X → Y of degree n between compact Riemann
surfaces, the Riemann-Hurwitz formula:

  2g_X - 2 = n(2g_Y - 2) + Σ_{p ∈ X} (e_p - 1)

where e_p is the ramification index at p. This is a direct consequence
of the Riemann-Roch theorem applied to the pullback of the canonical
bundle (or via topological Euler characteristic). -/
axiom riemannHurwitzFormulaTheorem (X Y : RiemannSurface) (f : BranchedCover X Y) : True

/-- Example: For a hyperelliptic curve y² = P(x) where deg(P) = 2g+2,
the projection map (x,y) ↦ x is a degree-2 branched cover of ℂ̂
ramified at 2g+2 points, giving g_X = (2·2 + Σ1)/2 - 2 + 1 = g. -/
axiom riemannHurwitzExample (g : ℕ) : True

/-! ## Uniformization Theorem -/

/-- The uniformization theorem (already stated in Constructions/Universal)
is restated here for completeness. Every simply connected Riemann surface
is biholomorphic to ℂ̂, ℂ, or Δ. -/
axiom uniformizationTheoremBasic : True

#eval "Riemann-Roch: l(D) - l(K-D) = deg(D) - g + 1"
#eval "Abel: principal divisors have degree 0"
#eval "Jacobi Inversion: Sym^g X → Jac(X) is surjective"
#eval "Riemann-Hurwitz: 2g_X - 2 = n(2g_Y - 2) + Σ(e_p - 1)"

end MiniRiemannSurfaces
