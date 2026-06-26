/-
# MiniComplexNumbers: Properties — Invariants

Key invariants of ℂ: algebraically closed, characteristic zero, uncountable,
connected but not simply-connected after puncturing, modulus and argument.
-/

import MiniComplexNumbers.Core.Basic

namespace MiniComplexNumbers

/-! ## ℂ is Algebraically Closed -/

def isAlgebraicallyClosed : Prop :=
  fundamentalTheoremOfAlgebra_statement

/-! ## Characteristic Zero -/

def characteristicZero : Prop :=
  ∀ (n : Nat), n > 0 → (ComplexNumbers.of (Float.ofNat n) 0) ≠ zero

/-! ## Uncountable -/

def isUncountable : Prop :=
  ¬ (∃ (f : Nat → ComplexNumbers), ∀ (z : ComplexNumbers), ∃ (n : Nat), z = f n)

/-! ## Connectivity Properties -/

def isComplexPlaneConnected : Prop :=
  isConnected (fun _ : ComplexNumbers => True)

def isPuncturedPlaneConnected : Prop :=
  ¬ isConnected (fun z : ComplexNumbers => z ≠ zero)

def isPuncturedPlaneSimplyConnected : Prop :=
  ¬ isSimplyConnected (fun z : ComplexNumbers => z ≠ zero)

/-! ## Modulus as Invariant -/

def modulusInvariant (f : ComplexNumbers → ComplexNumbers) : Prop :=
  ∀ z, |f z| = |z|

/-! ## Argument as Invariant -/

def argumentInvariant (f : ComplexNumbers → ComplexNumbers) : Prop :=
  ∀ z, z ≠ zero → argument (f z) = argument z

/-! ## Classification Statement -/

def globalInvariants : List String :=
  ["algebraicallyClosed", "characteristicZero", "uncountable",
   "connected", "punctured_not_simply_connected"]

/-! ## #eval Tests -/

#eval "── Properties.Invariants: Characteristic zero for n=5 ──"
#eval ComplexNumbers.of 5 0 ≠ zero

#eval "── Properties.Invariants: Modulus invariant check ──"
#eval |ComplexNumbers.of 3 4|

#eval "── Properties.Invariants: Punctured plane ──"
#eval isPuncturedPlaneSimplyConnected

#eval "── Properties.Invariants: Global invariants list ──"
#eval globalInvariants

end MiniComplexNumbers
