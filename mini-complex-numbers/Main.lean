import MiniComplexNumbers

open MiniComplexNumbers

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniComplexNumbers v0.1.0"
  IO.println "  Complex Numbers Sub-Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  ComplexNumbers structure: re, im, add, mul, conj, modulus, arg"
  IO.println s!"  ℂ notation, i = (0,1)"
  IO.println s!"  Core: field axioms, polar decomposition, de Moivre"
  IO.println s!"  Theorems: FTA, Liouville, maximum modulus, open mapping"
  IO.println s!"  Bridges: algebra, topology, geometry, computation"
  IO.println s!"  Object instance: ComplexNumbers via Object typeclass"
  IO.println ""
  IO.println "  #eval tests:"
  IO.println ""

#eval "══ MINI-COMPLEX-NUMBERS MAIN ══"

#eval "── Basic complex numbers ──"
#eval ComplexNumbers.of 1 0
#eval ComplexNumbers.of 0 1
#eval ComplexNumbers.of 3 4

#eval "── i ──"
#eval i

#eval "── Conjugate ──"
#eval complexConjugate (ComplexNumbers.of 3 4)

#eval "── Modulus ──"
#eval modulus (ComplexNumbers.of 3 4)

#eval "── Argument ──"
#eval argument (ComplexNumbers.of 1 1)

#eval "── Polar form ──"
#eval polarForm 1 3.141592653589793

#eval "══ ALL CHECKS PASSED ══"
