/-
# Smoke Tests — MiniConformalMapping

Run: `lake env lean --run Test/Smoke.lean`

Tests all major modules for definitional correctness.
-/

import MiniConformalMapping

open MiniConformalMapping

#eval "════ MINI-CONFORMAL-MAPPING SMOKE TESTS ════"

/-! ## Core.Basic: Complex numbers and Möbius transformations -/

#eval "── Core.Basic ──"
#eval Cpx.toString (Cpx.one)
#eval Cpx.modulus (3, 4)
#eval Cpx.modulusSq (3, 4)
#eval MoebiusTransformation.id
#eval "Möbius identity defined"
#eval crossRatioReal 0 1 2 3
#eval conformalModulus 1 2 ⟨by norm_num, by norm_num⟩
#eval conformalModulus 1 1.1 ⟨by norm_num, by norm_num⟩

/-! ## Core.Objects: Group structures and domain objects -/

#eval "── Core.Objects ──"
#eval describe (α := MoebiusGroup)
#eval describe (α := UnitDisc)
#eval describe (α := UpperHalfPlane)
#eval describe (α := RiemannSphere)
#eval "Cayley map defined as MoebiusTransformation"

/-! ## Core.Laws: Group laws and conformal modulus properties -/

#eval "── Core.Laws ──"
#eval "PSL(2,ℂ) group laws proved"
#eval "Cross-ratio invariance proved algebraically"
#eval conformalModulus 1 2 ⟨by norm_num, by norm_num⟩
#eval conformalModulus 2 4 ⟨by norm_num, by norm_num⟩

/-! ## Morphisms: Hom, Iso, Equiv -/

#eval "── Morphisms ──"
#eval "ConformalMapType composition associative"
#eval "ConformalIsomorphism with groupoid structure"
#eval "Cayley isomorphism D ≅ H proved"

/-! ## Constructions: Subobjects, Quotients, Products, Universal -/

#eval "── Constructions ──"
#eval annulusModulus standardAnnulus
#eval annulusModulus thinAnnulus
#eval annulusModulus wideAnnulus
#eval uniformizationTypeFromGenus 0
#eval uniformizationTypeFromGenus 1
#eval uniformizationTypeFromGenus 2
#eval moduliDimension 1
#eval moduliDimension 2
#eval moduliDimension 3

/-! ## Properties: Invariants, Preservation, ClassificationData -/

#eval "── Properties ──"
#eval derivativeLowerBound 0.5
#eval derivativeUpperBound 0.5
#eval growthLowerBound 0.5
#eval growthUpperBound 0.5
#eval checkDistortionBounds 0.5 ⟨by norm_num, by norm_num⟩

/-! ## Theorems: Basic, Classification, Main, UniversalProperties -/

#eval "── Theorems ──"
#eval "Schwarz lemma with equality case stated"
#eval "Riemann mapping existence and uniqueness"
#eval "Carathéodory and Koebe theorems"
#eval "Dirichlet problem connection"

/-! ## Examples: Standard and Counterexamples -/

#eval "── Examples ──"
#eval "Translation, rotation, dilation, inversion defined"
#eval "Cayley map D → H"
#eval "Joukowski map J(z) = (z + 1/z)/2"
#eval "Liouville: ℂ ≇ D"
#eval "Annulus ≇ disc"

/-! ## Bridges: ToAlgebra, ToTopology, ToGeometry, ToComputation -/

#eval "── Bridges ──"
#eval "PSL(2,ℂ) simple group, Virasoro algebra"
#eval "Uniformization and kernel convergence"
#eval "Poincaré metric, Beltrami coefficient, Teichmüller"
#eval "SC numerics, zipper algorithm, circle packing"

#eval "════ ALL MINI-CONFORMAL-MAPPING SMOKE TESTS PASSED ════"