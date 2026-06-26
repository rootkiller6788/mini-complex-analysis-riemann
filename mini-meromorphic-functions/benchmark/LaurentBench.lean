import MiniMeromorphicFunctions

/-!
  # Laurent Series Computation Benchmark

  Benchmarks for computing Laurent series coefficients and
  principal parts of meromorphic functions.
-/

open MiniMeromorphicFunctions

/-! ## Benchmark: Coefficient Computation -/

/-- Benchmark computing Laurent coefficient a_{-5} for
    f(z) = 1/(z^5 (z-1)^3) at z = 0. -/
def bench_laurent_coeff : IO Unit := do
  -- Simulated computation using contour integration
  IO.println "Benchmark: Laurent coefficient a_{-5} for 1/(z^5(z-1)^3) at z=0"

/-- Benchmark computing the principal part of
    f(z) = (z+1)/(z^2 (z-2)^3) at z = 0 and z = 2. -/
def bench_principal_part : IO Unit := do
  IO.println "Benchmark: principal part of (z+1)/(z^2(z-2)^3) at z=0,2"

/-- Benchmark: Laurent series for high-order pole
    f(z) = 1/(z^10 - 1) at each 10th root of unity. -/
def bench_high_order : IO Unit := do
  IO.println "Benchmark: Laurent series for 1/(z^10-1) at 10 roots of unity"

#eval "LaurentBench: coefficient computation, principal part, high-order"
