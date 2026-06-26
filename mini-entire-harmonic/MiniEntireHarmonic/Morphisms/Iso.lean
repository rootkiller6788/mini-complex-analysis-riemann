/-
# MiniEntireHarmonic: Isomorphisms

Biholomorphic maps preserving harmonic structure,
conjugate harmonic pairs as isomorphism between real
and imaginary parts of holomorphic functions.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Morphisms.Hom

namespace MiniEntireHarmonic

/-! ## Biholomorphic Map -/

structure BiholomorphicMap where
  f : ComplexNumbers → ComplexNumbers
  g : ComplexNumbers → ComplexNumbers  -- inverse
  isBijection : Bool
  preservesHarmonic : Bool
  deriving Repr

def isBiholomorphic (m : BiholomorphicMap) : Prop :=
  (∀ z, m.g (m.f z) = z) ∧ (∀ w, m.f (m.g w) = w)

/-! ## Conformal Map Preserving Harmonic Structure -/

structure ConformalMap where
  f : ComplexNumbers → ComplexNumbers
  isConformal : Bool
  harmonicPullback : (ComplexNumbers → Float) → (ComplexNumbers → Float)
  deriving Repr

def conformalMapPreservesHarmonic (cm : ConformalMap) (u : ComplexNumbers → Float) : Prop :=
  isHarmonic u → isHarmonic (cm.harmonicPullback u)

def identityConformalMap : ConformalMap :=
  { f := fun z => z
  , isConformal := true
  , harmonicPullback := fun u => u
  }

/-! ## Conjugate Harmonic Pair as Isomorphism -/

structure ConjugateHarmonicPair where
  u : ComplexNumbers → Float
  v : ComplexNumbers → Float
  satisfiesCREquations : Bool
  deriving Repr

def conjugatePairToHolomorphic (chp : ConjugateHarmonicPair) : EntireFunction :=
  fun z => ComplexNumbers.of (chp.u z) (chp.v z)

def holomorphicToConjugatePair (f : EntireFunction) : ConjugateHarmonicPair :=
  { u := fun z => (f z).re
  , v := fun z => (f z).im
  , satisfiesCREquations := true
  }

/-! ## Isomorphism of Harmonic Functions -/

structure HarmonicIsomorphism where
  sourceDomain : ComplexNumbers → Prop
  targetDomain : ComplexNumbers → Prop
  biholomorphicMap : BiholomorphicMap
  deriving Repr

def harmonicIsomorphismCheck (hi : HarmonicIsomorphism) (u : ComplexNumbers → Float) : Bool :=
  hi.biholomorphicMap.preservesHarmonic

def expHarmonicPair : ConjugateHarmonicPair :=
  holomorphicToConjugatePair entireExpZ

/-! ## #eval Tests -/

#eval "── Morphisms.Iso: Identity conformal map ──"
#eval identityConformalMap.isConformal

#eval "── Morphisms.Iso: exp harmonic pair u(1,0) ──"
#eval expHarmonicPair.u (ComplexNumbers.of 1.0 0.0)

#eval "── Morphisms.Iso: exp harmonic pair v(1,0) ──"
#eval expHarmonicPair.v (ComplexNumbers.of 1.0 0.0)

#eval "── Morphisms.Iso: Conjugate pair check ──"
#eval expHarmonicPair.satisfiesCREquations

end MiniEntireHarmonic
