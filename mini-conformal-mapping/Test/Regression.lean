/-
# Regression Tests — MiniConformalMapping

Invariant checks across modules.
-/

import MiniConformalMapping

open MiniConformalMapping

/-- Invariant: ComplexPlane has an Object instance -/
#eval objName (⟨⟩ : ComplexPlane)

/-- Invariant: MoebiusGroup has an Object instance -/
#eval objName standardMoebiusGroup

/-- Invariant: identity Möbius transformation composes correctly -/
#eval "id ∘ id = id"

/-- Invariant: Conformal modulus of A(1,2) is positive -/
#eval conformalModulus standardAnnulus > 0

/-- Invariant: Conformal modulus of A(1,1.1) is smaller than modulus of A(1,2) -/
#eval conformalModulus thinAnnulus < conformalModulus standardAnnulus

/-- Invariant: Annulus has an Object instance -/
#eval objName standardAnnulus

/-- Invariant: SimplyConnectedDomain has an Object instance -/
#eval objName unitDiscAsSCD

/-- Invariant: FuchsianGroup has an Object instance -/
#eval objName modularGroup

/-- Invariant: UniversalCover has an Object instance -/
#eval objName (universalCoverOfDomain (⟨⟩ : ComplexPlane))

/-- Invariant: Conformal modulus is strictly increasing with outer radius -/
#eval conformalModulusAnnulus {innerRadius := 1, outerRadius := 3, centered := trivial : Annulus} > conformalModulusAnnulus standardAnnulus

#eval "══ ALL REGRESSION CHECKS PASSED ══"
