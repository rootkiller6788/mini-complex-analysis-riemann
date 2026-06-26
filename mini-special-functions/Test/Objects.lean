/-
# MiniSpecialFunctions: Object Instance Tests

Tests for Object typeclass instances and the special functions catalog.
-/

import MiniSpecialFunctions

open MiniSpecialFunctions
open MiniObjectKernel

/-! ## Special Function Object Instance Tests -/

#eval "══ TEST: Special Function Objects ══"

#eval "── Gamma Function Object ──"
#eval describeSpecialFunction gammaFunction

#eval "── Zeta Function Object ──"
#eval describeSpecialFunction zetaFunction

#eval "── Theta Function Object ──"
#eval describeSpecialFunction thetaFunction

#eval "── Weierstrass P Object ──"
#eval describeSpecialFunction weierstrassPFunction

/-! ## Theory Name Tests -/

#eval "══ TEST: Theory Name ══"

#eval "── Special functions theory name ──"
#eval specialFunctionsTheory

#eval "── Object theory check (Gamma) ──"
#eval theory gammaFunction
#eval objName gammaFunction

#eval "── Object theory check (Zeta) ──"
#eval theory zetaFunction
#eval objName zetaFunction

/-! ## Catalog Tests -/

#eval "══ TEST: Special Functions Catalog ══"

#eval "── Catalog size ──"
#eval specialFunctionsCatalog.length

#eval "── All names ──"
#eval specialFunctionsCatalog.map (fun sf => sf.name)

#eval "── All functional equations ──"
#eval specialFunctionsCatalog.map (fun sf => sf.functionalEquation)

/-! ## Functional Equation Type Tests -/

#eval "══ TEST: Functional Equation Types ══"

#eval "── Gamma FE type ──"
#eval functionalEquationTypeOf "Gamma"

#eval "── Zeta FE type ──"
#eval functionalEquationTypeOf "Zeta"

#eval "── Theta FE type ──"
#eval functionalEquationTypeOf "Theta"

#eval "── WeierstrassP FE type ──"
#eval functionalEquationTypeOf "WeierstrassP"

#eval "══ ALL OBJECT TESTS COMPLETE ══"
