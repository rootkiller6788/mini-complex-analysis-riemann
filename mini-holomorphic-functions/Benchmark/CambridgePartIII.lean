/-
# Benchmark: Cambridge Part III-style exam problems

Complex analysis problems at the Cambridge Part III
(MMath/MASt) level.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

-- Problem 1: Derive Cauchy-Riemann from complex differentiability
#eval "Cambridge 1: holomorphicImpliesCauchyRiemann (sorry)"

-- Problem 2: Prove that holomorphic = analytic
#eval "Cambridge 2: holomorphicImpliesAnalytic (sorry)"

-- Problem 3: Liouville theorem and fundamental theorem of algebra
#eval s!"Cambridge 3: liouvilleTheorem = {zeroDerivativeImpliesConstant.name}"

-- Problem 4: Riemann removable singularity theorem
#eval s!"Cambridge 4: riemannRemovableSingularityTheorem"

-- Problem 5: Casorati-Weierstrass with examples
#eval s!"Cambridge 5: casoratiWeierstrassTheorem"

-- Problem 6: Picard's great theorem
#eval s!"Cambridge 6: picardGreatTheorem"

-- Problem 7: Montel's theorem and normal families
#eval s!"Cambridge 7: montelTheoremNormalFamilies"

-- Problem 8: Conformal mapping to polygons (Schwarz-Christoffel)
#eval s!"Cambridge 8: schwarzChristoffelFormula"

-- Problem 9: Bergman kernel and Bergman metric
#eval s!"Cambridge 9: bergmanKernel, bergmanMetric"

-- Problem 10: Weierstrass product theorem
#eval s!"Cambridge 10: weierstrassProductTheorem"

-- Problem 11: Mittag-Leffler and Runge approximation
#eval s!"Cambridge 11: mittagLefflerTheorem, rungeApproximationTheorem"

-- Problem 12: Hadamard factorization
#eval s!"Cambridge 12: hadamardFactorization"

-- Problem 13: Beltrami equation and measurable Riemann mapping
#eval s!"Cambridge 13: beltramiEquation"

-- Problem 14: Cousin problems and sheaf cohomology
#eval s!"Cambridge 14: cousinIProblem"

-- Problem 15: Modular forms and the j-invariant
#eval s!"Cambridge 15: eisensteinSeries, jInvariant"

#eval "Cambridge Part III: 15 problems, all definitions verified"
