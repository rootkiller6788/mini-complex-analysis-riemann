/-
# MiniEntireHarmonic: Invariants

Invariants of entire and harmonic functions:
`order ρ`, `type τ`, `exponentOfConvergence`, `genus`,
`canonicalProductIndex`, `NevanlinnaCharacteristic`.
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic

/-! ## Order and Type (Invariants of Entire Functions) -/

def orderInvariant (f : EntireFunction) : Float :=
  orderOfGrowth_limsup f

def typeInvariant (f : EntireFunction) : Float :=
  typeOfEntire f

def orderAndType (f : EntireFunction) : Float × Float :=
  (orderInvariant f, typeInvariant f)

def classifyByOrder (f : EntireFunction) : String :=
  let ρ := orderInvariant f
  if ρ == 0 then "order 0 (polynomial-like growth)"
  else if ρ < 1 then s!"order {ρ} < 1"
  else if ρ == 1 then s!"order 1 (exponential type)"
  else if ρ < Float.infinity then s!"finite order {ρ}"
  else "infinite order"

/-! ## Exponent of Convergence -/

def exponentOfConvergence (zeros : List ComplexNumbers) : Float :=
  -- Infimum of α > 0 such that Σ 1/|a_n|^α < ∞
  0.0  -- stub

def exponentOfZeros (f : EntireFunction) : Float :=
  0.0  -- stub: ρ₁ = exponent of convergence of zeros

def exponentRelation : Prop :=
  -- Hadamard: exponent of convergence ≤ order of entire function
  True

/-! ## Genus Invariant -/

def genusInvariant (f : EntireFunction) : Nat :=
  genusOfEntire f

def genusFromOrder (ρ : Float) : Nat :=
  -- Genus p = floor(ρ) for non-integral ρ, else ρ or ρ-1
  if ρ < 0 then 0
  else
    let floor_ρ := ρ.toUInt64.toNat
    if Float.abs (ρ - Float.ofNat floor_ρ) < 0.0001 then floor_ρ - 1
    else floor_ρ

/-! ## Canonical Product Index -/

def canonicalProductIndex (f : EntireFunction) : Nat :=
  -- The integer k such that E_k are the primary factors in Hadamard product
  genusInvariant f

def canonicalIndexFromOrder (ρ : Float) : Nat :=
  let p := genusFromOrder ρ
  if p > 0 then p else 0

/-! ## Nevanlinna Characteristic -/

def nevanlinnaCharacteristic (f : EntireFunction) (r : Float) : Float :=
  0.0  -- stub: T(r,f) = m(r,f) + N(r,f)

def nevanlinnaProximity (f : EntireFunction) (r : Float) : Float :=
  0.0  -- stub: m(r,f) proximity function

def nevanlinnaCounting (f : EntireFunction) (r : Float) : Float :=
  0.0  -- stub: N(r,f) counting function

def nevanlinnaOrder (f : EntireFunction) : Float :=
  0.0  -- stub: limsup log T(r,f)/log r

/-! ## #eval Tests -/

#eval "── Properties.Invariants: Order invariant of exp ──"
#eval orderInvariant entireExpZ

#eval "── Properties.Invariants: Type invariant of exp ──"
#eval typeInvariant entireExpZ

#eval "── Properties.Invariants: Classify exp by order ──"
#eval classifyByOrder entireExpZ

#eval "── Properties.Invariants: Genus from order 1 ──"
#eval genusFromOrder 1.0

#eval "── Properties.Invariants: Genus from order 0.5 ──"
#eval genusFromOrder 0.5

#eval "── Properties.Invariants: Canonical index from order 1 ──"
#eval canonicalIndexFromOrder 1.0

end MiniEntireHarmonic
