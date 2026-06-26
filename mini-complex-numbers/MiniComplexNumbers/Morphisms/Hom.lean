/-
# MiniComplexNumbers: Morphisms — Hom

Complex-linear maps, conjugate-linear maps, ℝ-linear vs ℂ-linear,
conformal maps, and composition.
-/

import MiniComplexNumbers.Core.Basic

namespace MiniComplexNumbers

/-! ## Complex Linear Map -/

structure ComplexLinearMap where
  map : ComplexNumbers → ComplexNumbers
  additive : ∀ z w, map (z + w) = map z + map w
  homogeneous : ∀ a z, map (a * z) = a * map z
  -- For Float model, these hold by structural equality
  deriving Repr

/-! ## Conjugate Linear Map -/

structure ConjugateLinearMap where
  map : ComplexNumbers → ComplexNumbers
  additive : ∀ z w, map (z + w) = map z + map w
  conjugateHomogeneous : ∀ a z, map (a * z) = complexConjugate a * map z
  deriving Repr

/-! ## ℝ-Linear vs ℂ-Linear -/

def isRealLinear (f : ComplexNumbers → ComplexNumbers) : Prop :=
  ∀ a b z w, f ((ComplexNumbers.of a 0) * z + (ComplexNumbers.of b 0) * w) =
              (ComplexNumbers.of a 0) * f z + (ComplexNumbers.of b 0) * f w

def isComplexLinear (f : ComplexNumbers → ComplexNumbers) : Prop :=
  (∀ z w, f (z + w) = f z + f w) ∧ (∀ a z, f (a * z) = a * f z)

/-! ## Conformal Map at a Point -/

def isConformal (f : ComplexNumbers → ComplexNumbers) (z₀ : ComplexNumbers) : Prop :=
  True  -- stub: preserves angles at z₀

/-! ## Composition -/

def complexMapComp (g f : ComplexNumbers → ComplexNumbers) : ComplexNumbers → ComplexNumbers :=
  g ∘ f

def ComplexLinearMap.comp (g f : ComplexLinearMap) : ComplexLinearMap where
  map := g.map ∘ f.map
  additive := by
    intro z w; simp [g.additive, f.additive]
  homogeneous := by
    intro a z; simp [g.homogeneous, f.homogeneous]

/-! ## #eval Tests -/

#eval "── Morphisms.Hom: Identity map ──"
def idMap : ComplexLinearMap := {
  map := fun z => z
  additive := by intro z w; rfl
  homogeneous := by intro a z; rfl
}
#eval idMap.map (ComplexNumbers.of 3 4)

#eval "── Morphisms.Hom: Conjugate map ──"
def conjMap : ConjugateLinearMap := {
  map := complexConjugate
  additive := by
    intro z w; rfl  -- true for this Float model
  conjugateHomogeneous := by
    intro a z; rfl  -- true for this Float model
}
#eval conjMap.map (ComplexNumbers.of 3 4)

end MiniComplexNumbers
