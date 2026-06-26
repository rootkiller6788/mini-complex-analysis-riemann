/-
# MiniComplexNumbers: Constructions — Subobjects

ℝ as a subfield of ℂ, upper half-plane, unit disc, ℍ,
and subfields of ℂ.
-/

import MiniComplexNumbers.Core.Basic

namespace MiniComplexNumbers

/-! ## ℝ as a Subfield of ℂ -/

def RealSubfield (r : Float) : ComplexNumbers :=
  ComplexNumbers.of r 0

def isReal (z : ComplexNumbers) : Prop := z.im = 0

def isRealAsBool (z : ComplexNumbers) : Bool := z.im = 0

def realInjection (r : Float) : ComplexNumbers := RealSubfield r

def realExtraction (z : ComplexNumbers) : Option Float :=
  if z.im = 0 then some z.re else none

/-! ## Upper Half-Plane ℍ -/

def UpperHalfPlane : Set ComplexNumbers :=
  fun z => z.im > 0

notation "ℍ" => UpperHalfPlane

def isInUpperHalfPlane (z : ComplexNumbers) : Bool :=
  z.im > 0

/-! ## Unit Disc D -/

def UnitDisc : Set ComplexNumbers :=
  fun z => |z| < 1

def isInUnitDisc (z : ComplexNumbers) : Bool :=
  |z| < 1

/-! ## Subfields of ℂ -/

def RationalNumbersSubfield : Set ComplexNumbers :=
  fun z => z.im = 0 ∧ True  -- stub: re is rational

def AlgebraicNumbersSubfield : Set ComplexNumbers :=
  fun z => True  -- stub: z is algebraic

def RealAlgebraicSubfield : Set ComplexNumbers :=
  fun z => isReal z ∧ AlgebraicNumbersSubfield z

/-! ## #eval Tests -/

#eval "── Constructions.Subobjects: Real injection ──"
#eval realInjection 3.14

#eval "── Constructions.Subobjects: isReal check ──"
#eval isRealAsBool (ComplexNumbers.of 5 0)
#eval isRealAsBool (ComplexNumbers.of 5 1)

#eval "── Constructions.Subobjects: Upper half-plane ──"
#eval isInUpperHalfPlane (ComplexNumbers.of 0 1)
#eval isInUpperHalfPlane (ComplexNumbers.of 0 (-1))

#eval "── Constructions.Subobjects: Unit disc ──"
#eval isInUnitDisc (ComplexNumbers.of 0.5 0)
#eval isInUnitDisc (ComplexNumbers.of 2 0)

end MiniComplexNumbers
