/-
# MiniSpecialFunctions: Objects

Object typeclass instances for special functions.
Registers Gamma, Zeta, Theta, and Weierstrass ℘ as
first-class `Object` instances in the mini-everything-math ecosystem.
-/

import MiniSpecialFunctions.Core.Basic

namespace MiniSpecialFunctions

open MiniObjectKernel

/-! ## Theory Name for Special Functions -/

def specialFunctionsTheory : TheoryName :=
  TheoryName.ofString "ComplexAnalysis.SpecialFunctions"

/-! ## SpecialFunction as an Object -/

structure SpecialFunction where
  name : String
  domain : String
  range : String
  singularities : List String
  functionalEquation : String
  deriving Repr, Inhabited

instance : Object SpecialFunction where
  theory := specialFunctionsTheory
  objName sf := sf.name
  repr sf := s!"SpecialFunction({sf.name})"

/-! ## Register Standard Special Functions -/

def gammaFunction : SpecialFunction := {
  name := "Gamma"
  domain := "ℂ \\ {0, -1, -2, ...}"
  range := "ℂ"
  singularities := ["0", "-1", "-2", "−ℕ"]
  functionalEquation := "Γ(z+1) = zΓ(z)"
}

def zetaFunction : SpecialFunction := {
  name := "RiemannZeta"
  domain := "ℂ \\ {1}"
  range := "ℂ"
  singularities := ["1"]
  functionalEquation := "ζ(s) = 2^s π^{s-1} sin(πs/2)Γ(1-s)ζ(1-s)"
}

def thetaFunction : SpecialFunction := {
  name := "JacobiTheta"
  domain := "ℂ × ℍ"
  range := "ℂ"
  singularities := []
  functionalEquation := "θ(z+1;τ) = θ(z;τ), θ(z+τ;τ) = e^{-πiτ - 2πiz}θ(z;τ)"
}

def weierstrassPFunction : SpecialFunction := {
  name := "WeierstrassP"
  domain := "ℂ \\ Λ"
  range := "ℂ"
  singularities := ["Λ (lattice points)"]
  functionalEquation := "(℘')² = 4℘³ - g₂℘ - g₃"
}

/-! ## Special Function Catalog -/

def specialFunctionsCatalog : List SpecialFunction :=
  [gammaFunction, zetaFunction, thetaFunction, weierstrassPFunction]

def describeSpecialFunction (sf : SpecialFunction) : String :=
  s!"{sf.name}: {sf.domain} → {sf.range}, singularities: {sf.singularities}"

/-! ## #eval Tests -/

#eval "── Core.Objects: Gamma object ──"
#eval describeSpecialFunction gammaFunction

#eval "── Core.Objects: Zeta object ──"
#eval describeSpecialFunction zetaFunction

#eval "── Core.Objects: Theta object ──"
#eval describeSpecialFunction thetaFunction

#eval "── Core.Objects: Weierstrass P object ──"
#eval describeSpecialFunction weierstrassPFunction

#eval "── Core.Objects: Catalog count ──"
#eval specialFunctionsCatalog.length

end MiniSpecialFunctions
