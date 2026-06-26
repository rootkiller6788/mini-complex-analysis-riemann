/-
# MiniHolomorphicFunctions.Core.Objects

Object instances and theory registration for holomorphic function types.
-/

import MiniHolomorphicFunctions.Core.Basic
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Theory Names -/

def holomorphicTheory : TheoryName :=
  TheoryName.ofString "HolomorphicFunctions"

def entireFunctionTheory : TheoryName :=
  TheoryName.ofString "EntireFunctions"

def meromorphicTheory : TheoryName :=
  TheoryName.ofString "MeromorphicFunctions"

/-! ## Structure Types -/

/-- A holomorphic function on a domain U. -/
structure HolomorphicFunction (U : Set ℂ) where
  f : ℂ → ℂ
  domain : Set ℂ
  isDomain : Prop
  isHolomorphic : ∀ z, z ∈ U → isComplexDifferentiable f z

/-- An entire function (holomorphic on all of ℂ). -/
structure EntireFunction where
  f : ℂ → ℂ
  isEntire : ∀ z : ℂ, isComplexDifferentiable f z

/-- A meromorphic function on U (holomorphic except at isolated poles). -/
structure MeromorphicFunction (U : Set ℂ) where
  f : ℂ → ℂ
  domain : Set ℂ
  poles : Set ℂ
  polesIsolated : Prop
  isMeromorphic : ∀ z, z ∈ U \ poles → isComplexDifferentiable f z

/-! ## Object Instances -/

instance : Object (HolomorphicFunction U) where
  theory := holomorphicTheory
  objName := "HolomorphicFunction"
  repr _ := "holomorphic function on a domain"

instance : Object EntireFunction where
  theory := entireFunctionTheory
  objName := "EntireFunction"
  repr _ := "entire function"

instance : Object (MeromorphicFunction U) where
  theory := meromorphicTheory
  objName := "MeromorphicFunction"
  repr _ := "meromorphic function"

/-! ## Theory Registration -/

def registeredHolomorphicTheories : List TheoryName :=
  [holomorphicTheory, entireFunctionTheory, meromorphicTheory]

def holomorphicDependencyNode : Dependency.TheoryNode :=
  Dependency.node holomorphicTheory #["ComplexNumbers", "RealAnalysis"]

/-! ## Theory Morphisms -/

def entireToHolomorphic : String :=
  "EntireFunctions ↪ HolomorphicFunctions (restriction functor)"

def holomorphicToMeromorphic : String :=
  "HolomorphicFunctions ↪ MeromorphicFunctions (inclusion with empty pole set)"

/-! ## #eval Tests -/

#eval "Core.Objects: HolomorphicFunction, EntireFunction, MeromorphicFunction"
#eval s!"Registered theories: {registeredHolomorphicTheories.length} (expected: 3)"
#eval "Core.Objects: Object instances for all three function types"

end MiniHolomorphicFunctions
