/-
# Conformal Mapping: Subobjects

Simply connected domains, multiply connected domains,
annuli as doubly connected domains, conformal modulus.
-/

import MiniConformalMapping.Core.Basic

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Simply Connected Domain -/

/-- A simply connected domain in ℂ -/
structure SimplyConnectedDomain where
  carrier : Type  -- subset of ℂ
  open : Prop
  connected : Prop
  simplyConnected : Prop
  proper : Prop  -- proper subset of ℂ

instance : Object SimplyConnectedDomain where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "SimplyConnectedDomain"
  repr _ := "D ⊊ ℂ, π₁=0"

/-- The unit disc is a simply connected domain -/
def unitDiscAsSCD : SimplyConnectedDomain where
  carrier := ℂ
  open := trivial
  connected := trivial
  simplyConnected := trivial
  proper := trivial

#eval "SimplyConnectedDomain defined"

/-! ## Multiply Connected Domain -/

/-- A multiply connected domain with n holes -/
structure MultiplyConnectedDomain where
  n_holes : ℕ
  domain_description : String

instance : Object MultiplyConnectedDomain where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "MultiplyConnectedDomain"
  repr d := s!"ℂ \\ {d.n_holes} holes"

#eval "MultiplyConnectedDomain defined"

/-! ## Annulus -/

/-- An annulus A(r₁, r₂) = {z : r₁ < |z| < r₂} (doubly connected) -/
structure Annulus where
  innerRadius : ℝ
  outerRadius : ℝ
  centered : Prop

instance : Object Annulus where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "Annulus"
  repr a := s!"A({a.innerRadius}, {a.outerRadius})"

/-- The conformal modulus of an annulus A(r₁, r₂) is (1/2π) log(r₂/r₁) -/
def conformalModulus (A : Annulus) : ℝ :=
  Real.log (A.outerRadius / A.innerRadius) / (2 * Real.pi)

#eval "Annulus and conformalModulus defined"

/-! ## Standard Annuli -/

def standardAnnulus : Annulus where
  innerRadius := 1
  outerRadius := 2
  centered := trivial

def thinAnnulus : Annulus where
  innerRadius := 1
  outerRadius := 1.1
  centered := trivial

#eval conformalModulus standardAnnulus
#eval conformalModulus thinAnnulus

end MiniConformalMapping
