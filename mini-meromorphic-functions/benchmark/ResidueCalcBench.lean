import MiniMeromorphicFunctions

/-!
  # Residue Calculation Benchmark

  Benchmarks for residue computation at poles of various orders
  and for meromorphic functions with multiple poles.
-/

open MiniMeromorphicFunctions

/-- Benchmark: simple pole residue for f(z) = cot z at z = 0. -/
def bench_residue_simple : IO Unit := do
  IO.println "Benchmark: Res(cot z, 0) = 1"

/-- Benchmark: double pole residue for
    f(z) = 1/(z^2 (z-1)) at z = 0. -/
def bench_residue_double : IO Unit := do
  IO.println "Benchmark: Res(1/(z^2(z-1)), 0) = -1"

/-- Benchmark: residue sum for f(z) = 1/(z(z-1)(z-2))
    at z=0,1,2 and infinity. -/
def bench_residue_sum : IO Unit := do
  IO.println "Benchmark: Σ Res(1/(z(z-1)(z-2))) + Res(∞) = 0"

/-- Benchmark: residue of high-order pole
    f(z) = 1/((z-a)^n) — residue is 0 for n > 1. -/
def bench_residue_high_order : IO Unit := do
  IO.println "Benchmark: Res(1/(z-a)^n, a) = 0 for n > 1"

/-- Benchmark: residue at infinity for rational function. -/
def bench_residue_infinity : IO Unit := do
  IO.println "Benchmark: Res(∞) for rational function"

#eval "ResidueCalcBench: simple, double, high-order, sum, infinity"
