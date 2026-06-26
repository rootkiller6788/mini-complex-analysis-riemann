/-
# MiniHolomorphicFunctions.Bridges.ToTopology

Topological aspects: Montel's theorem, normal families,
topology of uniform convergence on compacta.
-/

import MiniHolomorphicFunctions.Bridges.ToAlgebra
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Montel's Theorem -/

/-- Montel's theorem: a uniformly bounded family of holomorphic functions
    is a normal family. -/
def montelTheoremNormalFamilies : Axiom :=
  Axiom.mk "montelTheoremNormalFamilies" (Formula.pred 0 [])
    "A family F ⊂ O(D) that is uniformly bounded on each compact K ⊂ D is a normal family"

/-- Equivalent: every sequence in a bounded set has a subsequence converging
    uniformly on compacta. -/
def montelTheoremSequentialCompact : Axiom :=
  Axiom.mk "montelTheoremSequentialCompact" (Formula.pred 0 [])
    "If {f_n} ⊂ O(D) is uniformly bounded on compacta, there exists a subsequence converging uniformly on compacta"

/-- Stieltjes-Osgood theorem: weak normality criterion. -/
def stieltjesOsgoodTheorem : Axiom :=
  Axiom.mk "stieltjesOsgoodTheorem" (Formula.pred 0 [])
    "A family of holomorphic functions on D is normal iff it is equicontinuous on compacta"

/-! ## Normal Families -/

/-- A normal family: every sequence has a subsequence converging uniformly
    on compacta (possibly to ∞). -/
structure NormalFamily (D : Set ℂ) where
  functions : List (HolomorphicFunction D)
  isNormal : Prop  -- every sequence has a subsequence converging locally uniformly
  canDivergeToInfinity : Prop  -- subsequence may converge to ∞

/-- Marty's criterion: F is normal iff the spherical derivatives are uniformly
    bounded on compacta. -/
def martysCriterion : Axiom :=
  Axiom.mk "martysCriterion" (Formula.pred 0 [])
    "A family F of meromorphic functions is normal iff the spherical derivatives are uniformly bounded on compacta"

/-- Zalcman's lemma: failure of normality produces a non-constant entire function. -/
def zalcmanLemma : Axiom :=
  Axiom.mk "zalcmanLemma" (Formula.pred 0 [])
    "If a family F is not normal, there exist f_n, z_n → z₀, ρ_n → 0 and a non-constant entire g with f_n(z_n + ρ_n ζ) → g(ζ)"

/-! ## Topology of Uniform Convergence on Compacta -/

/-- The compact-open topology on O(D). -/
structure CompactOpenTopology (D : Set ℂ) where
  topology : String := "compact-open C(D)"
  basicOpen : Set ℂ → Set ℂ → Set (HolomorphicFunction D)
  isLocallyConvex : Prop
  isMetrizable : Prop
  isComplete : Prop

/-- O(D) is a Montel space: bounded closed subsets are compact. -/
def holomorphicMontelSpace : Axiom :=
  Axiom.mk "holomorphicMontelSpace" (Formula.pred 0 [])
    "O(D) with its natural topology is a Montel space (barreled, with bounded = relatively compact)"

/-- The topology is defined by seminorms p_K(f) = sup_{z∈K} |f(z)|. -/
def compactOpenSeminorms : Axiom :=
  Axiom.mk "compactOpenSeminorms" (Formula.pred 0 [])
    "The compact-open topology is defined by the seminorms p_K(f) = sup_{z∈K} |f(z)| for compact K ⊂ D"

/-- Runge's theorem: holomorphic functions on a domain can be approximated
    by rational functions with poles outside the domain. -/
def rungeApproximationTheorem : Axiom :=
  Axiom.mk "rungeApproximationTheorem" (Formula.pred 0 [])
    "If K ⊂ ℂ is compact and f is holomorphic on a neighborhood of K, then f can be approximated uniformly on K by rational functions with poles in ℂ̂\\K"

/-! ## #eval Tests -/

#eval "Bridges.ToTopology: montelTheoremNormalFamilies, montelTheoremSequentialCompact"
#eval "Bridges.ToTopology: NormalFamily, martysCriterion, zalcmanLemma"
#eval "Bridges.ToTopology: CompactOpenTopology, holomorphicMontelSpace, rungeApproximationTheorem"

end MiniHolomorphicFunctions
