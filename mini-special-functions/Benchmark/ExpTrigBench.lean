/-
# MiniSpecialFunctions: Exponential and Trig Benchmark

Benchmarks for complex exponential and trigonometric functions:
- exp(z) accuracy
- sin/cos via Euler formulas
- log/principal value accuracy
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniComplexNumbers

/-! ## Benchmark: Complex Exponential -/

#eval "══ BENCHMARK: Complex Exponential ══"

#eval "── exp(0) ──"
#eval complexExp (ComplexNumbers.of 0 0)

#eval "── exp(1) ──"
#eval complexExp (ComplexNumbers.of 1 0)

#eval "── exp(π) ──"
#eval complexExp (ComplexNumbers.of Float.pi 0)

#eval "── exp(iπ/4) ──"
#eval complexExp (ComplexNumbers.of 0 (Float.pi / 4.0))

#eval "── exp(iπ/2) ──"
#eval complexExp (ComplexNumbers.of 0 (Float.pi / 2.0))

#eval "── exp(iπ) ──"
#eval complexExp (ComplexNumbers.of 0 Float.pi)

#eval "── exp(2πi) ──"
#eval complexExp (ComplexNumbers.of 0 (2.0 * Float.pi))

#eval "── exp(1+i) ──"
#eval complexExp (ComplexNumbers.of 1 1)

/-! ## Benchmark: Complex Sine/Cosine -/

#eval "══ BENCHMARK: Complex Sine ══"

#eval "── sin(0) ──"
#eval complexSin (ComplexNumbers.of 0 0)

#eval "── sin(π/6) real ──"
#eval complexSin (ComplexNumbers.of (Float.pi / 6.0) 0)

#eval "── sin(π/4) real ──"
#eval complexSin (ComplexNumbers.of (Float.pi / 4.0) 0)

#eval "── sin(π/2) real ──"
#eval complexSin (ComplexNumbers.of (Float.pi / 2.0) 0)

#eval "── sin(π) real ──"
#eval complexSin (ComplexNumbers.of Float.pi 0)

#eval "══ BENCHMARK: Complex Cosine ══"

#eval "── cos(0) ──"
#eval complexCos (ComplexNumbers.of 0 0)

#eval "── cos(π/3) real ──"
#eval complexCos (ComplexNumbers.of (Float.pi / 3.0) 0)

#eval "── cos(π/2) real ──"
#eval complexCos (ComplexNumbers.of (Float.pi / 2.0) 0)

#eval "── cos(π) real ──"
#eval complexCos (ComplexNumbers.of Float.pi 0)

/-! ## Benchmark: Complex Logarithm -/

#eval "══ BENCHMARK: Complex Logarithm ══"

#eval "── log(1) ──"
#eval complexLog (ComplexNumbers.of 1 0)

#eval "── log(e) ──"
#eval complexLog (ComplexNumbers.of Float.exp 1.0 0)

#eval "── log(-1) ──"
#eval complexLog (ComplexNumbers.of (-1) 0)

#eval "── log(i) ──"
#eval complexLog (ComplexNumbers.of 0 1)

#eval "── log(-i) ──"
#eval complexLog (ComplexNumbers.of 0 (-1))

#eval "── log(1+i) ──"
#eval complexLog (ComplexNumbers.of 1 1)

/-! ## Benchmark: Complex Power -/

#eval "══ BENCHMARK: Complex Power ══"

#eval "── (1+i)^{2} ──"
#eval complexPower (ComplexNumbers.of 1 1) (ComplexNumbers.of 2 0)

#eval "── i^{i} │ exp(-π/2) ──"
#eval complexPower (ComplexNumbers.of 0 1) (ComplexNumbers.of 0 1)

#eval "══ EXP TRIG BENCHMARK COMPLETE ══"
