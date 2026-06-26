/-
# Computation: Evaluate

Comprehensive evaluation of the complex numbers package.
Runs all #eval tests from all submodules.
-/

import MiniComplexNumbers
import MiniComplexNumbers.Computation.Algorithms
import MiniComplexNumbers.Computation.DecisionProcedures

open MiniComplexNumbers

#eval "═══════════════════════════════════════"
#eval "  COMPREHENSIVE EVALUATION"
#eval "═══════════════════════════════════════"

/-! ## Core Evaluations -/

#eval "── Core.Basic ──"
#eval ComplexNumbers.of 1 0
#eval i
#eval i * i
#eval complexConjugate (ComplexNumbers.of 3 4)
#eval |ComplexNumbers.of 3 4|
#eval argument (ComplexNumbers.of 1 1)
#eval nthRootsOfUnity 4

#eval "── Core.Laws ──"
#eval polarDecomposition (ComplexNumbers.of 3 4)
#eval cis 3.141592653589793

#eval "── Core.Objects ──"
#eval describe ComplexNumbers
#eval isOnUnitCircle S1_example

/-! ## Morphism Evaluations -/

#eval "── Morphisms ──"
#eval conjugationAutomorphism.forward (ComplexNumbers.of 5 7)
#eval stereographicProject (ComplexNumbers.of 1 0)

/-! ## Construction Evaluations -/

#eval "── Constructions ──"
#eval projectToQuotientByReal (ComplexNumbers.of 7 3)
#eval isInUpperHalfPlane (ComplexNumbers.of 2 3)
#eval rootsOfX2plus1

/-! ## Property Evaluations -/

#eval "── Properties ──"
#eval globalInvariants
#eval knownSubfields

/-! ## Example Evaluations -/

#eval "── Examples ──"
#eval fourthRootsOfUnity
#eval onePlusiModulus
#eval modExample1

/-! ## Bridge Evaluations -/

#eval "── Bridges ──"
#eval galoisGroup
#eval chordalMetric (ExtendedComplex.finite (ComplexNumbers.of 1 0)) ExtendedComplex.infinity
#eval principalSqrt (ComplexNumbers.of (-1) 0)

/-! ## Algorithm Evaluations -/

#eval "── Algorithms ──"
#eval hornerEval [ComplexNumbers.of 1 0, ComplexNumbers.of 0 0, ComplexNumbers.of 1 0] i
#eval isRootOfUnity (ComplexNumbers.of 0 1) 4

#eval "═══════════════════════════════════════"
#eval "  ALL EVALUATIONS COMPLETE"
#eval "═══════════════════════════════════════"

end MiniComplexNumbers
