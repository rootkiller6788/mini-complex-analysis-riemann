/-
# MiniEntireHarmonic: Homomorphisms

`EntireFunctionMap` preserving order, `HadamardTransform`,
`HarmonicMap` between domains. Morphisms in the category of
entire and harmonic functions.
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic

/-! ## Entire Function Map (preserving order) -/

structure EntireFunctionMap where
  source : EntireFunction
  target : EntireFunction
  orderPreserving : Bool
  typePreserving : Bool
  deriving Repr, Inhabited

def isOrderPreserving (m : EntireFunctionMap) : Prop :=
  orderOfGrowth_limsup m.target ≤ orderOfGrowth_limsup m.source

def composeEntireMaps (m₁ m₂ : EntireFunctionMap) : EntireFunctionMap :=
  { source := m₁.source
  , target := m₂.target
  , orderPreserving := m₁.orderPreserving ∧ m₂.orderPreserving
  , typePreserving := m₁.typePreserving ∧ m₂.typePreserving
  }

def identityEntireMap (f : EntireFunction) : EntireFunctionMap :=
  { source := f, target := f, orderPreserving := true, typePreserving := true }

/-! ## Hadamard Transform -/

structure HadamardTransform where
  f : EntireFunction
  m : Nat    -- multiplicity at zero
  polynomial : ComplexNumbers → ComplexNumbers
  canonicalProduct : EntireFunction
  deriving Repr

def hadamardTransform (f : EntireFunction) : HadamardTransform :=
  { f := f
  , m := 0
  , polynomial := fun _ => zero
  , canonicalProduct := fun _ => one
  }

def hadamardTransformZeros (ht : HadamardTransform) : List ComplexNumbers :=
  []  -- stub: zeros of the canonical product

/-! ## Harmonic Map between Domains -/

structure HarmonicMap where
  domain : ComplexNumbers → Prop
  codomain : ComplexNumbers → Prop
  map : ComplexNumbers → Float
  isHarmonic : Bool
  deriving Repr

def isHarmonicMap (hm : HarmonicMap) : Prop :=
  isHarmonic hm.map

def composeHarmonicMaps (hm₁ hm₂ : HarmonicMap) : HarmonicMap :=
  { domain := hm₁.domain
  , codomain := hm₂.codomain
  , map := fun z => hm₂.map (ComplexNumbers.of (hm₁.map z) 0.0)
  , isHarmonic := hm₁.isHarmonic ∧ hm₂.isHarmonic
  }

def harmonicMapFromConjugate (u v : ComplexNumbers → Float) : HarmonicMap :=
  { domain := fun _ => true
  , codomain := fun _ => true
  , map := u
  , isHarmonic := true
  }

/-! ## #eval Tests -/

#eval "── Morphisms.Hom: Identity map on exp ──"
#eval (identityEntireMap entireExpZ).orderPreserving

#eval "── Morphisms.Hom: Hadamard transform of exp ──"
#eval (hadamardTransform entireExpZ).m

#eval "── Morphisms.Hom: Harmonic map from re(z) ──"
#eval (harmonicMapFromConjugate (fun z => z.re) (fun z => z.im)).isHarmonic

end MiniEntireHarmonic
