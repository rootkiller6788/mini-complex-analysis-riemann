/-
# MiniSpecialFunctions: Zeta Function Benchmark

Performance and accuracy benchmarks for Riemann zeta:
- Partial sum convergence rate
- Euler product convergence
- Euler-Maclaurin summation
- Special values
-/

import MiniSpecialFunctions

open MiniSpecialFunctions

/-! ## Benchmark: Zeta Partial Sum Convergence -/

#eval "══ BENCHMARK: Zeta Partial Sum ══"

#eval "── ζ(2) with N=100 ──"
#eval zetaPartialSum 2.0 100

#eval "── ζ(2) with N=1000 ──"
#eval zetaPartialSum 2.0 1000

#eval "── ζ(2) with N=10000 ──"
#eval zetaPartialSum 2.0 10000

#eval "── ζ(2) with N=100000 ──"
#eval zetaPartialSum 2.0 100000

#eval "── ζ(2) exact ──"
#eval zetaTwo

/-! ## Benchmark: Euler Product Convergence -/

#eval "══ BENCHMARK: Euler Product ══"

#eval "── ζ(2) Euler product primes≤10 ──"
#eval zetaEulerProductFormula 2.0 10

#eval "── ζ(2) Euler product primes≤50 ──"
#eval zetaEulerProductFormula 2.0 50

#eval "── ζ(2) Euler product primes≤100 ──"
#eval zetaEulerProductFormula 2.0 100

/-! ## Benchmark: Euler-Maclaurin -/

#eval "══ BENCHMARK: Euler-Maclaurin ══"

#eval "── ζ(2) EM: N=10, M=3 ──"
#eval zetaEulerMaclaurin 2.0 10 3

#eval "── ζ(2) EM: N=20, M=5 ──"
#eval zetaEulerMaclaurin 2.0 20 5

#eval "── ζ(4) EM: N=10, M=3 ──"
#eval zetaEulerMaclaurin 4.0 10 3

/-! ## Benchmark: Special Values -/

#eval "══ BENCHMARK: Zeta Special Values ══"

#eval "── ζ(2) ──"
#eval zetaTwo

#eval "── ζ(4) = π⁴/90 ──"
#eval Float.pi * Float.pi * Float.pi * Float.pi / 90.0

#eval "── ζ(-1) ──"
#eval zetaNegOne

#eval "── ζ(3) (Apéry's constant, approx) ──"
#eval zetaPartialSum 3.0 10000  -- ≈ 1.2020569

#eval "══ ZETA BENCHMARK COMPLETE ══"
