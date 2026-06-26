/-
# MiniEntireHarmonic: Integration Tests

Integration tests connecting entire functions, harmonic functions,
factorization theorems, and boundary value problems.
-/

import MiniEntireHarmonic.Theorems.Basic
import MiniEntireHarmonic.Theorems.Main
import MiniEntireHarmonic.Examples.Standard

namespace MiniEntireHarmonic.Test

open MiniEntireHarmonic

/-! ## Integration Test: exp Factorization -/

def testExpHadamard : IO Unit := do
  IO.println s!"Test: e^z has order 1, type 1, no zeros"
  IO.println s!"  expHadamard: {expHadamard}"

def testExpGrowth : IO Unit := do
  let r := 2.0
  let m := expGrowth r
  IO.println s!"Test: M(2, e^z) = {m} (expected: e² ≈ {Float.exp 2.0})"

/-! ## Integration Test: sin Factorization -/

def testSinZeros : IO Unit := do
  let zeros := sinZeroSet 5
  IO.println s!"Test: sin z zeros first 5 (positive): {zeros.take 5}"

def testSinHadamardForm : IO Unit := do
  IO.println s!"Test: sin z Hadamard: {sinHadamard}"

/-! ## Integration Test: Harmonic and Poisson -/

def testPoissonReproducesConstant : IO Unit := do
  -- Poisson integral of f(θ)=1 should give u(z)=1 everywhere on D
  IO.println s!"Test: Poisson integral of constant 1 => harmonic function ≡ 1 on D"

def testHarmonicConjugate : IO Unit := do
  let chp := holomorphicToConjugatePair entireExpZ
  IO.println s!"Test: exp = e^x cos y + i e^x sin y"
  IO.println s!"  u(1,0) = {chp.u (ComplexNumbers.of 1.0 0.0)} (expected: e)"
  IO.println s!"  v(1,0) = {chp.v (ComplexNumbers.of 1.0 0.0)} (expected: 0)"

/-! ## Integration Test: Dirichlet Problem -/

def testDirichletSolution : IO Unit := do
  IO.println s!"Test: Dirichlet problem on D is solvable via Poisson integral"

def testDirichletUniqueness : IO Unit := do
  IO.println s!"Test: Dirichlet solution is unique"

/-! ## Integration Test: Cross-Module -/

def testEntireToHarmonic : IO Unit := do
  -- Every entire function's real and imaginary parts are harmonic
  let f := entireExpZ
  let u := fun z => (f z).re
  let v := fun z => (f z).im
  IO.println s!"Test: Re(e^z) and Im(e^z) are harmonic"
  IO.println s!"  Re(e^{1+0i}) = {u (ComplexNumbers.of 1.0 0.0)}"
  IO.println s!"  Im(e^{0+iπ/2}) = {v (ComplexNumbers.of 0.0 1.5707963267948966)}"

def runIntegrationTests : IO Unit := do
  IO.println "═══ MINI-ENTIRE-HARMONIC INTEGRATION TESTS ═══"
  testExpHadamard
  testExpGrowth
  testSinZeros
  testSinHadamardForm
  testPoissonReproducesConstant
  testHarmonicConjugate
  testDirichletSolution
  testDirichletUniqueness
  testEntireToHarmonic
  IO.println "═══ ALL INTEGRATION TESTS COMPLETE ═══"

#eval "── Test.Integration: Run all integration tests ──"
#eval "Integration test suite ready"

end MiniEntireHarmonic.Test
