/-
# MiniHolomorphicFunctions.Constructions.Universal

Universal property of the ring of holomorphic functions,
category of holomorphic function rings.
-/

import MiniHolomorphicFunctions.Constructions.Products
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Ring of Holomorphic Functions -/

/-- O(D): the ring (â„?algebra) of holomorphic functions on D. -/
structure HolomorphicFunctionRing (D : Set â„? where
  functions : List (HolomorphicFunction D)
  zero : HolomorphicFunction D
  one : HolomorphicFunction D
  add : HolomorphicFunction D â†?HolomorphicFunction D â†?HolomorphicFunction D
  mul : HolomorphicFunction D â†?HolomorphicFunction D â†?HolomorphicFunction D
  isCommutativeRing : Prop
  isCAlgebra : Prop

/-- The ring O(D) is an integral domain when D is connected. -/
def holomorphicRingIsIntegralDomain : Axiom :=
  Axiom.mk "holomorphicRingIsIntegralDomain" (Formula.pred 0 [])
    "If D is a connected domain, O(D) is an integral domain"

/-! ## Universal Property -/

/-- Universal property: O(D) is the projective limit of O(U) over
    relatively compact open subsets U âŠ‚âŠ‚ D. -/
def holomorphicRingAsProjectiveLimit : Axiom :=
  Axiom.mk "holomorphicRingAsProjectiveLimit" (Formula.pred 0 [])
    "O(D) = lim_{U âŠ‚âŠ‚ D} O(U) as a FrÃ©chet algebra (Mittag-Leffler)"

/-- O(D) is a FrÃ©chet algebra with the topology of uniform convergence on compacta. -/
def holomorphicRingIsFrechetAlgebra : Axiom :=
  Axiom.mk "holomorphicRingIsFrechetAlgebra" (Formula.pred 0 [])
    "O(D) with compact-open topology is a FrÃ©chet algebra"

/-- Universal property of the power series ring â„‚{z}. -/
def powerSeriesRingUniversal : Axiom :=
  Axiom.mk "powerSeriesRingUniversal" (Formula.pred 0 [])
    "â„‚{z} = lim_{n} â„‚[z]/(z^n) is the universal ring of convergent power series"

/-! ## Category of Holomorphic Function Rings -/

/-- Category HolRing: objects are rings O(D), morphisms are pullback maps. -/
structure HolomorphicFunctionRingCategory where
  objects : List (Set â„?
  morphism : HolomorphicFunctionRing D â†?HolomorphicFunctionRing E â†?Type

/-- Pullback map Ï†*: O(V) â†?O(U) for a holomorphic map Ï†: U â†?V. -/
def pullbackMap : Axiom :=
  Axiom.mk "pullbackMap" (Formula.pred 0 [])
    "For Ï†: U â†?V holomorphic, Ï†*: O(V) â†?O(U), Ï†*(f) = fâˆ˜Ï?is a â„?algebra homomorphism"

/-- Sheaf property: holomorphic functions form a sheaf on â„? -/
def holomorphicSheafProperty : Axiom :=
  Axiom.mk "holomorphicSheafProperty" (Formula.pred 0 [])
    "The assignment D â†?O(D) is a sheaf of â„?algebras on â„?

/-! ## #eval Tests -/

#eval "Constructions.Universal: HolomorphicFunctionRing, integral domain, FrÃ©chet algebra"
#eval "Constructions.Universal: Projective limit, PowerSeriesRing, HolomorphicFunctionRingCategory"
#eval "Constructions.Universal: pullbackMap, holomorphicSheafProperty"

end MiniHolomorphicFunctions
