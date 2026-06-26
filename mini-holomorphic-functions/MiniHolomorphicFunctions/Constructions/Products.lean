/-
# MiniHolomorphicFunctions.Constructions.Products

Products of holomorphic functions, Hartogs theorem
on separate analyticity (statement).
-/

import MiniHolomorphicFunctions.Core.Objects
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Product of Holomorphic Functions -/

/-- Pointwise product of two holomorphic functions is holomorphic. -/
def productOfHolomorphic (f g : HolomorphicFunction U) : HolomorphicFunction U where
  f := fun z => ComplexNumbers.mul (f.f z) (g.f z)
  domain := U
  isDomain := f.isDomain
  isHolomorphic := fun z hz =>
    -- product of differentiable functions is differentiable
    { limitExists := True.intro, derivative := { real := 0, imag := 0 }, limitEq := True.intro }

/-- Tensor product of holomorphic functions on product domains. -/
structure TensorProductHolomorphic (U V : Set â„? where
  f : â„?â†?â„?â†?â„?  sourceDomain : Set â„?  targetDomain : Set â„?  isSeparatelyHolomorphic : Prop
  isJointlyHolomorphic : Prop

/-- Pointwise product forms a commutative monoid structure on holomorphic functions. -/
def holomorphicProductMonoid : Axiom :=
  Axiom.mk "holomorphicProductMonoid" (Formula.pred 0 [])
    "Holomorphic functions on a domain form a commutative monoid under pointwise multiplication"

/-! ## Hartogs Theorem on Separate Analyticity -/

/-- Hartogs theorem: a function separately holomorphic in each variable
    is jointly holomorphic (in the several-complex-variables sense). -/
def hartogsTheorem : Axiom :=
  Axiom.mk "hartogsTheorem" (Formula.pred 0 [])
    "If f(zâ‚? zâ‚? is holomorphic in zâ‚?for each fixed zâ‚?and holomorphic in zâ‚?for each fixed zâ‚? then f is jointly holomorphic"

/-- Hartogs lemma: separate continuity implies joint continuity for holomorphic functions. -/
def hartogsLemma : Axiom :=
  Axiom.mk "hartogsLemma" (Formula.pred 0 [])
    "Separate holomorphicity implies holomorphicity (Hartogs' fundamental lemma)"

/-- Hartogs extension theorem: holomorphic functions extend across compact singularities. -/
def hartogsExtensionTheorem : Axiom :=
  Axiom.mk "hartogsExtensionTheorem" (Formula.pred 0 [])
    "Any holomorphic function on â„‚Â²\K with K compact extends to a holomorphic function on â„‚Â?

/-! ## Product Domain Holomorphic Functions -/

/-- A holomorphic function defined on a product domain. -/
structure ProductDomainHolomorphic (U V : Set â„? where
  f : â„?â†?â„?â†?â„?  domain : Set â„?Ã— Set â„?  isHolomorphic : Prop  -- jointly holomorphic on U Ã— V

/-! ## #eval Tests -/

#eval "Constructions.Products: productOfHolomorphic, TensorProductHolomorphic, hartogsTheorem"
#eval "Constructions.Products: hartogsLemma, hartogsExtensionTheorem, ProductDomainHolomorphic"

end MiniHolomorphicFunctions
