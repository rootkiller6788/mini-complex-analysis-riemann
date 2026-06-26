/-
# Computation: Decision Procedures

Decision procedures for complex numbers:
equality testing, sign determination, algebraic queries.
-/

import MiniComplexNumbers

open MiniComplexNumbers

/-! ## Complex Equality with Tolerance -/

def complexEq (z w : ComplexNumbers) (ε : Float := 0.000001) : Bool :=
  Float.abs (z.re - w.re) < ε && Float.abs (z.im - w.im) < ε

/-! ## Real/Imaginary Classification -/

def isPurelyReal (z : ComplexNumbers) (ε : Float := 0.000001) : Bool :=
  Float.abs z.im < ε

def isPurelyImaginary (z : ComplexNumbers) (ε : Float := 0.000001) : Bool :=
  Float.abs z.re < ε

/-! ## Root of Unity Test -/

def isRootOfUnity (z : ComplexNumbers) (n : Nat) (ε : Float := 0.000001) : Bool :=
  let roots := nthRootsOfUnity n
  roots.any (fun r => complexEq z r ε)

/-! ## Gaussian Integer Test -/

def isGaussianInteger (z : ComplexNumbers) (ε : Float := 0.000001) : Bool :=
  let reInt := Float.abs (z.re - Float.round z.re) < ε
  let imInt := Float.abs (z.im - Float.round z.im) < ε
  reInt && imInt

/-! ## Algebraic Number Test (Stub) -/

def isAlgebraicNumber (z : ComplexNumbers) : Bool :=
  -- stub: cannot decide in general, return true for simple cases
  isPurelyReal z 0.001 || isGaussianInteger z 0.001

/-! ## Field Membership Tests -/

def isInRealField (z : ComplexNumbers) : Bool :=
  z.im = 0

def isInRationalField (z : ComplexNumbers) : Bool :=
  z.im = 0 && True  -- stub: re is rational

/-! ## Quadratic Residue in ℂ (Stub) -/

def isQuadraticResidue (z : ComplexNumbers) : Bool :=
  True  -- Every complex number has a square root

/-! ## #eval Tests -/

#eval "── DecisionProcedures: complexEq ──"
#eval complexEq (ComplexNumbers.of 1 0) (ComplexNumbers.of 1.0000001 0)
#eval complexEq (ComplexNumbers.of 1 0) (ComplexNumbers.of 2 0)

#eval "── DecisionProcedures: isPurelyReal ──"
#eval isPurelyReal (ComplexNumbers.of 5 0)
#eval isPurelyReal (ComplexNumbers.of 5 0.001)

#eval "── DecisionProcedures: isRootOfUnity ──"
#eval isRootOfUnity (ComplexNumbers.of 1 0) 4
#eval isRootOfUnity (ComplexNumbers.of 0 1) 4
#eval isRootOfUnity (ComplexNumbers.of 2 0) 4

#eval "── DecisionProcedures: isGaussianInteger ──"
#eval isGaussianInteger (ComplexNumbers.of 3 4)
#eval isGaussianInteger (ComplexNumbers.of 3.5 4)

end MiniComplexNumbers
