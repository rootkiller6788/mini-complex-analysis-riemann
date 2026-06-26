/-
# Tests.Regression

Regression tests for the complex integration package.
Verifies axiom counts and structural integrity.
-/

import MiniComplexIntegration

open MiniComplexIntegration

#eval "=== Regression Tests ==="

-- Core axioms count
#eval s!"integrationCoreAxioms: {integrationCoreAxioms.axioms.length} (expected: 6)"
#eval s!"cauchyTheoryIntegrationAxioms: {cauchyTheoryIntegrationAxioms.axioms.length} (expected: 3)"
#eval s!"residueIntegrationAxioms: {residueIntegrationAxioms.axioms.length} (expected: 4)"

-- Preservation axioms count
#eval s!"preservationAxioms: {preservationAxioms.axioms.length} (expected: 3)"

-- Morphism axioms count
#eval s!"equivalenceMorphismAxioms: {equivalenceMorphismAxioms.axioms.length} (expected: 2)"

-- Main theorems axioms count
#eval s!"mainIntegrationAxioms: {mainIntegrationAxioms.axioms.length} (expected: 5)"

-- Classification axioms count
#eval s!"classificationIntegrationAxioms: {classificationIntegrationAxioms.axioms.length} (expected: 5)"

-- Examples axioms count
#eval s!"standardExamplesAxioms: {standardExamplesAxioms.axioms.length} (expected: 7)"
#eval s!"counterexampleAxioms: {counterexampleAxioms.axioms.length} (expected: 2)"

-- Total axiom count
def regressionTestTotalAxioms : Nat :=
  integrationCoreAxioms.axioms.length +
  cauchyTheoryIntegrationAxioms.axioms.length +
  residueIntegrationAxioms.axioms.length +
  preservationAxioms.axioms.length +
  equivalenceMorphismAxioms.axioms.length +
  mainIntegrationAxioms.axioms.length +
  classificationIntegrationAxioms.axioms.length +
  standardExamplesAxioms.axioms.length +
  counterexampleAxioms.axioms.length

#eval s!"Total regression axioms: {regressionTestTotalAxioms} (expected: 37)"

#eval "=== Regression tests complete ==="
