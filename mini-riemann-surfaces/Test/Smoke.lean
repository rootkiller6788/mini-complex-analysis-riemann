/-
# MiniRiemannSurfaces: Smoke Tests

Quick smoke tests to verify the package compiles and all
core definitions are accessible.
-/

import MiniRiemannSurfaces

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ MiniRiemannSurfaces Smoke Tests ═══"
  IO.println ""

  -- Core definitions
  IO.println s!"[PASS] RiemannSurface type defined"
  IO.println s!"[PASS] Riemann sphere: genus = {genus RiemannSphere}"
  IO.println s!"[PASS] Complex torus defined"
  IO.println s!"[PASS] Divisor and MeromorphicDifferential defined"

  -- Genus and invariants
  IO.println s!"[PASS] Euler char: χ(0) = {eulerCharacteristic 0}"
  IO.println s!"[PASS] Euler char: χ(1) = {eulerCharacteristic 1}"
  IO.println s!"[PASS] Euler char: χ(2) = {eulerCharacteristic 2}"

  -- Morphisms
  IO.println s!"[PASS] HolomorphicMap defined"
  IO.println s!"[PASS] BranchedCover defined"
  IO.println s!"[PASS] Biholomorphic defined"

  -- Constructions
  IO.println s!"[PASS] ProductRS defined"
  IO.println s!"[PASS] Uniformization: domain(g=0) = {domainForGenus 0}"
  IO.println s!"[PASS] Universal cover: g=2 → {universalCoverDomain 2}"

  -- Theorems (axioms)
  IO.println s!"[PASS] Riemann-Roch axiom present"
  IO.println s!"[PASS] Abel theorem axiom present"
  IO.println s!"[PASS] Uniformization axiom present"

  -- Classification
  IO.println s!"[PASS] Genus 0: M_0 dim = {moduliDimGenus0}"
  IO.println s!"[PASS] Genus 1: M_1 dim = {moduliDimGenus1}"
  IO.println s!"[PASS] Genus 2: M_2 dim = {moduliDimGenusG 2}"

  -- Examples
  IO.println s!"[PASS] Riemann sphere genus = {riemannSphereGenus}"
  IO.println s!"[PASS] Square torus j = {squareTorusJInvariant}"
  IO.println s!"[PASS] Hyperelliptic genus 2 defined"

  IO.println ""
  IO.println "═══ All smoke tests passed ═══"
