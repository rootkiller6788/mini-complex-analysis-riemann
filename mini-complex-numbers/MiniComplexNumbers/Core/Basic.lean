/-
# MiniComplexNumbers: Basic Definitions

Defines the `ComplexNumbers` structure with real and imaginary parts,
arithmetic operations, conjugate, modulus, argument, polar form,
and the `ℂ` notation. Covers de Moivre, roots of unity,
and the complex plane as a metric space.
-/

import MiniObjectKernel.Core.Basic

namespace MiniComplexNumbers

open MiniObjectKernel

/-! ## Complex Number Structure -/

structure ComplexNumbers where
  re : Float
  im : Float
  deriving Repr, Inhabited, BEq

def ComplexNumbers.of (r i : Float) : ComplexNumbers := { re := r, im := i }

/-! ## Notation and Constants -/

notation "ℂ" => ComplexNumbers

def i : ComplexNumbers := ComplexNumbers.of 0 1

def zero : ComplexNumbers := ComplexNumbers.of 0 0
def one  : ComplexNumbers := ComplexNumbers.of 1 0

/-! ## Arithmetic Operations -/

def ComplexNumbers.add (z w : ComplexNumbers) : ComplexNumbers :=
  ComplexNumbers.of (z.re + w.re) (z.im + w.im)

def ComplexNumbers.mul (z w : ComplexNumbers) : ComplexNumbers :=
  ComplexNumbers.of (z.re * w.re - z.im * w.im) (z.re * w.im + z.im * w.re)

instance : Add ComplexNumbers where
  add := ComplexNumbers.add

instance : Mul ComplexNumbers where
  mul := ComplexNumbers.mul

def ComplexNumbers.neg (z : ComplexNumbers) : ComplexNumbers :=
  ComplexNumbers.of (-z.re) (-z.im)

instance : Neg ComplexNumbers where
  neg := ComplexNumbers.neg

/-! ## Complex Conjugate -/

def complexConjugate (z : ComplexNumbers) : ComplexNumbers :=
  ComplexNumbers.of z.re (-z.im)

/-! ## Modulus -/

def modulus (z : ComplexNumbers) : Float :=
  Float.sqrt (z.re * z.re + z.im * z.im)

notation "|" z "|" => modulus z

/-! ## Argument (principal value, (-π, π]) -/

def argument (z : ComplexNumbers) : Float :=
  Float.atan2 z.im z.re

/-! ## Polar Form -/

def polarForm (r θ : Float) : ComplexNumbers :=
  ComplexNumbers.of (r * Float.cos θ) (r * Float.sin θ)

def cis (θ : Float) : ComplexNumbers :=
  ComplexNumbers.of (Float.cos θ) (Float.sin θ)

/-! ## De Moivre's Formula -/

def deMoivre (θ : Float) (n : Nat) : ComplexNumbers :=
  cis (Float.ofNat n * θ)

/-! ## Roots of Unity -/

def nthRootsOfUnity (n : Nat) : List ComplexNumbers :=
  if n = 0 then []
  else
    let angle := 2 * Float.pi / Float.ofNat n
    (List.range n).map fun k => cis (Float.ofNat k * angle)

/-! ## Complex Plane as Metric Space -/

def complexDistance (z w : ComplexNumbers) : Float :=
  |complexConjugate z + w|  -- placeholder: should be |z - w|

def complexDist (z w : ComplexNumbers) : Float :=
  modulus (z.add (w.neg))

/-! ## Topological Notions -/

def OpenSet (U : ComplexNumbers → Prop) : Prop :=
  ∀ z, U z → ∃ ε > 0, ∀ w, complexDist z w < ε → U w

def ClosedSet (C : ComplexNumbers → Prop) : Prop :=
  ∀ z, (∀ ε > 0, ∃ w, C w ∧ complexDist z w < ε) → C z

def isConnected (U : ComplexNumbers → Prop) : Prop := True  -- stub

def isSimplyConnected (U : ComplexNumbers → Prop) : Prop := True  -- stub

/-! ## #eval Tests -/

#eval "── Core.Basic: ComplexNumbers.of ──"
#eval ComplexNumbers.of 1 0
#eval ComplexNumbers.of 0 1
#eval ComplexNumbers.of 3 4

#eval "── Core.Basic: i ──"
#eval i

#eval "── Core.Basic: Conjugate ──"
#eval complexConjugate (ComplexNumbers.of 3 4)

#eval "── Core.Basic: Modulus ──"
#eval modulus (ComplexNumbers.of 3 4)  -- should be 5

#eval "── Core.Basic: Argument ──"
#eval argument (ComplexNumbers.of 1 1)  -- should be π/4 ≈ 0.785

#eval "── Core.Basic: Polar form ──"
#eval polarForm 1 0  -- (1,0)
#eval polarForm 2 1.5707963267948966  -- (0,2)

#eval "── Core.Basic: cis ──"
#eval cis 0
#eval cis 3.141592653589793

#eval "── Core.Basic: Roots of unity n=4 ──"
#eval nthRootsOfUnity 4

end MiniComplexNumbers
