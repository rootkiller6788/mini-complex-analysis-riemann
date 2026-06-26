/-
# MiniEntireHarmonic: Run Benchmarks Script

Script to run the full benchmark suite for the mini-entire-harmonic package.
Times and reports on entire function operations, Hadamard factorization,
harmonic functions, Poisson kernel, and Dirichlet problem solving.
-/

import MiniEntireHarmonic.Benchmark.FullSuite

open MiniEntireHarmonic.Benchmark

def main : IO Unit := do
  IO.println "═══════════════════════════════════════════"
  IO.println "  MINI-ENTIRE-HARMONIC BENCHMARK RUNNER"
  IO.println "═══════════════════════════════════════════"
  IO.println ""
  IO.println "Running all benchmarks..."
  IO.println ""

  -- Print summary first
  benchmarkSummary
  IO.println ""

  -- Run individual benchmarks
  IO.println "── EntireOpsBench ──"
  benchExpEval
  benchSinEval
  benchExpOrder
  benchPoissonKernel 500

  IO.println ""
  IO.println "── HadamardBench ──"
  benchFactorizationCheck entireExpZ 200
  benchHadamardProduct 100

  IO.println ""
  IO.println "── HarmonicBench ──"
  benchLaplacian (fun z => z.re) 300
  benchMeanValue (fun z => z.re) 200
  benchHarmonicConjugate 200

  IO.println ""
  IO.println "── PoissonBench ──"
  benchPoissonIntegral 100 20

  IO.println ""
  IO.println "── DirichletBench ──"
  benchFDLaplacian (fun z => z.re) 200

  IO.println ""
  IO.println "═══════════════════════════════════════════"
  IO.println "  ALL BENCHMARKS COMPLETE"
  IO.println "═══════════════════════════════════════════"

#eval "── scripts/run_benchmarks.lean ──"
#eval "Benchmark runner script ready"
#eval "Execute via `main` function or `#eval` individual benchmarks"

end MiniEntireHarmonic.Benchmark
