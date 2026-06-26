/-
# MiniComplexNumbers: Standard Examples

Standard examples: roots of unity, polar form, solving quadratic equations,
and modulus computations.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Core.Laws

namespace MiniComplexNumbers

/-! ## Roots of Unity -/

def fourthRootsOfUnity : List ComplexNumbers := nthRootsOfUnity 4
-- 1, i, -1, -i

def sixthRootsOfUnity : List ComplexNumbers := nthRootsOfUnity 6

def primitiveFourthRoots : List ComplexNumbers := [i, -i]

/-! ## Polar Form of 1+i -/

def onePlusi : ComplexNumbers := ComplexNumbers.of 1 1

def onePlusiModulus : Float := |onePlusi|  -- √2 ≈ 1.414

def onePlusiArgument : Float := argument onePlusi  -- π/4 ≈ 0.785

def onePlusiPolar : ComplexNumbers := polarForm onePlusiModulus onePlusiArgument

/-! ## Solving z² = 2i -/

def solveZ2eq2i : ComplexNumbers × ComplexNumbers :=
  -- z² = 2i => z = 1+i or z = -1-i
  let root1 := ComplexNumbers.of 1 1
  let root2 := ComplexNumbers.of (-1) (-1)
  (root1, root2)

def verifyZ2eq2i (z : ComplexNumbers) : ComplexNumbers := z * z

/-! ## Modulus Examples -/

def modExample1 : Float := |ComplexNumbers.of 3 4|  -- 5

def modExample2 : Float := |ComplexNumbers.of 5 12|  -- 13

def modExample3 : Float := |ComplexNumbers.of 8 15|  -- 17

def modExample4 : Float := |ComplexNumbers.of 7 24|  -- 25

/-! ## Complex Exponential (stub) -/

def complexExp (z : ComplexNumbers) : ComplexNumbers :=
  polarForm (Float.exp z.re) z.im  -- e^(x+iy) = e^x * cis(y)

def eulerIdentity : ComplexNumbers :=
  complexExp (ComplexNumbers.of 0 3.141592653589793)
  -- e^(iπ) = -1

/-! ## Gaussian Integer Examples -/

def gaussianInteger (a b : Int) : ComplexNumbers :=
  ComplexNumbers.of (Float.ofInt a) (Float.ofInt b)

def gaussianOnePlusI : ComplexNumbers := gaussianInteger 1 1

def gaussianNorm (z : ComplexNumbers) : Float := |z|

/-! ## #eval Tests -/

#eval "── Examples.Standard: Fourth roots of unity ──"
#eval fourthRootsOfUnity

#eval "── Examples.Standard: 1+i polar form ──"
#eval (onePlusiModulus, onePlusiArgument)
#eval onePlusiPolar

#eval "── Examples.Standard: Solving z²=2i ──"
def sol1 := (solveZ2eq2i).1
def sol2 := (solveZ2eq2i).2
#eval (sol1, verifyZ2eq2i sol1)
#eval (sol2, verifyZ2eq2i sol2)

#eval "── Examples.Standard: Modulus of 3+4i ──"
#eval modExample1
#eval modExample2
#eval modExample3
#eval modExample4

#eval "── Examples.Standard: Gaussian integers ──"
#eval gaussianOnePlusI
#eval gaussianNorm gaussianOnePlusI

#eval "── Examples.Standard: Euler identity ──"
#eval eulerIdentity

end MiniComplexNumbers
