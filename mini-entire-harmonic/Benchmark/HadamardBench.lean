/-
# MiniEntireHarmonic: HadamardBench

Benchmark for Hadamard factorization operations:
primary factor computation, canonical products,
factorization construction and verification.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Constructions.Products

namespace MiniEntireHarmonic.Benchmark

open MiniEntireHarmonic

/-! ## Benchmark: Primary Factor Computation -/

def benchPrimaryFactor (n : Nat) : IO Unit := do
  for i in List.range n do
    let z := ComplexNumbers.of (Float.ofNat i % 10 / 10.0) 0.0
    let _ := primaryFactorExp z (i % 5)
    pure ()
  IO.println s!"Benchmarked {n} primary factor computations"

/-! ## Benchmark: Weierstrass Canonical Product -/

def benchWeierstrassProduct (zeros : List ComplexNumbers) (genus : Nat) (n : Nat) : IO Unit := do
  let f := weierstrassCanonicalProduct zeros genus
  for i in List.range n do
    let z := ComplexNumbers.of (Float.ofNat i % 10 / 10.0) 0.0
    let _ := f z
    pure ()
  IO.println s!"Benchmarked {n} canonical product evaluations"

/-! ## Benchmark: Hadamard Product Construction -/

def benchHadamardProduct (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := hadamardProduct entireExpZ entireSinZ
    pure ()
  IO.println s!"Benchmarked {n} Hadamard product constructions"

/-! ## Benchmark: Factorization Verification -/

def benchFactorizationCheck (f : EntireFunction) (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := classificationByOrder f
    pure ()
  IO.println s!"Benchmarked {n} factorization classifications"

/-! ## Benchmark Runner -/

def runHadamardBench : IO Unit := do
  IO.println "═══ HADAMARD BENCHMARK ═══"
  benchPrimaryFactor 500
  benchWeierstrassProduct [] 0 200
  benchHadamardProduct 100
  benchFactorizationCheck entireExpZ 200
  IO.println "═══ HADAMARD BENCHMARK COMPLETE ═══"

#eval "── Benchmark.HadamardBench: Ready ──"
#eval "Hadamard benchmark suite ready"

end MiniEntireHarmonic.Benchmark
