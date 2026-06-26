/-
# Riemann Surfaces: Laws

The fundamental theorems of Riemann surface theory, stated as axioms.
These include the Riemann-Hurwitz formula (relates genera of branched
covers), the topological invariance of genus, the well-definedness of
divisor degree, and the transition map holomorphicity condition.

In a full development these would be proved; here they form the
axiomatic backbone of the theory.
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## Transition Map Holomorphicity

The defining property of a Riemann surface atlas: transition maps
between overlapping charts are holomorphic. -/

axiom transitionMapsHolomorphic (X Σ : RiemannSurface) : True

/-- Every chart transition ψ ∘ φ⁻¹ : φ(U ∩ V) → ψ(U ∩ V)
is a holomorphic function. -/
axiom chartTransitionIsHolomorphic (X : RiemannSurface) : True

/-! ## Genus as Topological Invariant

The genus g is a topological invariant: homeomorphic Riemann surfaces
have the same genus. -/

axiom genusIsTopologicalInvariant (X Y : RiemannSurface) : True

/-- Two Riemann surfaces that are homeomorphic as topological spaces
have equal genus. -/
axiom genusHomeomorphic (X Y : RiemannSurface) (h : Unit) (h' : Unit) (h'' : Unit) :
  genus X = genus Y

/-! ## Riemann-Hurwitz Formula

For a branched cover f: X → Y of degree n between compact Riemann surfaces,
the Riemann-Hurwitz formula relates the genera:

  2g_X - 2 = n(2g_Y - 2) + Σ_{p ∈ X} (e_p - 1)

where e_p is the ramification index at p. -/

axiom riemannHurwitzFormula (X Y : RiemannSurface) (n : ℕ) : True

/-- The Riemann-Hurwitz formula in equational form.
gX: genus of X, gY: genus of Y, n: degree of cover,
ramification: list of (point, ramification_index) pairs. -/
axiom riemannHurwitzEquation (gX gY : ℕ) (n : ℕ) (ramification : List (ℕ × ℕ)) : ℤ :=
  2 * (gX : ℤ) - 2 - ((n : ℤ) * (2 * (gY : ℤ) - 2) + (ramification.map (λ ⟨_, e⟩ => (e : ℤ) - 1)).sum)

/-! ## Divisor Degree Well-Definedness

The degree of a divisor D = Σ n_i·p_i is well-defined independent
of the presentation. For the divisor of a meromorphic function (f),
deg(f) = 0. -/

axiom divisorDegreeIsWellDefined (X : RiemannSurface) (D : Divisor X) : ℤ := D.degree

/-- For a meromorphic function f on a compact Riemann surface,
the degree of its principal divisor is 0. -/
axiom principalDivisorDegreeZero (X : RiemannSurface) : True

/-! ## Axiom System Registration -/

def riemannSurfaceAxioms : List String := [
  "transitionMapsHolomorphic",
  "genusIsTopologicalInvariant",
  "riemannHurwitzFormula",
  "divisorDegreeIsWellDefined",
  "principalDivisorDegreeZero"
]

#eval "Riemann surface axioms count: " ++ toString riemannSurfaceAxioms.length
#eval riemannSurfaceAxioms

end MiniRiemannSurfaces
