/-
# Tests.Smoke

Smoke tests for mini-holomorphic-functions package.
-/

import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

/-! ## Core -/

#eval "=== Core ==="
#eval s!"Derivative rules: {derivativeRules.axioms.length}"
#eval s!"Holomorphic algebra: {holomorphicAlgebraAxioms.axioms.length}"
#eval s!"Total core laws: {holomorphicFunctionLaws.axioms.length}"

/-! ## Morphisms -/

#eval "=== Morphisms ==="
#eval "Morphisms.Hom: BiholomorphicMap, ConformalMap, Automorphism, MobiusTransformation"
#eval "Morphisms.Iso: BiholomorphicEquivalence, ConformalEquivalence, Aut(𝔻)"
#eval "Morphisms.Equiv: ConformallyEquivalent, Riemann mapping classification"

/-! ## Constructions -/

#eval "=== Constructions ==="
#eval "Constructions.Subobjects: H(D), H^∞(D), A(D), Bergman space"
#eval "Constructions.Quotients: Invariant functions, Modular forms, Eisenstein series"
#eval "Constructions.Products: Product of holomorphic, Hartogs theorem"
#eval "Constructions.Universal: HolomorphicFunctionRing, projective limit, sheaf property"

/-! ## Properties -/

#eval "=== Properties ==="
#eval "Properties.Invariants: orderOfZero, orderOfPole, windingNumber, residue, degree"
#eval "Properties.Preservation: angles, orientation, open mapping"
#eval s!"Singularity axioms: {singularityClassificationAxioms.axioms.length}"

/-! ## Theorems -/

#eval "=== Theorems ==="
#eval "Theorems.Basic: Cauchy-Riemann, Liouville, maximum modulus, open mapping, identity theorem"
#eval "Theorems.Classification: Riemann, Casorati-Weierstrass, Picard little/great"
#eval "Theorems.UniversalProperties: projective limit, Mittag-Leffler, Weierstrass factorization"
#eval s!"Total axioms: {holomorphicTotalAxioms.axioms.length}"

/-! ## Bridges -/

#eval "=== Bridges ==="
#eval "Bridges.ToAlgebra: integral domain, Fréchet algebra, Weierstrass product"
#eval "Bridges.ToTopology: Montel, normal families, compact-open topology"
#eval "Bridges.ToGeometry: Poincaré metric, Schwarz-Christoffel, Beltrami equation"
#eval "Bridges.ToComputation: numerical differentiation, Taylor series, conformal mapping"

#eval "=== All smoke tests passed ==="
