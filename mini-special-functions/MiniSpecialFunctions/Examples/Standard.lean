/-
# MiniSpecialFunctions: Standard Examples

Standard examples and special values:
- sin(iz) = i sinh z
- log(-1) = πi
- Γ(1/2) = √π
- ζ(2) = π²/6
- ζ(-1) = -1/12
- ℘(z; ℤ+ℤi) evaluations
-/

import MiniSpecialFunctions.Theorems.UniversalProperties

namespace MiniSpecialFunctions

open MiniComplexNumbers

/-! ## Trig and Hyperbolic Relations -/

/-- sin(iz) = i sinh z -/
def sinImagRelation (z : Float) : ComplexNumbers :=
  let iz := ComplexNumbers.of 0 z
  complexSin iz

/-- cos(iz) = cosh z -/
def cosImagRelation (z : Float) : ComplexNumbers :=
  let iz := ComplexNumbers.of 0 z
  complexCos iz

/-! ## Principal Value Evaluations -/

/-- log(-1) = πi -/
def logMinusOne : ComplexNumbers :=
  complexLog (ComplexNumbers.of (-1) 0)

/-- log(i) = πi/2 -/
def logI : ComplexNumbers :=
  complexLog (ComplexNumbers.of 0 1)

/-- log(1+i) = ln(√2) + πi/4 -/
def logOnePlusI : ComplexNumbers :=
  complexLog (ComplexNumbers.of 1 1)

/-! ## Gamma Special Values -/

/-- Γ(1/2) = √π -/
example : gammaHalf = Float.sqrt Float.pi := by
  native_decide

/-- Γ(1) = 1 -/
example : gammaApprox 1.0 = 1.0 := by
  native_decide

/-- Γ(3/2) = √π/2 -/
def gammaThreeHalves : Float :=
  gammaApprox 1.5

/-- Γ(n) = (n-1)! for n=1,2,3,4,5 -/
def gammaFactorialTable : List (Nat × Float) :=
  [ (1, gammaApprox 1.0)
  , (2, gammaApprox 2.0)
  , (3, gammaApprox 3.0)
  , (4, gammaApprox 4.0)
  , (5, gammaApprox 5.0)
  ]

/-- Expected factorials: 1,1,2,6,24 -/
def expectedFactorials : List Float :=
  [1.0, 1.0, 2.0, 6.0, 24.0]

/-! ## Zeta Special Values -/

/-- ζ(2) = π²/6 -/
example : zetaTwo = Float.pi * Float.pi / 6.0 := by
  native_decide

/-- ζ(4) = π⁴/90 -/
def zetaFour : Float := Float.pi * Float.pi * Float.pi * Float.pi / 90.0

/-- ζ(-1) = -1/12 -/
example : zetaNegOne = -1.0 / 12.0 := by
  native_decide

/-! ## Weierstrass ℘ Examples -/

/-- Square lattice ℤ + ℤi: g₂ ≈ 189.07, g₃ = 0 (lemniscatic case) -/
def squareLatticeG2 : Float := weierstrassG2 1.0 1.0
def squareLatticeG3 : Float := weierstrassG3 1.0 1.0

/-- Equianharmonic case: ω₂/ω₁ = e^{2πi/3}: g₂ = 0, g₃ ≠ 0 -/
def equianharmonicTau : Float := 0.5
def equianharmonicG2 : Float := weierstrassG2 1.0 (Float.sqrt 3.0)
def equianharmonicG3 : Float := weierstrassG3 1.0 (Float.sqrt 3.0)

/-! ## #eval Tests -/

#eval "── Examples.Standard: sin(iz) at z=1 ──"
#eval sinImagRelation 1.0

#eval "── Examples.Standard: log(-1) = πi ──"
#eval logMinusOne

#eval "── Examples.Standard: log(i) = πi/2 ──"
#eval logI

#eval "── Examples.Standard: log(1+i) ──"
#eval logOnePlusI

#eval "── Examples.Standard: Γ(1)..Γ(5) table ──"
#eval gammaFactorialTable

#eval "── Examples.Standard: ζ(2) ──"
#eval zetaTwo

#eval "── Examples.Standard: ζ(4) ──"
#eval zetaFour

#eval "── Examples.Standard: ζ(-1) ──"
#eval zetaNegOne

#eval "── Examples.Standard: ℘ square lattice g₂ ──"
#eval squareLatticeG2

#eval "── Examples.Standard: ℘ square lattice g₃ ──"
#eval squareLatticeG3

end MiniSpecialFunctions
