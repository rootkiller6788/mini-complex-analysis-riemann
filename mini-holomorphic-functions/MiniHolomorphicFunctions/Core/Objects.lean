/-
# MiniHolomorphicFunctions.Core.Objects

Object instances and theory registration for holomorphic function types.
-/

import MiniHolomorphicFunctions.Core.Basic
import MiniObjectKernel

open MiniObjectKernel

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
structure HolomorphicFunction (U : Set â„? where
  f : â„?â†?â„?  domain : Set â„?  isDomain : Prop
  isHolomorphic : âˆ€ z, z âˆ?U â†?isComplexDifferentiable f z

/-- An entire function (holomorphic on all of â„?. -/
structure EntireFunction where
  f : â„?â†?â„?  isEntire : âˆ€ z : â„? isComplexDifferentiable f z

/-- A meromorphic function on U (holomorphic except at isolated poles). -/
structure MeromorphicFunction (U : Set â„? where
  f : â„?â†?â„?  domain : Set â„?  poles : Set â„?  polesIsolated : Prop
  isMeromorphic : âˆ€ z, z âˆ?U \ poles â†?isComplexDifferentiable f z

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
  "EntireFunctions â†?HolomorphicFunctions (restriction functor)"

def holomorphicToMeromorphic : String :=
  "HolomorphicFunctions â†?MeromorphicFunctions (inclusion with empty pole set)"

/-! ## #eval Tests -/

#eval "Core.Objects: HolomorphicFunction, EntireFunction, MeromorphicFunction"
#eval s!"Registered theories: {registeredHolomorphicTheories.length} (expected: 3)"
#eval "Core.Objects: Object instances for all three function types"

end MiniHolomorphicFunctions
