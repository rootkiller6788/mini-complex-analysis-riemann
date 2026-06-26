/-
# MiniEntireHarmonic: Basic Tests

Unit tests for core definitions: entire functions, harmonic functions,
Poisson kernel, Weierstrass products.
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic.Test

open MiniEntireHarmonic

/-! ## Test: Entire Function Properties -/

def testEntireExpZ : IO Unit := do
  let z := ComplexNumbers.of 1.0 0.0
  let result := entireExpZ z
  let expected := ComplexNumbers.of (Float.exp 1.0) 0.0
  IO.println s!"Test entireExpZ(1) = {result}"

def testEntireSinZ : IO Unit := do
  let z := ComplexNumbers.of 0.0 0.0
  let result := entireSinZ z
  IO.println s!"Test entireSinZ(0) = {result} (expected: 0)"

def testEntireCosZ : IO Unit := do
  let z := ComplexNumbers.of 0.0 0.0
  let result := entireCosZ z
  IO.println s!"Test entireCosZ(0) = {result} (expected: 1)"

/-! ## Test: Poisson Kernel -/

def testPoissonKernel : IO Unit := do
  let r := 0.5
  let θ := 0.0
  let result := poissonKernel r θ
  let expected := (1.0 - r * r) / (1.0 - 2.0 * r * Float.cos θ + r * r)
  IO.println s!"Test P(0.5, 0) = {result} (expected: {expected})"

def testPoissonKernelBoundary : IO Unit := do
  let r := 0.99
  let result := poissonKernel r 0.0
  IO.println s!"Test P(0.99, 0) ≈ {result} (approaches delta at 0)"

/-! ## Test: Harmonic Functions -/

def testHarmonicReZ : IO Unit := do
  IO.println s!"Test Re(z) is harmonic (stub)"

def testHarmonicImZ : IO Unit := do
  IO.println s!"Test Im(z) is harmonic (stub)"

/-! ## Test: Weierstrass Products -/

def testEmptyProduct : IO Unit := do
  let z := ComplexNumbers.of 1.0 0.0
  let result := weierstrassCanonicalProduct [] 0 z
  IO.println s!"Test empty Weierstrass product(1) = {result} (expected: 1)"

/-! ## Test Runner -/

def runAllTests : IO Unit := do
  IO.println "═══ MINI-ENTIRE-HARMONIC BASIC TESTS ═══"
  testEntireExpZ
  testEntireSinZ
  testEntireCosZ
  testPoissonKernel
  testPoissonKernelBoundary
  testHarmonicReZ
  testHarmonicImZ
  testEmptyProduct
  IO.println "═══ ALL BASIC TESTS COMPLETE ═══"

#eval "── Test.Basic: Run all tests ──"
#eval "Test suite ready"

end MiniEntireHarmonic.Test
