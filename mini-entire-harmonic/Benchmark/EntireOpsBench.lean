/-
# MiniEntireHarmonic: EntireOpsBench

Benchmark for basic entire function operations: evaluation,
composition, differentiation stubs, growth rate computation.
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic.Benchmark

open MiniEntireHarmonic

/-! ## Benchmark: Entire Function Evaluation -/

def benchEntireEval (f : EntireFunction) (n : Nat) : IO Unit := do
  let z := ComplexNumbers.of 1.0 0.0
  for _ in List.range n do
    let _ := f z
    pure ()
  IO.println s!"Benchmarked {n} evaluations of entire function"

def benchExpEval : IO Unit := benchEntireEval entireExpZ 1000
def benchSinEval : IO Unit := benchEntireEval entireSinZ 1000
def benchCosEval : IO Unit := benchEntireEval entireCosZ 1000

/-! ## Benchmark: Order of Growth Computation -/

def benchOrderComputation (f : EntireFunction) (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := orderInvariant f
    pure ()
  IO.println s!"Benchmarked {n} order computations"

def benchExpOrder : IO Unit := benchOrderComputation entireExpZ 500
def benchSinOrder : IO Unit := benchOrderComputation entireSinZ 500

/-! ## Benchmark: Poisson Kernel -/

def benchPoissonKernel (n : Nat) : IO Unit := do
  for i in List.range n do
    let r := 0.5
    let θ := Float.ofNat i * 0.01
    let _ := poissonKernel r θ
    pure ()
  IO.println s!"Benchmarked {n} Poisson kernel evaluations"

/-! ## Benchmark Runner -/

def runEntireOpsBench : IO Unit := do
  IO.println "═══ ENTIRE OPS BENCHMARK ═══"
  benchExpEval
  benchSinEval
  benchCosEval
  benchExpOrder
  benchSinOrder
  benchPoissonKernel 500
  IO.println "═══ ENTIRE OPS BENCHMARK COMPLETE ═══"

#eval "── Benchmark.EntireOpsBench: Ready ──"
#eval "Entire ops benchmark suite ready"

end MiniEntireHarmonic.Benchmark
