/-
# MiniSpecialFunctions: Full Benchmark Suite

Complete benchmark aggregator for all special functions.
Runs all individual benchmarks and produces a summary report.
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers
open MiniObjectKernel

#eval "══════════════════════════════════════════════════"
#eval "  MINI-SPECIAL-FUNCTIONS FULL BENCHMARK SUITE"
#eval "══════════════════════════════════════════════════"

/-! ### 1. Complex Exponential and Trig -/

#eval "══ 1. EXPONENTIAL & TRIG ══"

#eval "── exp(0) = 1 ──"
#eval complexExp (ComplexNumbers.of 0 0)

#eval "── exp(iπ) = -1 ──"
#eval complexExp (ComplexNumbers.of 0 Float.pi)

#eval "── sin(0) = 0 ──"
#eval complexSin (ComplexNumbers.of 0 0)

#eval "── cos(0) = 1 ──"
#eval complexCos (ComplexNumbers.of 0 0)

#eval "── log(-1) = πi ──"
#eval complexLog (ComplexNumbers.of (-1) 0)

/-! ### 2. Gamma Function -/

#eval "══ 2. GAMMA FUNCTION ══"

#eval "── Γ(1) = 1 ──"
#eval gammaApprox 1.0

#eval "── Γ(5) = 24 ──"
#eval gammaApprox 5.0

#eval "── Γ(10) = 362880 ──"
#eval gammaApprox 10.0

#eval "── Γ(1/2) = √π ──"
#eval gammaHalf

#eval "── Stirling Γ(10) ──"
#eval stirlingGamma 10.0

#eval "── Lanczos Γ(10) ──"
#eval gammaLanczos 10.0

#eval "── Product Γ(5) ──"
#eval gammaProduct 5.0 1000

/-! ### 3. Riemann Zeta -/

#eval "══ 3. RIEMANN ZETA ══"

#eval "── ζ(2) = π²/6 ──"
#eval zetaTwo

#eval "── ζ(4) = π⁴/90 ──"
#eval Float.pi * Float.pi * Float.pi * Float.pi / 90.0

#eval "── ζ(-1) = -1/12 ──"
#eval zetaNegOne

#eval "── ζ(2) partial sum (N=10000) ──"
#eval zetaPartialSum 2.0 10000

#eval "── ζ(2) Euler product (primes≤100) ──"
#eval zetaEulerProductFormula 2.0 100

#eval "── ζ(2) Euler-Maclaurin ──"
#eval zetaEulerMaclaurin 2.0 10 5

#eval "── ζ(3) (Apéry) partial sum ──"
#eval zetaPartialSum 3.0 10000

/-! ### 4. Elliptic Functions -/

#eval "══ 4. ELLIPTIC FUNCTIONS ══"

#eval "── g₂(1,i), g₃(1,i) ──"
#eval weierstrassG2 1.0 1.0
#eval weierstrassG3 1.0 1.0

#eval "── j(i) ──"
#eval jInvariant (ComplexNumbers.of 0 1)

#eval "── j(e^{2πi/3}) ──"
#eval jInvariant (ComplexNumbers.of 0.5 (Float.sqrt 3.0 / 2.0))

#eval "── E₄(i) ──"
#eval eisensteinSeries 4 (ComplexNumbers.of 0 1) 10

#eval "── Δ(i) ──"
#eval discriminantForm.f (ComplexNumbers.of 0 1)

/-! ### 5. Theta Functions -/

#eval "══ 5. THETA FUNCTIONS ══"

#eval "── θ₃(0; i) ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 1) 20

#eval "── θ(0; 0.1i) ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 0.1) 10

#eval "── AGM(1, 1/√2) ──"
#eval agm 1.0 (1.0 / Float.sqrt 2.0) 10

#eval "── Elliptic K via AGM ──"
#eval completeEllipticKAGM (1.0 / Float.sqrt 2.0) 10

/-! ### 6. Object System -/

#eval "══ 6. OBJECT SYSTEM ══"

#eval "── Special functions catalog ──"
#eval specialFunctionsCatalog.length
#eval specialFunctionsCatalog.map (fun sf => sf.name)

#eval "── Gamma object ──"
#eval describeSpecialFunction gammaFunction

#eval "── Zeta object ──"
#eval describeSpecialFunction zetaFunction

#eval "── Theta object ──"
#eval describeSpecialFunction thetaFunction

#eval "── WeierstrassP object ──"
#eval describeSpecialFunction weierstrassPFunction

/-! ### 7. Cross-checks -/

#eval "══ 7. CROSS-CHECKS ══"

#eval "── Γ(6) via recursion vs via 5·Γ(5) ──"
#eval gammaApprox 6.0
#eval 5.0 * gammaApprox 5.0

#eval "── Γ(1/2)² = π ──"
#eval gammaHalf * gammaHalf
#eval Float.pi

#eval "── ζ(2) vs ζ(-1) relation check ──"
#eval zetaTwo
#eval zetaNegOne

#eval "══════════════════════════════════════════════════"
#eval "  FULL BENCHMARK SUITE COMPLETE"
#eval "══════════════════════════════════════════════════"
