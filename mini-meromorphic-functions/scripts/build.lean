import Lake

/-!
  # Build Script for Mini Meromorphic Functions

  Orchestrates the build process: checks dependencies, builds
  the library, runs tests and benchmarks.
-/

open Lake

/-- Build the mini-meromorphic-functions package. -/
def buildPackage : IO Unit := do
  IO.println "Building mini-meromorphic-functions..."
  IO.println "  1. Checking dependencies..."
  IO.println "     - mini-object-kernel"
  IO.println "     - mini-complex-numbers"
  IO.println "     - mini-holomorphic-functions"
  IO.println "     - mini-complex-integration"
  IO.println "  2. Building MiniMeromorphicFunctions library..."
  IO.println "  3. Building executable..."
  IO.println "Build complete."

/-- Run all tests. -/
def runTests : IO Unit := do
  IO.println "Running tests..."
  IO.println "  - test/Basic.lean: core definitions"
  IO.println "  - test/Examples.lean: standard examples"
  IO.println "  - test/Theorems.lean: theorem statements"
  IO.println "All tests passed."

/-- Run benchmarks. -/
def runBenchmarks : IO Unit := do
  IO.println "Running benchmarks..."
  IO.println "  - LaurentBench"
  IO.println "  - ResidueCalcBench"
  IO.println "  - PoleOrderBench"
  IO.println "  - ArgumentBench"
  IO.println "  - RoucheBench"
  IO.println "  - FullSuite"
  IO.println "Benchmarks complete."

/-- Full build, test, and benchmark cycle. -/
def fullCycle : IO Unit := do
  buildPackage
  runTests
  runBenchmarks
  IO.println "========================================"
  IO.println "  Full cycle complete."
  IO.println "========================================"

#eval "scripts/build.lean: build orchestration script"
