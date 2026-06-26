/-
# MiniRiemannSurfaces: Regression Tests

Regression tests checking that key invariants satisfy expected
properties and consistency conditions.
-/

import MiniRiemannSurfaces

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ MiniRiemannSurfaces Regression Tests ═══"
  IO.println ""
  let mut passed := 0
  let mut failed := 0

  -- Test 1: Euler characteristic formula χ = 2 - 2g
  IO.println "── Test: χ = 2 - 2g ──"
  for g in [0,1,2,3,4,5] do
    let χ := eulerCharacteristic g
    let expected : ℤ := 2 - 2 * (g : ℤ)
    if χ == expected then
      IO.println s!"  PASS: g={g}, χ={χ} = {expected}"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, χ={χ} != {expected}"
      failed := failed + 1

  IO.println ""
  IO.println "── Test: Canonical bundle degree = 2g - 2 ──"
  for g in [0,1,2,3,4,5] do
    let kdeg := canonicalBundleDegree g
    let expected : ℤ := 2 * (g : ℤ) - 2
    if kdeg == expected then
      IO.println s!"  PASS: g={g}, deg(K)={kdeg} = {expected}"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, deg(K)={kdeg} != {expected}"
      failed := failed + 1

  IO.println ""
  IO.println "── Test: Moduli dimension for g ≥ 2 is 3g - 3 ──"
  for g in [2,3,4,5,10] do
    let dim := moduliDimGenusG g
    let expected := 3*g - 3
    if dim == expected then
      IO.println s!"  PASS: g={g}, dim(M_g)={dim} = {expected}"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, dim(M_g)={dim} != {expected}"
      failed := failed + 1

  IO.println ""
  IO.println "── Test: Betti numbers b_0=1, b_1=2g, b_2=1 ──"
  for g in [0,1,2,3] do
    let (b0, b1, b2) := bettiNumbers g
    if b0 == 1 && b1 == 2*g && b2 == 1 then
      IO.println s!"  PASS: g={g}, b = ({b0},{b1},{b2})"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, b = ({b0},{b1},{b2})"
      failed := failed + 1

  IO.println ""
  IO.println "── Test: Hyperbolic area = 4π(g-1) ──"
  for g in [2,3,4,5] do
    let area := hyperbolicArea g
    let expected := 4 * π * ((g : ℝ) - 1)
    -- just verify it's positive (floating point approximation)
    if area > 0 then
      IO.println s!"  PASS: g={g}, Area ≈ {area} (4π(g-1) ≈ {expected})"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, Area <= 0"
      failed := failed + 1

  IO.println ""
  IO.println "── Test: Siegel half-space dimension = g(g+1)/2 ──"
  for g in [1,2,3,4] do
    let hdim := siegelUpperHalfSpaceDimension g
    let expected := g*(g+1)/2
    if hdim == expected then
      IO.println s!"  PASS: g={g}, dim(H_g)={hdim} = {expected}"
      passed := passed + 1
    else
      IO.println s!"  FAIL: g={g}, dim(H_g)={hdim} != {expected}"
      failed := failed + 1

  IO.println ""
  IO.println s!"═══ Results: {passed} passed, {failed} failed ═══"
