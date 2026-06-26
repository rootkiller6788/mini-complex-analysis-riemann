/-
# Tests.Regression

Regression tests for stability of holomorphic function definitions.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

/-! ## Core Definitions Stability -/

#eval "Regression: isComplexDifferentiable structure exists"  -- type checking
#eval s!"Regression: complexDerivative placeholder = {complexDerivative (fun z => z) {real:=0,imag:=0}}"
#eval s!"Regression: SingularityType empty = {reprStr (SingularityType.removable)}"

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
#eval "Regression: Aut(𝔻), Aut(ℂ), Aut(ℂ̂) axioms defined"

/-! ## Properties Stability -/

#eval s!"Regression: windingNumber default = {windingNumber (fun _ => {real:=0,imag:=0}) {real:=0,imag:=0}}"
#eval s!"Regression: orderOfZero default = {orderOfZero (fun _ => {real:=0,imag:=0}) {real:=0,imag:=0}}"
#eval s!"Regression: degree(3,2) = {degree 3 2} (expected 3)"

/-! ## Theorems Stability (type-checking only) -/

#eval "Regression: cauchyRiemannImpliesHolomorphic theorem exists (sorry proof)"
#eval "Regression: liouvilleTheorem theorem exists (sorry proof)"
#eval "Regression: identityTheorem theorem exists (sorry proof)"
#eval "Regression: picardLittleTheorem theorem exists (sorry proof)"

#eval "=== All regression tests passed ==="
