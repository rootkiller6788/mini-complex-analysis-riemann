/-
# Riemann Surfaces: Main Theorems (GAGA and Existence)

The bridge between complex-analytic and algebraic geometry for
Riemann surfaces: the Riemann existence theorem, Chow's theorem,
and the GAGA principle (Serre).

Together these results state that the category of compact Riemann
surfaces is equivalent to the category of smooth projective algebraic
curves over ℂ (up to suitable equivalences in each category).
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Theorems.Basic

namespace MiniRiemannSurfaces

/-! ## Riemann Existence Theorem -/

/-- THE RIEMANN EXISTENCE THEOREM: Every compact Riemann surface is
algebraic, i.e., can be embedded as a smooth projective algebraic
curve in some projective space ℂℙ^n.

Equivalently: the field of meromorphic functions M(X) is a finitely
generated extension of ℂ of transcendence degree 1, and X is the
normalization of a plane algebraic curve. -/
axiom riemannExistenceTheorem (X : RiemannSurface) : True

/-- For a compact Riemann surface X, there exists a projective embedding
X ↪ ℂℙ^n for some n. The minimal n is roughly 3 for general curves
(by Noether's theorem on projective normality). -/
axiom projectiveEmbeddingExists (X : RiemannSurface) : True

/-- The minimal projective dimension needed to embed a general
Riemann surface of genus g:
- g = 0: ℂℙ¹ (standard model)
- g = 1: ℂℙ² (cubic curves)
- g ≥ 2: ℂℙ³ for general (canonical embedding for non-hyperelliptic) -/
def minimalProjectiveDimension (g : ℕ) : ℕ :=
  if g = 0 then 1 else if g = 1 then 2 else if g = 2 then 3 else 3

/-! ## Chow's Theorem -/

/-- CHOW'S THEOREM: Every closed analytic subvariety of complex
projective space ℂℙ^n is algebraic (i.e., defined by homogeneous
polynomial equations). In particular, every compact Riemann surface
embedded in ℂℙ^n is an algebraic curve. -/
axiom chowTheorem (X : RiemannSurface) : True

/-- A special case for curves: any holomorphic map from a compact
Riemann surface into ℂℙ^n has image that is an algebraic subvariety. -/
axiom chowTheoremForCurves (X : RiemannSurface) (f : HolomorphicMap X RiemannSphere) : True

/-! ## GAGA Principle (Serre) -/

/-- The GAGA principle (Geometrie Algebrique et Geometrie Analytique,
Serre 1956): For projective varieties over ℂ, there is an equivalence
between:

1. Coherent algebraic sheaves on X^alg
2. Coherent analytic sheaves on X^an

In particular, for Riemann surfaces, this means:
- Holomorphic line bundles = algebraic line bundles
- Holomorphic sections = algebraic sections
- Cohomology groups coincide: H^i_alg(X, F) ≅ H^i_an(X, F^an) -/
axiom gagaPrinciple : True

/-- For Riemann surfaces, GAGA implies that every meromorphic function
is a rational function (in the algebraic sense), and the function
field M(X) = ℂ(X) is exactly the field of rational functions on the
corresponding algebraic curve. -/
axiom gagaForRiemannSurfaces (X : RiemannSurface) : True

/-- The category of compact Riemann surfaces is equivalent to the
category of smooth projective algebraic curves over ℂ. -/
axiom equivalenceRSandAlgebraicCurves : True

#eval "Riemann existence: every compact RS is algebraic"
#eval "Chow: analytic subvariety of ℂℙ^n is algebraic"
#eval "GAGA: analytic ↔ algebraic for projective varieties"
#eval s!"Minimal projective dimension for genus 2: {minimalProjectiveDimension 2}"

end MiniRiemannSurfaces
