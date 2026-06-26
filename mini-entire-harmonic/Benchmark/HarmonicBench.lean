/-
# MiniEntireHarmonic: HarmonicBench

Benchmark for harmonic function operations:
Laplacian computation, mean value verification,
harmonic conjugate construction, harmonic map operations.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Morphisms.Iso

namespace MiniEntireHarmonic.Benchmark

open MiniEntireHarmonic

/-! ## Benchmark: Laplacian Computation -/

def benchLaplacian (u : ComplexNumbers → Float) (n : Nat) : IO Unit := do
  for i in List.range n do
    let z := ComplexNumbers.of (Float.ofNat i % 10 / 10.0) (Float.ofNat (i*7) % 10 / 10.0)
    let _ := LaplaceOperator u z
    pure ()
  IO.println s!"Benchmarked {n} Laplacian computations"

/-! ## Benchmark: Mean Value Property -/

def benchMeanValue (u : ComplexNumbers → Float) (n : Nat) : IO Unit := do
  for i in List.range n do
    let z := ComplexNumbers.of (Float.ofNat i % 10 / 10.0) 0.0
    let _ := meanValueOfHarmonic u z 1.0
    pure ()
  IO.println s!"Benchmarked {n} mean value computations"

/-! ## Benchmark: Harmonic Conjugate Construction -/

def benchHarmonicConjugate (n : Nat) : IO Unit := do
  for i in List.range n do
    let z := ComplexNumbers.of (Float.ofNat i % 10 / 10.0) 0.0
    let _ := harmonicConjugate (fun z' => z'.re) z
    pure ()
  IO.println s!"Benchmarked {n} harmonic conjugate computations"

/-! ## Benchmark: Holomorphic to Conjugate Pair -/

def benchHolomorphicToPair (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := holomorphicToConjugatePair entireExpZ
    pure ()
  IO.println s!"Benchmarked {n} holomorphic-to-conjugate-pair conversions"

/-! ## Benchmark Runner -/

def runHarmonicBench : IO Unit := do
  IO.println "═══ HARMONIC BENCHMARK ═══"
  benchLaplacian (fun z => z.re) 300
  benchMeanValue (fun z => z.re) 200
  benchHarmonicConjugate 200
  benchHolomorphicToPair 100
  IO.println "═══ HARMONIC BENCHMARK COMPLETE ═══"

#eval "── Benchmark.HarmonicBench: Ready ──"
#eval "Harmonic benchmark suite ready"

end MiniEntireHarmonic.Benchmark
