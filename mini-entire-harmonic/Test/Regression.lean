/-
# MiniEntireHarmonic: Regression Tests

Regression tests for edge cases: infinite order, zero radius,
Poisson at origin, degenerate Weierstrass products, boundary
behavior of harmonic functions.
-/

import MiniEntireHarmonic.Examples.Counterexamples
import MiniEntireHarmonic.Properties.Invariants

namespace MiniEntireHarmonic.Test

open MiniEntireHarmonic

/-! ## Regression: Infinite Order Case -/

def testDoubleExpOrder : IO Unit := do
  let ρ := orderInvariant entireExpExpZ
  IO.println s!"Test: e^{e^z} order = {ρ} (expected: ∞, stub returns 0)"

def testDoubleExpValue : IO Unit := do
  let z := ComplexNumbers.of 0.0 0.0
  let result := entireExpExpZ z
  IO.println s!"Test: e^{e^0} = e^1 ≈ {result}"

/-! ## Regression: Poisson at r=0 -/

def testPoissonAtOriginAll : IO Unit := do
  let r := 0.0
  let θ := 0.0
  let result := poissonKernel r θ
  IO.println s!"Test: P(0, θ) = {result} (expected: 1)"

def testPoissonAtBoundary : IO Unit := do
  let r := 1.0  -- |z|=1
  let result := poissonKernel r 0.0
  IO.println s!"Test: P(1, 0) = {result} (expected: 0 since r=1 not < 1)"

/-! ## Regression: Degenerate Weierstrass Product -/

def testEmptyZeroSet : IO Unit := do
  let f := weierstrassCanonicalProduct [] 0
  let z := ComplexNumbers.of 3.0 4.0
  IO.println s!"Test: empty zero set product(3+4i) = {f z} (expected: 1)"

def testZeroAtOrigin : IO Unit := do
  let z := ComplexNumbers.of 0.0 0.0
  IO.println s!"Test: product with zero at origin (stub)"

/-! ## Regression: Harmonic Boundary Behavior -/

def testHarmonicAtBoundary : IO Unit := do
  let z := ComplexNumbers.of 0.99 0.0
  let result := poissonKernel 0.99 0.0
  IO.println s!"Test: P(0.99, 0) = {result} (should be large ~ 100)"

def testNonHarmonicCase : IO Unit := do
  -- x² is not harmonic
  let z := ComplexNumbers.of 1.0 0.0
  let result := trueProductNotHarmonic z
  IO.println s!"Test: x² at (1,0) = {result} (expected: 1, but not harmonic)"

/-! ## Regression: Growth Order Edge Cases -/

def testOrderZero : IO Unit := do
  IO.println s!"Test: order 0 entire functions (genus 0)"

def testOrderInfinity : IO Unit := do
  IO.println s!"Test: infinite order entire functions (no Hadamard factorization)"

def testOrderNonInteger : IO Unit := do
  let ρ := 0.5  -- non-integer order
  let g := genusFromOrder ρ
  IO.println s!"Test: genus from order {ρ} = {g} (expected: 0)"

def runRegressionTests : IO Unit := do
  IO.println "═══ MINI-ENTIRE-HARMONIC REGRESSION TESTS ═══"
  testDoubleExpOrder
  testDoubleExpValue
  testPoissonAtOriginAll
  testPoissonAtBoundary
  testEmptyZeroSet
  testZeroAtOrigin
  testHarmonicAtBoundary
  testNonHarmonicCase
  testOrderZero
  testOrderInfinity
  testOrderNonInteger
  IO.println "═══ ALL REGRESSION TESTS COMPLETE ═══"

#eval "── Test.Regression: Run all regression tests ──"
#eval "Regression test suite ready"

end MiniEntireHarmonic.Test
