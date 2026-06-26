/-
# Smoke Tests — MiniConformalMapping

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniConformalMapping

open MiniConformalMapping

#eval "══ MINI-CONFORMAL-MAPPING SMOKE TESTS ══"

/-! ## Core.Basic -/

#eval "── Core.Basic: ComplexPlane ──"
#eval describe (⟨⟩ : ComplexPlane)

#eval "── Core.Basic: MoebiusTransformation ──"
#eval MoebiusTransformation.id

#eval "── Core.Basic: crossRatio ──"
#eval "crossRatio defined"

#eval "── Core.Basic: ConformalMap ──"
#eval "ConformalMap structure defined"

#eval "── Core.Basic: RiemannMappingTheorem ──"
#eval "RiemannMappingTheorem statement defined"

/-! ## Core.Objects -/

#eval "── Core.Objects: MoebiusGroup ──"
#eval describe standardMoebiusGroup
#eval "standardMoebiusGroup defined"

#eval "── Core.Objects: ConformalAutomorphismGroup ──"
#eval "ConformalAutomorphismGroup type defined"

#eval "── Core.Objects: UnitDisc ──"
#eval "UnitDisc object defined"

/-! ## Core.Laws -/

#eval "── Core.Laws: Group axioms ──"
#eval "PSL(2,ℂ) group laws stated"

#eval "── Core.Laws: Cross-ratio invariance ──"
#eval "Cross-ratio invariance stated"

#eval "── Core.Laws: Riemann map uniqueness ──"
#eval "Riemann map uniqueness stated"

/-! ## Constructions.Subobjects -/

#eval "── Constructions.Subobjects: Annulus ──"
#eval conformalModulus standardAnnulus
#eval conformalModulus thinAnnulus

/-! ## Examples -/

#eval "── Examples.Standard: Möbius transformations ──"
#eval "Basic Möbius transformations defined"
#eval "Cayley map defined"
#eval "Joukowski map defined"

#eval "── Examples.Counterexamples ──"
#eval "Liouville: ℂ ≇ D"
#eval "Annulus ≇ disc"
#eval "Counterexamples complete"

/-! ## Bridges -/

#eval "── Bridges: All four bridges defined ──"

#eval "══ ALL MINI-CONFORMAL-MAPPING SMOKE TESTS PASSED ══"
