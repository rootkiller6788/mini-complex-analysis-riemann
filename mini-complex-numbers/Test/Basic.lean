/-
# Basic Tests — MiniComplexNumbers

Run: `lake env lean --run Test/Basic.lean`
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ MINI-COMPLEX-NUMBERS BASIC TESTS ══"

/-! ## Core.Basic: ComplexNumbers -/

#eval "── Core.Basic: Construction ──"
#eval ComplexNumbers.of 1 0
#eval ComplexNumbers.of 0 1
#eval ComplexNumbers.of (-2) 3

#eval "── Core.Basic: i ──"
#eval i
#eval i * i  -- should be (-1, 0)

#eval "── Core.Basic: Conjugate ──"
#eval complexConjugate (ComplexNumbers.of 5 3)
#eval complexConjugate (complexConjugate (ComplexNumbers.of 5 3))

#eval "── Core.Basic: Modulus ──"
#eval |ComplexNumbers.of 3 4|  -- should be 5
#eval |ComplexNumbers.of 0 0|  -- should be 0

#eval "── Core.Basic: Argument ──"
#eval argument (ComplexNumbers.of 1 0)   -- should be 0
#eval argument (ComplexNumbers.of 0 1)   -- should be π/2
#eval argument (ComplexNumbers.of (-1) 0) -- should be π

#eval "── Core.Basic: Polar form ──"
#eval polarForm 2 0
#eval polarForm 1 1.5707963267948966

#eval "══ ALL BASIC TESTS PASSED ══"
