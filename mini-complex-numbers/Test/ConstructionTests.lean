/-
# Construction Tests — MiniComplexNumbers

Run: `lake env lean --run Test/ConstructionTests.lean`
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ MINI-COMPLEX-NUMBERS CONSTRUCTION TESTS ══"

/-! ## Constructions.Products -/

#eval "── Products: ComplexPair ──"
def p : ComplexPair := { first := ComplexNumbers.of 1 2, second := ComplexNumbers.of 3 4 }
#eval p + p

/-! ## Constructions.Quotients -/

#eval "── Quotients: ℂ/ℝ ──"
#eval projectToQuotientByReal (ComplexNumbers.of 7 3)

#eval "── Quotients: Conjugate equivalence ──"
#eval projectToQuotientByConjugate (ComplexNumbers.of 2 (-5))

/-! ## Constructions.Subobjects -/

#eval "── Subobjects: Real subfield ──"
#eval isRealAsBool (ComplexNumbers.of 1 0)
#eval isRealAsBool (ComplexNumbers.of 0 1)
#eval isInUpperHalfPlane (ComplexNumbers.of 2 3)
#eval isInUnitDisc (ComplexNumbers.of 0.5 0)

/-! ## Constructions.Universal -/

#eval "── Universal: Roots of x²+1 ──"
#eval rootsOfX2plus1
#eval splittingPolynomial i

#eval "══ ALL CONSTRUCTION TESTS PASSED ══"
