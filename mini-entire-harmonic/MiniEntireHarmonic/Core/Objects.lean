/-
# MiniEntireHarmonic: Objects

Object instances for EntireFunction, HarmonicFunction, and theory registration.
`EntireFunction` as subring of holomorphic functions, `HarmonicFunction` as Object.
-/

import MiniObjectKernel.Core.Basic
import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic

open MiniObjectKernel

/-! ## Object Instance for EntireFunction -/

instance : Object (EntireFunction) where
  theory := TheoryName.ofString "ComplexAnalysis.EntireHarmonic"
  objName := "EntireFunction(ℂ→ℂ)"
  repr f := s!"<entire function: holomorphic on all ℂ>"

def entireFunctionWithName (f : EntireFunction) (name : String) : String :=
  s!"EntireFunction({name}): {repr f}"

/-! ## Object Instance for HarmonicFunction -/

instance : Object (ComplexNumbers → Float) where
  theory := TheoryName.ofString "ComplexAnalysis.EntireHarmonic"
  objName := "HarmonicFunction(ℂ→ℝ)"
  repr u := s!"<harmonic function Δu=0>"

/-! ## Theory Registration -/

def theoryName : String := "ComplexAnalysis.EntireHarmonic"

def registerEntireHarmonicTheory : IO Unit := do
  IO.println "EntireHarmonic theory registered"
  IO.println s!"  Theory: {theoryName}"
  IO.println s!"  Objects: EntireFunction, HarmonicFunction, PoissonKernel"
  IO.println s!"  Constructions: WeierstrassProduct, HadamardFactorization, PoissonIntegral"

/-! ## Ring Structure of Entire Functions -/

def entireZero : EntireFunction := fun _ => zero
def entireOne  : EntireFunction := fun _ => one

def entireAdd (f g : EntireFunction) : EntireFunction := fun z => f z + g z
def entireMul (f g : EntireFunction) : EntireFunction := fun z => f z * g z
def entireNeg (f : EntireFunction) : EntireFunction := fun z => -f z

/-! ## Subring of Holomorphic Functions -/

def isSubringOfHolomorphic : Prop :=
  (isEntire entireZero) ∧
  (isEntire entireOne) ∧
  (∀ f g, isEntire f ∧ isEntire g → isEntire (entireAdd f g)) ∧
  (∀ f g, isEntire f ∧ isEntire g → isEntire (entireMul f g)) ∧
  (∀ f, isEntire f → isEntire (entireNeg f))

/-! ## Classifications -/

def finiteOrderEntire : Set EntireFunction :=
  fun f => orderOfGrowth_limsup f < Float.infinity

def genusClassification (g : Nat) : Set EntireFunction :=
  fun _ => true  -- stub: entire functions of genus g

/-! ## #eval Tests -/

#eval "── Core.Objects: EntireFunction Object ──"
#eval describe EntireFunction
#eval objName EntireFunction
#eval repr entireExpZ

#eval "── Core.Objects: HarmonicFunction Object ──"
#eval describe (ComplexNumbers → Float)
#eval objName (ComplexNumbers → Float)

#eval "── Core.Objects: Zero/Hadamard example ──"
#eval entireFunctionWithName entireExpZ "exp"
#eval entireFunctionWithName entireSinZ "sin"

end MiniEntireHarmonic
