/-
# MiniSpecialFunctions: Theta Functions Benchmark

Benchmarks for Jacobi theta functions:
- θ(z;τ) series convergence
- Theta-nullwerte evaluation
- Jacobi triple product verification
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers

/-! ## Benchmark: Theta Series Convergence -/

#eval "══ BENCHMARK: Theta Series ══"

#eval "── θ(0; 0.1i) with N=5 ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 0.1) 5

#eval "── θ(0; 0.1i) with N=10 ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 0.1) 10

#eval "── θ(0; 0.1i) with N=20 ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 0.1) 20

#eval "── θ(0.5; 0.1i) with N=10 ──"
#eval jacobiTheta 0.5 (ComplexNumbers.of 0 0.1) 10

/-! ## Benchmark: Theta Nullwerte Approximations -/

#eval "══ BENCHMARK: Theta Nullwerte ══"

#eval "── θ₃(0; i) ≈ 1.086... ──"
#eval jacobiTheta 0.0 (ComplexNumbers.of 0 1) 20

#eval "── θ₂(0; i) via θ₃ shift ──"
#eval jacobiTheta 0.5 (ComplexNumbers.of 0 1) 20

/-! ## Benchmark: Jacobi Triple Product -/

#eval "══ BENCHMARK: Jacobi Triple Product ══"

#eval "── JTP: x=0.3, z=1.0, N=10 ──"
#eval jacobiTripleProduct 0.3 1.0 10

#eval "── JTP: x=0.5, z=1.0, N=10 ──"
#eval jacobiTripleProduct 0.5 1.0 10

#eval "── JTP: x=0.7, z=0.5, N=10 ──"
#eval jacobiTripleProduct 0.7 0.5 10

/-! ## Benchmark: Theta via AGM -/

#eval "══ BENCHMARK: Theta via AGM ══"

#eval "── AGM(1, 1/√2) with 10 iterations ──"
#eval agm 1.0 (1.0 / Float.sqrt 2.0) 10

#eval "── θ₃ via AGM for nome≈0.1 ──"
#eval thetaViaAGM 0.1 10

#eval "══ THETA BENCHMARK COMPLETE ══"
