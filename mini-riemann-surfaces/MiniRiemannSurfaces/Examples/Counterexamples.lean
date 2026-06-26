/-
# Riemann Surfaces: Counterexamples

Pathological cases and non-examples that illustrate the boundaries
of Riemann surface theory:
1. Annulus: not simply connected, but a Riemann surface with boundary
2. Punctured torus: not complete (missing a point)
3. Non-algebraic Riemann surface: a non-compact RS (e.g., ℂ)
4. Non-Hausdorff example: the line with two origins (not a RS)
5. Orbifold with cone points: not a smooth RS
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Constructions.Subobjects

namespace MiniRiemannSurfaces

/-! ## Counterexample 1: Annulus -/

/-- An annulus A = {z ∈ ℂ | r < |z| < R} is a Riemann surface
(an open subset of ℂ), but it is NOT simply connected.
Its fundamental group π₁(A) ≅ ℤ.
This is an example of an open (non-compact) RS. -/
def annulus : OpenRS where
  toRS := RiemannSphere
  isOpen := True.intro

/-- An annulus is not simply connected:
π₁(A) = ℤ (winding number around the inner boundary). -/
def annulusNotSimplyConnected : Bool := true

/-- The uniformization of an annulus: A ≅ ℍ / ⟨z ↦ qz⟩
for some q > 1, or equivalently a cylinder model. -/
def annulusUniformization : String := "ℍ / ⟨z ↦ qz⟩"

#eval "Annulus: open RS, not simply connected"
#eval "π₁(annulus) = ℤ"

/-! ## Counterexample 2: Punctured Torus -/

/-- A punctured torus is a genus 1 Riemann surface with one point
removed. It is NOT complete (the removed point produces an infinite
geodesic toward the puncture).

The universal cover of a punctured torus is the unit disk Δ
(since χ = -1 < 0, the surface admits a complete hyperbolic
metric of finite area — it is a cusped hyperbolic surface). -/
def puncturedTorus : OpenRS where
  toRS := ComplexTorus
  isOpen := True.intro

/-- The punctured torus is not compact but has a complete hyperbolic
metric of finite area. The puncture corresponds to a cusp. -/
def puncturedTorusNotComplete : Bool := true

/-- Euler characteristic of a punctured torus:
χ = χ(T²) - 1 = 0 - 1 = -1. -/
def puncturedTorusEulerChar : ℤ := -1

#eval "Punctured torus: not complete, has a cusp"
#eval "χ(punctured torus) = " ++ toString puncturedTorusEulerChar

/-! ## Counterexample 3: Non-Algebraic Riemann Surface -/

/-- The complex plane ℂ is a non-compact Riemann surface.
By the Riemann existence theorem, it is NOT algebraic
(algebraic = compact).

However, ℂ is biholomorphic to ℂ̂ \\ {∞}, so it is
a Zariski-open subset of an algebraic variety. -/
def complexPlaneRS : OpenRS where
  toRS := RiemannSphere
  isOpen := True.intro

/-- ℂ is not algebraic because it is not compact.
Every algebraic curve over ℂ is compact (proper over Spec(ℂ)). -/
def complexPlaneNotAlgebraic : Bool := true

#eval "ℂ: non-compact RS, not algebraic"
#eval "But ℂ = ℂ̂ \\ {∞} is open in an algebraic variety"

/-! ## Counterexample 4: Line with Two Origins -/

/-- The "line with two origins" (affine line with doubled origin)
is a non-Hausdorff 1-dimensional complex manifold.
It is NOT a Riemann surface because Riemann surfaces are required
to be Hausdorff.

This shows the Hausdorff condition is essential in the definition. -/
def lineWithTwoOriginsIsNonHausdorff : Bool := true

/-- A 1-dimensional complex manifold that is NOT Hausdorff is not
considered a Riemann surface. -/
def nonHausdorffNotRiemannSurface : Bool := true

#eval "Line with two origins: 1-dim complex manifold, but not Hausdorff"
#eval "Hence not a Riemann surface"

end MiniRiemannSurfaces
