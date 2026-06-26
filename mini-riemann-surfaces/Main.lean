import MiniRiemannSurfaces

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniRiemannSurfaces v0.1.0"
  IO.println "  Riemann Surfaces Package"
  IO.println "  Part of mini-complex-analysis-riemann"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Genus 0: Riemann sphere (ℂ̂)"
  IO.println s!"  Genus 1: Complex tori (elliptic curves)"
  IO.println s!"  Genus ≥2: Hyperbolic surfaces"
  IO.println s!"  Key theorems: Riemann-Roch, Abel, Jacobi, Uniformization"
  IO.println s!"  Bridges: Algebra (function fields), Topology (π₁, Teichmueller)"
  IO.println s!"  Bridges: Geometry (hyperbolic metric), Computation (period matrices)"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
