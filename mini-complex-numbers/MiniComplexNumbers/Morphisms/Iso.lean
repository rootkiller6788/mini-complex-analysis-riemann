/-
# MiniComplexNumbers: Morphisms — Iso

Complex field isomorphisms, biholomorphic maps,
automorphisms of ℂ as ℝ-algebra, connection to kernel Iso.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Morphisms.Hom

namespace MiniComplexNumbers

/-! ## Complex Field Isomorphism -/

structure ComplexFieldIso where
  forward  : ComplexNumbers → ComplexNumbers
  backward : ComplexNumbers → ComplexNumbers
  forwardLinear  : ∀ z w, forward (z + w) = forward z + forward w
  forwardMult    : ∀ z w, forward (z * w) = forward z * forward w
  forward_backward : ∀ z, backward (forward z) = z
  backward_forward : ∀ z, forward (backward z) = z
  deriving Repr

/-! ## Biholomorphic Maps -/

def isBiholomorphic (f : ComplexNumbers → ComplexNumbers) : Prop :=
  (∀ z, isConformal f z) ∧ (∃ g, ∀ z, g (f z) = z ∧ f (g z) = z)

/-! ## Automorphisms of ℂ as ℝ-Algebra -/

def identityAutomorphism : ComplexFieldIso where
  forward  := fun z => z
  backward := fun z => z
  forwardLinear  := by intro z w; rfl
  forwardMult    := by intro z w; rfl
  forward_backward := by intro z; rfl
  backward_forward := by intro z; rfl

def conjugationAutomorphism : ComplexFieldIso where
  forward  := complexConjugate
  backward := complexConjugate
  forwardLinear  := by
    intro z w; rfl  -- true for Float model
  forwardMult    := by
    intro z w; rfl  -- true for Float model
  forward_backward := by
    intro z; rfl  -- conjugate is involution
  backward_forward := by
    intro z; rfl
    -- Note: in ℂ, only {id, conj} are continuous ℝ-algebra automorphisms

/-! ## Connection to Kernel Iso -/

structure ComplexIso (A B : Type) where
  toMap : A → B
  fromMap : B → A
  leftInv  : ∀ x, fromMap (toMap x) = x
  rightInv : ∀ y, toMap (fromMap y) = y
  deriving Repr

/-! ## #eval Tests -/

#eval "── Morphisms.Iso: Identity automorphism ──"
#eval identityAutomorphism.forward (ComplexNumbers.of 5 7)

#eval "── Morphisms.Iso: Conjugation automorphism ──"
#eval conjugationAutomorphism.forward (ComplexNumbers.of 5 7)
#eval conjugationAutomorphism.backward (ComplexNumbers.of 5 -7)

#eval "── Morphisms.Iso: Roundtrip ──"
#eval identityAutomorphism.forward_backward (ComplexNumbers.of 3 4)

end MiniComplexNumbers
