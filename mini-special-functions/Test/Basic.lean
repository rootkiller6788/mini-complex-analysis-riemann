/-
# MiniSpecialFunctions: Basic Tests

Unit tests for fundamental special function definitions.
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers

/-! ## Complex Exponential Tests -/

#eval "══ TEST: Complex Exponential ══"

#eval "── exp(0) = 1 ──"
#eval complexExp (ComplexNumbers.of 0 0)

#eval "── exp(iπ) = -1 ──"
#eval complexExp (ComplexNumbers.of 0 Float.pi)

#eval "── exp(1) real ──"
#eval complexExp (ComplexNumbers.of 1 0)

/-! ## Complex Trig Tests -/

#eval "══ TEST: Complex Trig ══"

#eval "── sin(0) = 0 ──"
#eval complexSin (ComplexNumbers.of 0 0)

#eval "── cos(0) = 1 ──"
#eval complexCos (ComplexNumbers.of 0 0)

#eval "── sin(π/2) real ──"
#eval complexSin (ComplexNumbers.of (Float.pi / 2.0) 0)

#eval "── cos(π) = -1 ──"
#eval complexCos (ComplexNumbers.of Float.pi 0)

/-! ## Complex Logarithm Tests -/

#eval "══ TEST: Complex Logarithm ══"

#eval "── log(1) = 0 ──"
#eval complexLog (ComplexNumbers.of 1 0)

#eval "── log(e) = 1 ──"
#eval complexLog (ComplexNumbers.of Float.exp 1.0 0)

#eval "── log(-1) = πi ──"
#eval complexLog (ComplexNumbers.of (-1) 0)

/-! ## Gamma Function Tests -/

#eval "══ TEST: Gamma Function ══"

#eval "── Γ(1) = 1 ──"
#eval gammaApprox 1.0

#eval "── Γ(2) = 1 ──"
#eval gammaApprox 2.0

#eval "── Γ(3) = 2 ──"
#eval gammaApprox 3.0

#eval "── Γ(4) = 6 ──"
#eval gammaApprox 4.0

#eval "── Γ(5) = 24 ──"
#eval gammaApprox 5.0

#eval "── Γ(1/2) = √π ──"
#eval gammaHalf
#eval Float.sqrt Float.pi

/-! ## Zeta Function Tests -/

#eval "══ TEST: Riemann Zeta ══"

#eval "── ζ(2) = π²/6 ──"
#eval zetaTwo
#eval Float.pi * Float.pi / 6.0

#eval "── ζ(-1) = -1/12 ──"
#eval zetaNegOne

#eval "── ζ(2) partial sum convergence ──"
#eval zetaPartialSum 2.0 100
#eval zetaPartialSum 2.0 1000
#eval zetaPartialSum 2.0 10000

/-! ## Weierstrass ℘ Tests -/

#eval "══ TEST: Weierstrass ℘ ══"

#eval "── g₂(1,i) ──"
#eval weierstrassG2 1.0 1.0

#eval "── g₃(1,i) ≈ 0 (lemniscatic) ──"
#eval weierstrassG3 1.0 1.0

#eval "══ ALL BASIC TESTS COMPLETE ══"
