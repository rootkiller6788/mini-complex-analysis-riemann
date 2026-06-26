/-
# MiniHolomorphicFunctions.Constructions.Quotients

Quotients by automorphism groups and modular forms
as invariant holomorphic functions.
-/

import MiniHolomorphicFunctions.Constructions.Subobjects
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Quotient by Automorphism Group -/

/-- Quotient of a domain by a group of automorphisms. -/
structure QuotientByAutomorphismGroup (U : Set ‚Ñ? (G : ConformalAutomorphismGroup U) where
  quotient : Type u
  projection : ‚Ñ?‚Ü?quotient
  isHolomorphicProjection : Prop
  groupAction : Prop  -- G acts properly discontinuously on U

/-- Holomorphic function invariant under a group action. -/
structure InvariantHolomorphicFunction (U : Set ‚Ñ? (G : ConformalAutomorphismGroup U) where
  function : HolomorphicFunction U
  isInvariant : ‚àÄ (g : ConformalMap U U), g ‚à?G.group ‚Ü?‚àÄ z, z ‚à?U ‚Ü?    function.f (g.toHolomorphic.f z) = function.f z

/-! ## Modular Forms -/

/-- A modular form of weight k for the modular group SL(2,‚Ñ?. -/
structure ModularForm (k : ‚Ñ? where
  f : ‚Ñ?‚Ü?‚Ñ?  upperHalfPlane : Set ‚Ñ?:= {z | Real.sin (ComplexNumbers.arg z) > 0}
  isHolomorphicOnH : Prop  -- f is holomorphic on the upper half-plane H
  transformationLaw : Prop  -- f((az+b)/(cz+d)) = (cz+d)^k f(z) for SL(2,‚Ñ?
  isHolomorphicAtCusp : Prop  -- f is holomorphic at i‚à?
/-- A cusp form is a modular form vanishing at all cusps. -/
structure CuspForm (k : ‚Ñ? extends ModularForm k where
  vanishesAtCusps : Prop

/-- The j-invariant: a modular function of weight 0. -/
def jInvariant : Axiom :=
  Axiom.mk "jInvariant" (Formula.pred 0 [])
    "The j-function is a modular function classifying elliptic curves up to isomorphism"

/-- Modular discriminant Œî: a cusp form of weight 12. -/
def modularDiscriminant : Axiom :=
  Axiom.mk "modularDiscriminant" (Formula.pred 0 [])
    "Œî(z) = (2œÄ)¬π¬≤ Œ∑(z)¬≤‚Å?is a cusp form of weight 12"

/-- Eisenstein series G_{2k}: modular form of weight 2k for k ‚â?2. -/
def eisensteinSeries : Axiom :=
  Axiom.mk "eisensteinSeries" (Formula.pred 0 [])
    "G_{2k}(z) = Œ£_{(m,n)‚â?0,0)} (mz+n)^{-2k} is a modular form of weight 2k (k ‚â?2)"

/-! ## #eval Tests -/

#eval "Constructions.Quotients: QuotientByAutomorphismGroup, InvariantHolomorphicFunction"
#eval "Constructions.Quotients: ModularForm weight k, CuspForm, jInvariant"
#eval "Constructions.Quotients: modularDiscriminant, eisensteinSeries"

end MiniHolomorphicFunctions
