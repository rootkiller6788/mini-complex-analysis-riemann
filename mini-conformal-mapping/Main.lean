import MiniConformalMapping

open MiniConformalMapping

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniConformalMapping v0.1.0"
  IO.println "  Conformal Mapping Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Möbius transformations: PSL(2,ℂ)"
  IO.println s!"  Schwarz lemma and Schwarz-Pick lemma"
  IO.println s!"  Riemann mapping theorem"
  IO.println s!"  Conformal modulus of annuli"
  IO.println s!"  Uniformization of planar domains"
  IO.println s!"  Automorphisms of D and H"
  IO.println s!"  Schwarz-Christoffel mapping"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
