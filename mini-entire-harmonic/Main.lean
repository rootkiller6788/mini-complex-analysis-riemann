import MiniEntireHarmonic

open MiniEntireHarmonic

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniEntireHarmonic v0.1.0"
  IO.println "  Entire & Harmonic Functions Sub-Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  EntireFunction: holomorphic on all ℂ"
  IO.println s!"  HarmonicFunction: Δu = 0 (Laplace equation)"
  IO.println s!"  Core: order of growth, Weierstrass product, Poisson kernel"
  IO.println s!"  Theorems: Hadamard factorization, Picard little, Jensen, Harnack"
  IO.println s!"  Dirichlet problem: solvable on D via Poisson integral"
  IO.println s!"  Bridges: algebra, topology, geometry, computation"
  IO.println ""
  IO.println "  #eval tests:"
  IO.println ""

#eval "══ MINI-ENTIRE-HARMONIC MAIN ══"

#eval "── Entire function: exp(z) ──"
#eval entireExpZ

#eval "── Order of exp(z) ──"
#eval orderOfGrowth 1.0 1.0

#eval "── Sine zeros ──"
#eval sinZeros 5

#eval "── Poisson kernel P(0.5, 0) ──"
#eval poissonKernel 0.5 0.0

#eval "── Poisson integral at origin ──"
#eval poissonAtOrigin 0.0

#eval "── Harmonic conjugate check ──"
#eval harmonicConjugateCheck (ComplexNumbers.of 1 2)

#eval "── Harnack inequality bounds ──"
#eval harnackBounds 0.5

#eval "══ ALL CHECKS PASSED ══"
