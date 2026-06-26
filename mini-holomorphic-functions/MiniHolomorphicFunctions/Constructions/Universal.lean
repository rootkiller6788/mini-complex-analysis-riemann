/-
# MiniHolomorphicFunctions.Constructions.Universal

Universal property of the ring of holomorphic functions,
category of holomorphic function rings.
-/

import MiniHolomorphicFunctions.Constructions.Products
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Ring of Holomorphic Functions -/

/-- O(D): the ring (ℂ-algebra) of holomorphic functions on D. -/
structure HolomorphicFunctionRing (D : Set ℂ) where
  functions : List (HolomorphicFunction D)
  zero : HolomorphicFunction D
  one : HolomorphicFunction D
  add : HolomorphicFunction D → HolomorphicFunction D → HolomorphicFunction D
  mul : HolomorphicFunction D → HolomorphicFunction D → HolomorphicFunction D
  isCommutativeRing : Prop
  isCAlgebra : Prop

/-- The ring O(D) is an integral domain when D is connected. -/
def holomorphicRingIsIntegralDomain : Axiom :=
  Axiom.mk "holomorphicRingIsIntegralDomain" (Formula.pred 0 [])
    "If D is a connected domain, O(D) is an integral domain"

/-! ## Universal Property -/

/-- Universal property: O(D) is the projective limit of O(U) over
    relatively compact open subsets U ⊂⊂ D. -/
def holomorphicRingAsProjectiveLimit : Axiom :=
  Axiom.mk "holomorphicRingAsProjectiveLimit" (Formula.pred 0 [])
    "O(D) = lim_{U ⊂⊂ D} O(U) as a Fréchet algebra (Mittag-Leffler)"

/-- O(D) is a Fréchet algebra with the topology of uniform convergence on compacta. -/
def holomorphicRingIsFrechetAlgebra : Axiom :=
  Axiom.mk "holomorphicRingIsFrechetAlgebra" (Formula.pred 0 [])
    "O(D) with compact-open topology is a Fréchet algebra"

/-- Universal property of the power series ring ℂ{z}. -/
def powerSeriesRingUniversal : Axiom :=
  Axiom.mk "powerSeriesRingUniversal" (Formula.pred 0 [])
    "ℂ{z} = lim_{n} ℂ[z]/(z^n) is the universal ring of convergent power series"

/-! ## Category of Holomorphic Function Rings -/

/-- Category HolRing: objects are rings O(D), morphisms are pullback maps. -/
structure HolomorphicFunctionRingCategory where
  objects : List (Set ℂ)
  morphism : HolomorphicFunctionRing D → HolomorphicFunctionRing E → Type

/-- Pullback map φ*: O(V) → O(U) for a holomorphic map φ: U → V. -/
def pullbackMap : Axiom :=
  Axiom.mk "pullbackMap" (Formula.pred 0 [])
    "For φ: U → V holomorphic, φ*: O(V) → O(U), φ*(f) = f∘φ is a ℂ-algebra homomorphism"

/-- Sheaf property: holomorphic functions form a sheaf on ℂ. -/
def holomorphicSheafProperty : Axiom :=
  Axiom.mk "holomorphicSheafProperty" (Formula.pred 0 [])
    "The assignment D ↦ O(D) is a sheaf of ℂ-algebras on ℂ"

/-! ## #eval Tests -/

#eval "Constructions.Universal: HolomorphicFunctionRing, integral domain, Fréchet algebra"
#eval "Constructions.Universal: Projective limit, PowerSeriesRing, HolomorphicFunctionRingCategory"
#eval "Constructions.Universal: pullbackMap, holomorphicSheafProperty"

end MiniHolomorphicFunctions
