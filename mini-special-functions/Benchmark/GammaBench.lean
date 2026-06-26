/-
# MiniSpecialFunctions: Gamma Function Benchmark

Performance and accuracy benchmarks for Gamma function implementations:
- Approximate Gamma (functional equation recursion)
- Stirling's approximation
- Lanczos approximation
- Weierstrass product
-/

import MiniSpecialFunctions

open MiniSpecialFunctions

/-! ## Benchmark: Gamma via Functional Equation Recursion -/

#eval "══ BENCHMARK: Gamma Recursion ══"

#eval "── Γ(10) via recursion ──"
#eval gammaApprox 10.0

#eval "── Γ(50) via recursion ──"
#eval gammaApprox 50.0

#eval "── Γ(100) via recursion ──"
#eval gammaApprox 100.0

/-! ## Benchmark: Stirling's Approximation -/

#eval "══ BENCHMARK: Stirling's Approximation ══"

#eval "── Stirling Γ(10) ──"
#eval stirlingGamma 10.0

#eval "── Stirling Γ(50) ──"
#eval stirlingGamma 50.0

#eval "── Stirling Γ(100) ──"
#eval stirlingGamma 100.0

#eval "── Stirling error at z=10 ──"
#eval stirlingError 10.0

#eval "── Stirling error at z=50 ──"
#eval stirlingError 50.0

#eval "── Stirling error at z=100 ──"
#eval stirlingError 100.0

/-! ## Benchmark: Lanczos Approximation -/

#eval "══ BENCHMARK: Lanczos Approximation ══"

#eval "── Lanczos Γ(5) ──"
#eval gammaLanczos 5.0

#eval "── Lanczos Γ(10) ──"
#eval gammaLanczos 10.0

#eval "── Lanczos Γ(50) ──"
#eval gammaLanczos 50.0

/-! ## Benchmark: Product Form -/

#eval "══ BENCHMARK: Weierstrass Product ══"

#eval "── Product Γ(3) N=100 ──"
#eval gammaProduct 3.0 100

#eval "── Product Γ(3) N=1000 ──"
#eval gammaProduct 3.0 1000

#eval "── Product Γ(5) N=1000 ──"
#eval gammaProduct 5.0 1000

/-! ## Benchmark: Special Values -/

#eval "══ BENCHMARK: Special Values ══"

#eval "── Γ(1/2) = √π ──"
#eval gammaHalf
#eval Float.sqrt Float.pi

#eval "── Γ(3/2) = √π/2 ──"
#eval gammaApprox 1.5

#eval "── Γ(1) = 1 ──"
#eval gammaApprox 1.0

#eval "══ GAMMA BENCHMARK COMPLETE ══"
