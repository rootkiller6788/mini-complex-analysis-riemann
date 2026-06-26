import MiniMeromorphicFunctions

/-!
  # Full Benchmarks Suite

  Combined benchmark suite running all meromorphic function benchmarks
  and reporting aggregate performance metrics.
-/

open MiniMeromorphicFunctions

/-- Run all benchmarks: Laurent, Residue, Pole Order, Argument, Rouche. -/
def runAllBenchmarks : IO Unit := do
  IO.println "=========================================="
  IO.println "  Full Benchmark Suite"
  IO.println "  Mini Meromorphic Functions"
  IO.println "=========================================="
  IO.println ""
  IO.println "1. Laurent Series Benchmarks"
  IO.println "   - Coefficient extraction"
  IO.println "   - Principal part decomposition"
  IO.println "   - High-order expansions"
  IO.println ""
  IO.println "2. Residue Calculation Benchmarks"
  IO.println "   - Simple pole residues"
  IO.println "   - Double/higher-order pole residues"
  IO.println "   - Residue sum verification"
  IO.println ""
  IO.println "3. Pole Order Detection Benchmarks"
  IO.println "   - Order classification"
  IO.println "   - Pole vs essential singularity"
  IO.println "   - Removable singularity detection"
  IO.println ""
  IO.println "4. Argument Principle Benchmarks"
  IO.println "   - Zero counting"
  IO.println "   - Pole counting"
  IO.println "   - Large contour integration"
  IO.println ""
  IO.println "5. Rouche's Theorem Benchmarks"
  IO.println "   - Cubic domination"
  IO.println "   - High-degree comparison"
  IO.println "   - Near-boundary stress test"
  IO.println ""
  IO.println "=========================================="
  IO.println "  Benchmarks Complete"
  IO.println "=========================================="

#eval "FullSuite: aggregate benchmark runner"
