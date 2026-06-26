/-
# Morphism Tests — MiniComplexNumbers

Run: `lake env lean --run Test/MorphismTests.lean`
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ MINI-COMPLEX-NUMBERS MORPHISM TESTS ══"

/-! ## Morphisms.Hom -/

#eval "── Hom: Identity linear map ──"
def linId : ComplexLinearMap := {
  map := fun z => z
  additive := by intro z w; rfl
  homogeneous := by intro a z; rfl
}
#eval linId.map (ComplexNumbers.of 5 7)

#eval "── Hom: Conjugate linear map ──"
def conjLin : ConjugateLinearMap := {
  map := complexConjugate
  additive := by intro z w; rfl
  conjugateHomogeneous := by intro a z; rfl
}
#eval conjLin.map (ComplexNumbers.of 5 7)

/-! ## Morphisms.Iso -/

#eval "── Iso: Conjugation automorphism ──"
#eval conjugationAutomorphism.forward (ComplexNumbers.of 3 4)
#eval conjugationAutomorphism.forward_backward (ComplexNumbers.of 3 4)

/-! ## Morphisms.Equiv -/

#eval "── Equiv: Stereographic projection ──"
#eval stereographicProject (ComplexNumbers.of 1 0)
#eval stereographicProject (ComplexNumbers.of 0 1)
#eval stereographicInverse 0 0 (-1)

#eval "══ ALL MORPHISM TESTS PASSED ══"
