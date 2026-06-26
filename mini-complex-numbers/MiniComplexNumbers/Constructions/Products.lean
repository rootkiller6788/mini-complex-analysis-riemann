/-
# MiniComplexNumbers: Constructions — Products

Product of complex planes ℂ×ℂ, component-wise operations,
and product topology.
-/

import MiniComplexNumbers.Core.Basic

namespace MiniComplexNumbers

/-! ## Product Space ℂ×ℂ -/

structure ComplexPair where
  first : ComplexNumbers
  second : ComplexNumbers
  deriving Repr, Inhabited

/-! ## Component-wise Operations -/

def ComplexPair.add (p q : ComplexPair) : ComplexPair where
  first  := p.first + q.first
  second := p.second + q.second

def ComplexPair.mul (p q : ComplexPair) : ComplexPair where
  first  := p.first * q.first
  second := p.second * q.second

def ComplexPair.neg (p : ComplexPair) : ComplexPair where
  first  := -p.first
  second := -p.second

def ComplexPair.scale (c : ComplexNumbers) (p : ComplexPair) : ComplexPair where
  first  := c * p.first
  second := c * p.second

instance : Add ComplexPair where
  add := ComplexPair.add

instance : Neg ComplexPair where
  neg := ComplexPair.neg

/-! ## Zero and One -/

def ComplexPair.zero : ComplexPair where
  first := zero; second := zero

def ComplexPair.one : ComplexPair where
  first := one; second := one

/-! ## Product Topology -/

def ComplexPair.dist (p q : ComplexPair) : Float :=
  Float.sqrt (complexDist p.first q.first * complexDist p.first q.first +
              complexDist p.second q.second * complexDist p.second q.second)

def ComplexPair.productOpen (U : ComplexPair → Prop) : Prop :=
  True  -- stub: product of open sets is open

/-! ## #eval Tests -/

#eval "── Constructions.Products: Pair creation ──"
def exPair : ComplexPair := {
  first := ComplexNumbers.of 1 2
  second := ComplexNumbers.of 3 4
}
#eval exPair

#eval "── Constructions.Products: Pair addition ──"
#eval exPair + exPair

#eval "── Constructions.Products: Pair scaling ──"
#eval ComplexPair.scale (ComplexNumbers.of 2 0) exPair

end MiniComplexNumbers
