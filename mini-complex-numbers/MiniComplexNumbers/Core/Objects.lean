/-
# MiniComplexNumbers: Objects

Object instance for ComplexNumbers, theory registration,
ℂ as a field, and the unit circle S¹.
-/

import MiniObjectKernel.Core.Basic
import MiniComplexNumbers.Core.Basic

namespace MiniComplexNumbers

open MiniObjectKernel

/-! ## Object Instance for ComplexNumbers -/

instance : Object ComplexNumbers where
  theory := TheoryName.ofString "ComplexAnalysis"
  objName := "ComplexNumbers(ℂ)"
  repr z := s!"({z.re} + {z.im}i)"

/-! ## Complex as a Field -/

def fieldStructure : String :=
  s!"ℂ is a field: {repr one} is unit, {repr i} is imaginary unit"

/-! ## Unit Circle S¹ -/

def unitCircle : ComplexNumbers → Prop :=
  fun z => |z| = 1

def isOnUnitCircle (z : ComplexNumbers) : Bool :=
  Float.abs (|z| - 1) < 0.0001

def S1_example : ComplexNumbers :=
  ComplexNumbers.of (Float.cos 1.0) (Float.sin 1.0)

/-! ## Theory Registration -/

def registerComplexTheory : IO Unit := do
  IO.println "ComplexNumbers theory registered as Object instance"
  IO.println s!"  Theory: {theory ComplexNumbers}"
  IO.println s!"  Object: {objName ComplexNumbers}"

/-! ## #eval Tests -/

#eval "── Core.Objects: Object instance ──"
#eval describe ComplexNumbers
#eval objName ComplexNumbers
#eval repr (ComplexNumbers.of 3 4)

#eval "── Core.Objects: Unit circle check ──"
#eval isOnUnitCircle S1_example
#eval |S1_example|

end MiniComplexNumbers
