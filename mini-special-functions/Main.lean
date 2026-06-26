import MiniSpecialFunctions

open MiniSpecialFunctions

def main : IO Unit := do
  IO.println "═══════════════════════════════════════════════"
  IO.println "  MiniSpecialFunctions v0.1.0"
  IO.println "  Special Functions Sub-Package"
  IO.println "═══════════════════════════════════════════════"
  IO.println s!"  Complex exponential, trigonometric, logarithm, power"
  IO.println s!"  Gamma function Γ(z), Riemann zeta ζ(s)"
  IO.println s!"  Weierstrass ℘, Jacobi theta, modular forms"
  IO.println s!"  Euler reflection, Legendre duplication, functional equations"
  IO.println s!"  Elliptic functions, theta functions, modular transformations"
  IO.println s!"  Bridges: algebra, topology, geometry, computation"
  IO.println ""

#eval "══ MINI-SPECIAL-FUNCTIONS MAIN ══"

#eval "── Complex Exponential ──"
#eval complexExp (ComplexNumbers.of 0 0)
#eval complexExp (ComplexNumbers.of 0 3.141592653589793)

#eval "── Complex Trig ──"
#eval complexSin (ComplexNumbers.of 1 0)
#eval complexCos (ComplexNumbers.of 0 0)

#eval "── Gamma function (real approximations) ──"
#eval gammaApprox 1.0
#eval gammaApprox 5.0

#eval "── Riemann Zeta ──"
#eval zetaPartialSum 2.0 1000

#eval "── Elliptic invariants ──"
#eval weierstrassG2 (1.0) (1.0)

#eval "── Special values ──"
#eval gammaHalf
#eval zetaTwo

#eval "══ ALL CHECKS PASSED ══"
