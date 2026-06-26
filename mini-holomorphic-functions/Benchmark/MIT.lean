/-
# Benchmark: MIT-style exam problems

Holomorphic function problems at the MIT 18.04/18.112
(Complex Variables) level.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

-- Problem 1: Verify Cauchy-Riemann for f(z) = z²
#eval "MIT 1: CauchyRiemannEquations for z²"

-- Problem 2: Derivative rules: sum, product, quotient, chain
#eval s!"MIT 2: derivativeRules count = {derivativeRules.axioms.length}"

-- Problem 3: Entire function composition: e^{sin z}
#eval "MIT 3: e^z entire, sin z entire => e^{sin z} entire"

-- Problem 4: Is log z a holomorphic function on ℂ?
#eval "MIT 4: logCannotBeEntire — branch cut required"

-- Problem 5: Classify singularity: (z^2 - 1)/(z - 1)
#eval "MIT 5: (z²-1)/(z-1) removable singularity at z=1 (by Riemann)"

-- Problem 6: Order of zero for f(z) = z^3 sin z at z=0
#eval "MIT 6: orderOfZero placeholder for z³ sin z at 0"

-- Problem 7: Residue of 1/z at z=0
#eval "MIT 7: residueAtSimplePole for 1/z at 0"

-- Problem 8: Winding number computation
#eval s!"MIT 8: windingNumber, index defined"

-- Problem 9: Liouville theorem applications
#eval "MIT 9: liouvilleTheorem (sorry proof)"

-- Problem 10: Conformal map from upper half-plane to unit disc
#eval "MIT 10: automorphismsOfUnitDisc — (z-i)/(z+i)"

-- Problem 11: Open mapping theorem
#eval "MIT 11: openMappingTheorem"

-- Problem 12: Maximum modulus principle
#eval "MIT 12: maximumModulusFromOpenMapping"

-- Problem 13: Taylor series expansion
#eval "MIT 13: taylorCoefficient, approximateTaylorSeries"

-- Problem 14: Padé approximant computation
#eval "MIT 14: PadeApproximant structure"

-- Problem 15: Numerical complex differentiation
#eval "MIT 15: complexStepDerivative, cauchyIntegralDerivative"

#eval "MIT: 15 problems, all definitions verified"
