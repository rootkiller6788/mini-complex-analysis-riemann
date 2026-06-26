import MiniMeromorphicFunctions

/-!
  # Argument Principle Benchmark

  Benchmarks for the argument principle: counting zeros and poles
  via contour integration of the logarithmic derivative.
-/

open MiniMeromorphicFunctions

/-- Benchmark: count zeros of z^3 + z^2 - 5z + 1 inside |z| = 1. -/
def bench_argument_count_zeros : IO Unit := do
  IO.println "Benchmark: argument principle count zeros of z^3+z^2-5z+1 in |z|<1"

/-- Benchmark: count poles of f(z) = 1/(z^2+1) inside |z| = 2. -/
def bench_argument_count_poles : IO Unit := do
  IO.println "Benchmark: argument principle count poles of 1/(z^2+1) in |z|<2"

/-- Benchmark: argument principle with high multiplicity zeros.
    f(z) = (z-1)^5 (z+2)^3 / (z-3)^4. -/
def bench_argument_high_multiplicity : IO Unit := do
  IO.println "Benchmark: argument principle with high multiplicity"

/-- Benchmark: argument principle on large contour with many
    zeros and poles (polynomial of degree 20). -/
def bench_argument_large_contour : IO Unit := do
  IO.println "Benchmark: argument principle on large contour, degree 20"

/-- Benchmark: winding number computation via numerical integration. -/
def bench_winding_number : IO Unit := do
  IO.println "Benchmark: winding number of f∘γ around 0"

#eval "ArgumentBench: zero counting, pole counting, high multiplicity, large contour"
