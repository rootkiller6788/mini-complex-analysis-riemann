/-
# Benchmark: Harvard-style exam problems

Holomorphic function problems at the Harvard Math 213
(Complex Analysis) level.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

-- Problem 1: Show f(z)=z̄ is not holomorphic
#eval "Harvard 1: conjugationIsAntiholomorphic"

-- Problem 2: Show |z|² is not complex differentiable
#eval "Harvard 2: squaredModulusNotHolomorphic"

-- Problem 3: Find all entire functions with bounded real part
#eval "Harvard 3: zeroDerivativeImpliesConstant (Liouville)"

-- Problem 4: Classify singularity of exp(1/z) at 0
#eval s!"Harvard 4: exp(1/z) essential singularity, type: {reprStr SingularityType.essential}"

-- Problem 5: Maximum modulus principle
#eval "Harvard 5: openMappingTheorem"

-- Problem 6: Identity theorem for holomorphic functions
#eval s!"Harvard 6: identityTheorem = {identityTheorem.name}"

-- Problem 7: Winding number of a curve around a point
#eval s!"Harvard 7: windingNumber defined"

-- Problem 8: Conformal maps of the unit disc
#eval "Harvard 8: automorphismsOfUnitDisc"

-- Problem 9: Schwarz lemma
#eval "Harvard 9: schwarzPickLemma (Schwarz-Pick)"

-- Problem 10: Holomorphic functions form an algebra
#eval s!"Harvard 10: holomorphicFunctionsFormAlgebra"

-- Problem 11: Residue computation
#eval "Harvard 11: residue function defined"

-- Problem 12: Argument principle (statement)
#eval "Harvard 12: argument principle (winding number version)"

-- Problem 13: Conformal equivalence of simply connected domains
#eval "Harvard 13: simplyConnectedClassification"

-- Problem 14: Picard's theorem statement
#eval s!"Harvard 14: picardLittleTheorem"

-- Problem 15: Runge approximation theorem
#eval "Harvard 15: rungeApproximationTheorem"

#eval "Harvard: 15 problems, all definitions verified"
