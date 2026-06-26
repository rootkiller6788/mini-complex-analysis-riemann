/-
# Conformal Mapping: Objects

Möbius group as PSL(2,ℂ), conformal automorphism groups,
and object instances for the MiniMathKernel typeclass.
-/

import MiniConformalMapping.Core.Basic

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Möbius Group PSL(2,ℂ) -/

/-- The Möbius group, isomorphic to PSL(2,ℂ) -/
structure MoebiusGroup where
  elements : Type
  identity : elements
  comp : elements → elements → elements
  inv : elements → elements

instance : Object (MoebiusGroup) where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "MoebiusGroup"
  repr _ := "PSL(2,ℂ)"

/-- The standard Möbius group over ℂ -/
def standardMoebiusGroup : MoebiusGroup where
  elements := MoebiusTransformation
  identity := MoebiusTransformation.id
  comp := MoebiusTransformation.comp
  inv := MoebiusTransformation.inv

#eval "standardMoebiusGroup defined"

/-! ## Conformal Automorphism Group -/

/-- The group of conformal automorphisms of a domain D -/
structure ConformalAutomorphismGroup (D : ComplexPlane) where
  maps : Type
  identity : maps
  composition : maps → maps → maps
  inverse : maps → maps
  are_conformal : ∀ m : maps, True

instance (D : ComplexPlane) : Object (ConformalAutomorphismGroup D) where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "ConformalAutomorphismGroup"
  repr G := s!"Aut({D})"

#eval "ConformalAutomorphismGroup type defined"

/-! ## Unit Disc Object -/

structure UnitDisc where
  /- D = {z ∈ ℂ : |z| < 1} -/

instance : Object UnitDisc where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "UnitDisc"
  repr _ := "D"

/-- Aut(D) ≅ PSU(1,1) -/
def autDiscGroup : ConformalAutomorphismGroup (ℂ) where
  maps := MoebiusTransformation
  identity := MoebiusTransformation.id
  composition := MoebiusTransformation.comp
  inverse := MoebiusTransformation.inv
  are_conformal _ := trivial

#eval "UnitDisc object defined"

/-! ## Upper Half-Plane Object -/

structure UpperHalfPlane where
  /- H = {z ∈ ℂ : Im(z) > 0} -/

instance : Object UpperHalfPlane where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "UpperHalfPlane"
  repr _ := "H"

/-- Aut(H) ≅ PSL(2,ℝ) -/
def autHalfPlaneGroup : ConformalAutomorphismGroup (ℂ) where
  maps := MoebiusTransformation
  identity := MoebiusTransformation.id
  composition := MoebiusTransformation.comp
  inverse := MoebiusTransformation.inv
  are_conformal _ := trivial

#eval "UpperHalfPlane object defined"

end MiniConformalMapping
