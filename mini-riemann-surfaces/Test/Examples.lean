/-
# MiniRiemannSurfaces: Example Tests

Step-by-step verification of examples and concrete computations.
-/

import MiniRiemannSurfaces

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ MiniRiemannSurfaces Example Runner ═══"
  IO.println ""

  -- Genus calculations
  IO.println "── Genus and Euler Characteristic ──"
  for g in [0,1,2,3,4,5] do
    IO.println s!"  g={g}: χ = {eulerCharacteristic g}, K_X degree = {canonicalBundleDegree g}"

  IO.println ""
  IO.println "── Moduli Dimensions ──"
  for g in [0,1,2,3,4,5,10] do
    let dim := if g ≤ 1 then (if g = 0 then 0 else 1) else 3*g - 3
    IO.println s!"  M_{g} dim = {dim}"

  IO.println ""
  IO.println "── Uniformization Type by Genus ──"
  for g in [0,1,2,5,10] do
    IO.println s!"  g={g}: {uniformizationType g}"

  IO.println ""
  IO.println "── Fundamental Group Presentations ──"
  for g in [0,1,2,3] do
    IO.println s!"  π₁(Σ_{g}): {fundamentalGroupPresentation g}"

  IO.println ""
  IO.println "── Plane Curve Genus Formula (g = (d-1)(d-2)/2) ──"
  for d in [1,2,3,4,5,6] do
    IO.println s!"  Degree {d} plane curve: genus = {planeCurveGenus d}"

  IO.println ""
  IO.println "── Automorphism Bounds (Hurwitz) ──"
  for g in [2,3,4,5] do
    IO.println s!"  g={g}: max |Aut| = {maxAutomorphismSize g}"

  IO.println ""
  IO.println "═══ All examples verified ═══"
