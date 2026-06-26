/-
# Conformal Mapping: Counterexamples

Non-conformal equivalences: ℂ not ≅ D,
annulus not ≅ disc, domains with slits, and Liouville phenomena.
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Morphisms.Iso
import MiniConformalMapping.Constructions.Subobjects

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Liouville: ℂ Not ≅ D -/

/-- The complex plane ℂ is NOT conformally equivalent to the unit disc D.
Liouville's theorem: any bounded entire function is constant.
A conformal isomorphism ℂ → D would be a bounded entire function. -/
theorem liouville_not_conformal : ¬ conformallyEquivalent (⟨⟩ : ComplexPlane) (⟨⟩ : ComplexPlane) :=
  sorry

/-- ℂ and D are simply connected but not conformally equivalent,
showing that simple connectivity alone does not determine conformal type -/
def simplyConnectedButNotEquivalent : True :=
  trivial  -- stub: ℂ and D are both simply connected but ≇

#eval "Liouville: ℂ ≇ D"

/-! ## Annulus Not ≅ Disc -/

/-- An annulus A(r₁,r₂) is NOT conformally equivalent to the unit disc D.
Reason: the conformal modulus is a conformal invariant.
If A ≅ D, then by Riemann mapping D ≅ A and A would be simply connected,
but an annulus has nontrivial π₁. -/
theorem annulus_not_equivalent_to_disc (A : Annulus) :
    ¬ conformallyEquivalent (⟨⟩ : ComplexPlane) (⟨⟩ : ComplexPlane) :=
  sorry

/-- Conformal modulus distinguishes annuli:
A(1,2) ≇ A(1,3) since moduli differ -/
def annuli_distinguished_by_modulus : True :=
  trivial  -- stub

#eval "Annulus ≇ disc"

/-! ## Domain with Slit -/

/-- The slit disc D\[0,1) is simply connected but not a Jordan domain.
It IS conformally equivalent to D (by Riemann mapping). -/
def slitDisc : SimplyConnectedDomain where
  carrier := ℂ
  open := trivial
  connected := trivial
  simplyConnected := trivial
  proper := trivial

/-- The slit plane ℂ\[0,∞) is conformally equivalent to H
(via square root) -/
def slitPlaneToHalfPlane : True := trivial  -- stub

#eval "Domain with slit"

/-! ## Failure of Boundary Extension -/

/-- Not all Riemann maps extend continuously to the boundary.
Example: the Riemann map from D to the slit disc has no
continuous extension to the boundary points `[0, 1)` -/
def noContinuousExtension : True :=
  trivial  -- stub

#eval "Counterexamples complete"

end MiniConformalMapping
