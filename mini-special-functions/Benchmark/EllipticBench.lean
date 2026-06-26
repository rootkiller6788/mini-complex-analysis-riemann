/-
# MiniSpecialFunctions: Elliptic Functions Benchmark

Benchmarks for Weierstrass ℘ and elliptic functions:
- Invariants g₂, g₃ for various lattices
- j-invariant computation
- Eisenstein series convergence
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers

/-! ## Benchmark: Weierstrass Invariants -/

#eval "══ BENCHMARK: Weierstrass Invariants ══"

#eval "── Square lattice g₂(1,i) ──"
#eval weierstrassG2 1.0 1.0
#eval weierstrassG3 1.0 1.0

#eval "── Rectangular lattice g₂(1, 2i) ──"
#eval weierstrassG2 1.0 2.0
#eval weierstrassG3 1.0 2.0

#eval "── Rectangular lattice g₂(1, 3i) ──"
#eval weierstrassG2 1.0 3.0
#eval weierstrassG3 1.0 3.0

/-! ## Benchmark: j-Invariant -/

#eval "══ BENCHMARK: j-Invariant ══"

#eval "── j(i) = 1728 ──"
#eval jInvariant (ComplexNumbers.of 0 1)

#eval "── j(2i) ──"
#eval jInvariant (ComplexNumbers.of 0 2)

#eval "── j(0.5 + i√3/2) = 0 ──"
#eval jInvariant (ComplexNumbers.of 0.5 (Float.sqrt 3.0 / 2.0))

#eval "── j(3i) ──"
#eval jInvariant (ComplexNumbers.of 0 3)

/-! ## Benchmark: Eisenstein Series -/

#eval "══ BENCHMARK: Eisenstein Series ══"

#eval "── E₄(i) via Eisenstein series ──"
#eval eisensteinSeries 4 (ComplexNumbers.of 0 1) 10

#eval "── E₆(i) via Eisenstein series ──"
#eval eisensteinSeries 6 (ComplexNumbers.of 0 1) 10

/-! ## Benchmark: Discriminant -/

#eval "══ BENCHMARK: Discriminant Δ ══"

#eval "── Δ(i) = g₂³ - 27g₃² ──"
#eval discriminantForm.f (ComplexNumbers.of 0 1)

#eval "══ ELLIPTIC BENCHMARK COMPLETE ══"
