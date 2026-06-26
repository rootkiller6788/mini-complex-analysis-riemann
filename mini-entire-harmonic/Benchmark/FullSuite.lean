/-
# MiniEntireHarmonic: FullSuite

Complete benchmark suite aggregating all benchmarks:
EntireOps, Hadamard, Harmonic, Poisson, Dirichlet.
-/

import MiniEntireHarmonic.Benchmark.EntireOpsBench
import MiniEntireHarmonic.Benchmark.HadamardBench
import MiniEntireHarmonic.Benchmark.HarmonicBench
import MiniEntireHarmonic.Benchmark.PoissonBench
import MiniEntireHarmonic.Benchmark.DirichletBench

namespace MiniEntireHarmonic.Benchmark

open MiniEntireHarmonic.Benchmark

/-! ## Full Benchmark Suite -/

def runFullSuite : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MINI-ENTIRE-HARMONIC FULL BENCHMARK"
  IO.println "═══════════════════════════════════════"
  IO.println ""
  runEntireOpsBench
  IO.println ""
  runHadamardBench
  IO.println ""
  runHarmonicBench
  IO.println ""
  runPoissonBench
  IO.println ""
  runDirichletBench
  IO.println ""
  IO.println "═══════════════════════════════════════"
  IO.println "  ALL BENCHMARKS COMPLETE"
  IO.println "═══════════════════════════════════════"

/-! ## Benchmark Summary -/

def benchmarkSummary : IO Unit := do
  IO.println "═══ BENCHMARK SUMMARY ═══"
  IO.println "  EntireOpsBench:  Evaluation, order computation, Poisson kernel"
  IO.println "  HadamardBench:   Primary factors, canonical products, factorization"
  IO.println "  HarmonicBench:   Laplacian, mean value, conjugate construction"
  IO.println "  PoissonBench:    Kernel grid, integral quadrature, convergence"
  IO.println "  DirichletBench:  FD solver, Jacobi iteration, FEM, comparison"

/-! ## Timing Wrapper (stub) -/

def timeBenchmark (name : String) (f : IO Unit) : IO Unit := do
  IO.println s!"Starting: {name}"
  f
  IO.println s!"Completed: {name}"

#eval "── Benchmark.FullSuite: Ready ──"
#eval "Full benchmark suite ready"
#eval "Run with: runFullSuite"

end MiniEntireHarmonic.Benchmark
