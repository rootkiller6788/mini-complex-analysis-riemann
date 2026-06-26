/-
# Riemann Surfaces: Object Registration

Registers Riemann surface types with the kernel Object system and
defines derived structures: the divisor group, the Picard group
(preview), and the Jacobian variety (preview).

The Jacobian Jac(X) = ℂ^g / Λ is a g-dimensional complex torus
parametrizing degree-0 divisor classes on a genus g Riemann surface.
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## RiemannSurface as Object -/

/-- Register RiemannSurface as a kernel Object. -/
instance riemannSurfaceObject : Object RiemannSurface where
  theory := TheoryName.ofString "MiniRiemannSurfaces.Core"
  objName := "RiemannSurface"
  repr X := s!"RiemannSurface(genus={genus X})"

/-! ## Divisor Group -/

/-- The divisor group Div(X) is the free abelian group on points of X.
Divisors form an additive abelian group under pointwise addition. -/
def DivisorGroup (X : RiemannSurface) : Type := List (X.carrier × ℤ)

/-- Object instance for the divisor group. -/
instance divisorGroupObject (X : RiemannSurface) : Object (DivisorGroup X) where
  theory := TheoryName.ofString "MiniRiemannSurfaces.Core.DivisorGroup"
  objName := s!"DivisorGroup({genus X})"
  repr D := s!"Div(X)"

/-! ## Picard Group (Preview) -/

/-- The Picard group Pic(X) = Div(X) / PDiv(X) is the group of divisor
classes modulo principal divisors. Pic^0(X) ≅ Jac(X) for compact RS. -/
structure PicardGroup (X : RiemannSurface) where
  divisorClasses : Type
  degree0Subgroup : Type
  deriving Repr

/-! ## Jacobian Variety (Preview) -/

/-- The Jacobian variety Jac(X) = ℂ^g / Λ_X where Λ_X is the period
lattice. Jac(X) is a g-dimensional complex torus parametrizing
degree-0 line bundles (or divisor classes) on X. -/
structure JacobianVariety (X : RiemannSurface) where
  dimension : ℕ := genus X
  periodLattice : String := "Λ_X" -- placeholder
  deriving Repr

/-- For a genus g Riemann surface, the Jacobian is a g-dimensional
compact complex torus. -/
def jacobianDimension (X : RiemannSurface) : ℕ := genus X

/-! ## Theory Registration -/

/-- All Riemann surface theory objects. -/
def riemannSurfaceObjects : List String := [
  "RiemannSurface",
  "DivisorGroup",
  "PicardGroup",
  "JacobianVariety",
  "MeromorphicDifferential"
]

/-- Axioms associated with the theory. -/
def riemannSurfaceTheoryAxioms : List String := [
  "transitionMapsHolomorphic",
  "genusIsTopologicalInvariant",
  "riemannHurwitzFormula",
  "divisorDegreeIsWellDefined"
]

#eval "Riemann surface objects registered: " ++ toString riemannSurfaceObjects.length
#eval "Riemann surface objects:"
#eval riemannSurfaceObjects

end MiniRiemannSurfaces
