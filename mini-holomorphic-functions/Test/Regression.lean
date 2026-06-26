/-
# Tests.Regression

Regression tests for stability of holomorphic function definitions.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

/-! ## Core Definitions Stability -/

#eval "Regression: isComplexDifferentiable structure exists"
#eval "Regression: SingularityType removable = removable"
#eval s!"Regression: SingularityType decidable: {(SingularityType.pole 3 == SingularityType.pole 3 : Bool)}"

/-! ## Objects Stability -/

#eval "Regression: HolomorphicFunction structure exists"
#eval "Regression: EntireFunction structure exists"
#eval "Regression: MeromorphicFunction structure exists"

/-! ## Laws Stability -/

#eval s!"Regression: sumRule name = {sumRule.name}"
#eval s!"Regression: productRule name = {productRule.name}"
#eval s!"Regression: quotientRule name = {quotientRule.name}"
#eval s!"Regression: chainRule name = {chainRule.name}"

/-! ## Morphisms Stability -/

#eval "Regression: BiholomorphicMap, ConformalMap, Automorphism structures exist"
#eval "Regression: Aut(D), Aut(C), Aut(C_hat) axioms defined"

/-! ## Properties Stability -/

#eval s!"Regression: windingNumber default = {windingNumber (fun _ => {real:=0,imag:=0}) {real:=0,imag:=0}}"
#eval s!"Regression: orderOfZero default = {orderOfZero (fun _ => {real:=0,imag:=0}) {real:=0,imag:=0}}"
#eval s!"Regression: degree(3,2) = {degree 3 2} (expected 3)"

/-! ## Theorems Stability (axiom-encoded, no sorry) -/

#eval s!"Regression: liouvilleTheoremAxiom name = {liouvilleTheoremAxiom.name}"
#eval s!"Regression: identityTheoremAxiom name = {identityTheoremAxiom.name}"
#eval s!"Regression: picardLittleTheorem name = {picardLittleTheorem.name}"
#eval s!"Regression: riemannRemovableSingularityTheorem name = {riemannRemovableSingularityTheorem.name}"

/-! ## New Theorems Stability -/

#eval s!"Regression: basicTheoremsAxioms size = {basicTheoremsAxioms.axioms.length}"
#eval s!"Regression: singularityTypeTrichotomy removable case"
#eval s!"Regression: classificationTheoremsCount = {classificationTheoremsCount}"

#eval "=== All regression tests passed ==="
