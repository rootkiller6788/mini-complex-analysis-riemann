/-
# MiniSpecialFunctions: Law Validation Tests

Tests verifying fundamental identities and laws.
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers

/-! ## Euler Formula Tests -/

#eval "══ TEST: Euler Formula ══"

#eval "── e^{iπ} = cos π + i sin π = -1 ──"
#eval complexExp (ComplexNumbers.of 0 Float.pi)

#eval "── e^{iπ/2} = i ──"
#eval complexExp (ComplexNumbers.of 0 (Float.pi / 2.0))

/-! ## Exponential Periodicity Tests -/

#eval "══ TEST: Exponential Periodicity ══"

#eval "── e^{2πi} = 1 ──"
#eval complexExp (ComplexNumbers.of 0 (2.0 * Float.pi))

#eval "── e^{4πi} = 1 ──"
#eval complexExp (ComplexNumbers.of 0 (4.0 * Float.pi))

/-! ## Gamma Functional Equation Tests -/

#eval "══ TEST: Gamma Functional Equation ══"

#eval "── Γ(6) via Γ(5+1) = 5·Γ(5) ──"
#eval gammaApprox 6.0
#eval 5.0 * gammaApprox 5.0

#eval "── Γ(3) via Γ(2+1) = 2·Γ(2) ──"
#eval gammaApprox 3.0
#eval 2.0 * gammaApprox 2.0

#eval "── Γ(1.5) via Γ(0.5+1) = 0.5·Γ(0.5) ──"
#eval gammaApprox 1.5
#eval 0.5 * gammaHalf

/-! ## Zeta Special Values Tests -/

#eval "══ TEST: Zeta Special Values ══"

#eval "── ζ(2) via partial sum vs exact ──"
#eval zetaPartialSum 2.0 100000
#eval zetaTwo

#eval "── ζ(4) = π⁴/90 approx ──"
#eval Float.pi * Float.pi * Float.pi * Float.pi / 90.0

#eval "── ζ(-1) ──"
#eval zetaNegOne

/-! ## Logarithm Law Tests -/

#eval "══ TEST: Logarithm Law ══"

#eval "── log(1·1) = log(1) + log(1) ──"
#eval complexLog (ComplexNumbers.of 1 0)

#eval "── log(e·e) vs 2·log(e) ──"
#eval complexLog (ComplexNumbers.of (Float.exp 1.0 * Float.exp 1.0) 0)
#eval complexLog (ComplexNumbers.of Float.exp 1.0 0)

#eval "══ ALL LAW TESTS COMPLETE ══"
