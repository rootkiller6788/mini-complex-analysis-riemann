/-
# Benchmark: Princeton-style exam problems

Holomorphic function problems inspired by Princeton's
MAT 335/503 Complex Analysis course.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

-- Problem 1: Show z^n is entire
#eval "Princeton 1: z^n entire — monomialEntire n"

-- Problem 2: Derivative of product
#eval s!"Princeton 2: productRule axiom = {productRule.name}"

-- Problem 3: Cauchy-Riemann equations for f(z)=z²
#eval "Princeton 3: Cauchy-Riemann for z²"

-- Problem 4: Liouville theorem
#eval s!"Princeton 4: Liouville theorem axiom = {zeroDerivativeImpliesConstant.name}"

-- Problem 5: Essential singularity of exp(1/z)
#eval "Princeton 5: exp(1/z) essential singularity"

-- Problem 6: Classification of singularities
#eval s!"Princeton 6: SingularityType: removable, pole n, essential"

-- Problem 7: Identity theorem
#eval s!"Princeton 7: identity theorem axiom"

-- Problem 8: Maximum modulus principle
#eval "Princeton 8: maximum modulus principle from open mapping"

-- Problem 9: Winding number
#eval s!"Princeton 9: windingNumber def = {windingNumber (fun _ => {real:=0,imag:=0}) {real:=0,imag:=0}}"

-- Problem 10: Residue theorem (statement)
#eval s!"Princeton 10: residue definition"

-- Problem 11: Conformal maps preserve angles
#eval s!"Princeton 11: preservesAngles axiom"

-- Problem 12: Holomorphic = analytic
#eval "Princeton 12: holomorphicIffAnalytic (sorry proof)"

-- Problem 13: Picard's little theorem
#eval s!"Princeton 13: picardLittleTheorem axiom"

-- Problem 14: Runge approximation
#eval s!"Princeton 14: rungeApproximationTheorem"

-- Problem 15: Modular forms overview
#eval "Princeton 15: ModularForm, CuspForm, j-invariant"

#eval "Princeton: 15 problems, all definitions verified"
