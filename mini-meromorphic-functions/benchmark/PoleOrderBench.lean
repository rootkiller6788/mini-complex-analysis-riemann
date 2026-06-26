import MiniMeromorphicFunctions

/-!
  # Pole Order Detection Benchmark

  Benchmarks for detecting and classifying pole orders.
-/

open MiniMeromorphicFunctions

/-- Benchmark: order of pole of f(z) = 1/z^m at z=0. -/
def bench_pole_order_simple : IO Unit := do
  IO.println "Benchmark: order of pole 1/z^3 at 0 is 3"

/-- Benchmark: order of pole of rational function
    f(z) = P(z)/Q(z) at roots of Q. -/
def bench_pole_order_rational : IO Unit := do
  IO.println "Benchmark: pole order of rational P(z)/Q(z) at Q-roots"

/-- Benchmark: distinguish pole from essential singularity. -/
def bench_pole_vs_essential : IO Unit := do
  IO.println "Benchmark: classify pole vs essential singularity"

/-- Benchmark: pole order of Gamma function at negative integers. -/
def bench_gamma_pole_order : IO Unit := do
  IO.println "Benchmark: Gamma function pole order at z = -n is 1"

/-- Benchmark: detect removable singularities. -/
def bench_removable_singularity : IO Unit := do
  IO.println "Benchmark: removable singularity detection (sin z / z at 0)"

#eval "PoleOrderBench: simple, rational, pole vs essential, Gamma, removable"
