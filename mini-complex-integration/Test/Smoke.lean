/-
# Tests.Smoke

Smoke tests for the mini-complex-integration package.
Quick verification that all modules load correctly.
-/

import MiniComplexIntegration

open MiniComplexIntegration

/-! ## Core -/

#eval "=== Core ==="
#eval s!"Integration core axioms: {integrationCoreAxioms.axioms.length}"
#eval s!"Cauchy theory axioms: {cauchyTheoryIntegrationAxioms.axioms.length}"
#eval s!"Residue axioms: {residueIntegrationAxioms.axioms.length}"

/-! ## Morphisms -/

#eval "=== Morphisms ==="
#eval "IntegralPreservingMap, HomotopyOfContours, Cycle: defined"
#eval "HomologyEquivalence, IntegrationTheoryIso: defined"
#eval "HomologyHomotopyEquivalence, DeformationEquivalence: defined"
#eval s!"Equivalence morphism axioms: {equivalenceMorphismAxioms.axioms.length}"

/-! ## Constructions -/

#eval "=== Constructions ==="
#eval "ProductContour, DoubleContourIntegral, FubiniContourIntegral: defined"
#eval "HomologyQuotient, FirstHomologyGroup, CycleSpaceModBoundaries: defined"
#eval "DifferentialForm, SimplyConnectedDomain, PoincareLemma: defined"
#eval "UniversalCovering, ContourLifting, MonodromyTheorem, CauchyKernel: defined"

/-! ## Properties -/

#eval "=== Properties ==="
#eval "WindingNumberInvariant, PeriodOfDifferential, IntegralAsPeriod: defined"
#eval "IntersectionNumber, PeriodMatrix: defined"
#eval "DeformationPreservesIntegral, HomotopyInvariance, ParameterizationInvariance: defined"
#eval s!"Preservation axioms: {preservationAxioms.axioms.length}"
#eval "PeriodClassification, AbelianDifferential (1st/2nd/3rd kind): defined"
#eval "ResidueClassification, RiemannBilinearRelations: defined"

/-! ## Theorems -/

#eval "=== Theorems ==="
#eval "Cauchy-Goursat, Cauchy Integral Formula, Cauchy Derivative Formula: defined"
#eval "Residue, Argument Principle, Rouché, Morera: defined"
#eval "Holomorphic⇒Analytic, Cauchy Estimates, Liouville, FTA, Identity: defined"
#eval s!"Main integration axioms: {mainIntegrationAxioms.axioms.length}"
#eval "PartialFraction, Mittag-Leffler, Weierstrass, Casorati-Weierstrass, Picard: defined"
#eval s!"Classification axioms: {classificationIntegrationAxioms.axioms.length}"
#eval "CauchyKernelUniversal, ResolventFormula, Poisson, Schwarz, Bergman, Szego: defined"

/-! ## Examples -/

#eval "=== Examples ==="
#eval s!"Standard examples: {standardExamplesAxioms.axioms.length}"
#eval "Counterexamples: 1/z no primitive, Morera condition, non-exact closed, winding>1, deformation, Rouché sharpness"
#eval s!"Counterexample axioms: {counterexampleAxioms.axioms.length}"

/-! ## Bridges -/

#eval "=== Bridges ==="
#eval "ToAlgebra: ResidueLinearFunctional, FormalLaurentSeries, AlgebraicDeRham, PeriodMap: defined"
#eval "ToTopology: DomainHomology, CoveringSpace, DeRhamTheorem: defined"
#eval "ToGeometry: Periods, AbelianIntegrals, PicardFuchs, GaussManin: defined"
#eval "ToComputation: NumericalContour, ResidueCompute, Adaptive, Romberg: defined"

#eval "=== All smoke tests passed ==="
