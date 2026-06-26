/-
# MiniHolomorphicFunctions.Bridges.ToTopology

Topological aspects: Montel's theorem, normal families,
topology of uniform convergence on compacta.
-/

import MiniHolomorphicFunctions.Bridges.ToAlgebra
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Montel's Theorem -/

/-- Montel's theorem: a uniformly bounded family of holomorphic functions
    is a normal family. -/
def montelTheoremNormalFamilies : Axiom :=
  Axiom.mk "montelTheoremNormalFamilies" (Formula.pred 0 [])
    "A family F ‚ä?O(D) that is uniformly bounded on each compact K ‚ä?D is a normal family"

/-- Equivalent: every sequence in a bounded set has a subsequence converging
    uniformly on compacta. -/
def montelTheoremSequentialCompact : Axiom :=
  Axiom.mk "montelTheoremSequentialCompact" (Formula.pred 0 [])
    "If {f_n} ‚ä?O(D) is uniformly bounded on compacta, there exists a subsequence converging uniformly on compacta"

/-- Stieltjes-Osgood theorem: weak normality criterion. -/
def stieltjesOsgoodTheorem : Axiom :=
  Axiom.mk "stieltjesOsgoodTheorem" (Formula.pred 0 [])
    "A family of holomorphic functions on D is normal iff it is equicontinuous on compacta"

/-! ## Normal Families -/

/-- A normal family: every sequence has a subsequence converging uniformly
    on compacta (possibly to ‚à?. -/
structure NormalFamily (D : Set ‚Ñ? where
  functions : List (HolomorphicFunction D)
  isNormal : Prop  -- every sequence has a subsequence converging locally uniformly
  canDivergeToInfinity : Prop  -- subsequence may converge to ‚à?
/-- Marty's criterion: F is normal iff the spherical derivatives are uniformly
    bounded on compacta. -/
def martysCriterion : Axiom :=
  Axiom.mk "martysCriterion" (Formula.pred 0 [])
    "A family F of meromorphic functions is normal iff the spherical derivatives are uniformly bounded on compacta"

/-- Zalcman's lemma: failure of normality produces a non-constant entire function. -/
def zalcmanLemma : Axiom :=
  Axiom.mk "zalcmanLemma" (Formula.pred 0 [])
    "If a family F is not normal, there exist f_n, z_n ‚Ü?z‚ÇÄ, œÅ_n ‚Ü?0 and a non-constant entire g with f_n(z_n + œÅ_n Œ∂) ‚Ü?g(Œ∂)"

/-! ## Topology of Uniform Convergence on Compacta -/

/-- The compact-open topology on O(D). -/
structure CompactOpenTopology (D : Set ‚Ñ? where
  topology : String := "compact-open C(D)"
  basicOpen : Set ‚Ñ?‚Ü?Set ‚Ñ?‚Ü?Set (HolomorphicFunction D)
  isLocallyConvex : Prop
  isMetrizable : Prop
  isComplete : Prop

/-- O(D) is a Montel space: bounded closed subsets are compact. -/
def holomorphicMontelSpace : Axiom :=
  Axiom.mk "holomorphicMontelSpace" (Formula.pred 0 [])
    "O(D) with its natural topology is a Montel space (barreled, with bounded = relatively compact)"

/-- The topology is defined by seminorms p_K(f) = sup_{z‚ààK} |f(z)|. -/
def compactOpenSeminorms : Axiom :=
  Axiom.mk "compactOpenSeminorms" (Formula.pred 0 [])
    "The compact-open topology is defined by the seminorms p_K(f) = sup_{z‚ààK} |f(z)| for compact K ‚ä?D"

/-- Runge's theorem: holomorphic functions on a domain can be approximated
    by rational functions with poles outside the domain. -/
def rungeApproximationTheorem : Axiom :=
  Axiom.mk "rungeApproximationTheorem" (Formula.pred 0 [])
    "If K ‚ä?‚Ñ?is compact and f is holomorphic on a neighborhood of K, then f can be approximated uniformly on K by rational functions with poles in ‚ÑÇÃÇ\\K"

/-! ## #eval Tests -/

#eval "Bridges.ToTopology: montelTheoremNormalFamilies, montelTheoremSequentialCompact"
#eval "Bridges.ToTopology: NormalFamily, martysCriterion, zalcmanLemma"
#eval "Bridges.ToTopology: CompactOpenTopology, holomorphicMontelSpace, rungeApproximationTheorem"

end MiniHolomorphicFunctions
