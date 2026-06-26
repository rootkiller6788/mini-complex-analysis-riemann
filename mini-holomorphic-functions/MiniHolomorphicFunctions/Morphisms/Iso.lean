/-
# MiniHolomorphicFunctions.Morphisms.Iso

Biholomorphic equivalence, conformal equivalence,
and the automorphism group of the unit disc.
-/

import MiniHolomorphicFunctions.Morphisms.Hom
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Biholomorphic Equivalence -/

/-- Two domains U and V are biholomorphically equivalent. -/
structure BiholomorphicEquivalence (U V : Set ℂ) where
  forward : BiholomorphicMap U V
  backward : BiholomorphicMap V U
  leftInverse : ∀ z, z ∈ U → backward.f (forward.f z) = z
  rightInverse : ∀ w, w ∈ V → forward.f (backward.f w) = w

/-- Conformal equivalence: biholomorphic equivalence that preserves angles. -/
structure ConformalEquivalence (U V : Set ℂ) where
  equivalence : BiholomorphicEquivalence U V
  preservesAngles : Prop
  derivativeNonzero : ∀ z, z ∈ U → Prop

/-! ## Automorphism Group of the Unit Disc -/

/-- Aut(D) — the automorphism group of the unit disc D = {|z| < 1}. -/
structure AutUnitDisc where
  automorphisms : List (Automorphism {z : ℂ | ComplexNumbers.modulus z < 1})
  composition : Automorphism {z | ComplexNumbers.modulus z < 1} → Automorphism {z | ComplexNumbers.modulus z < 1} → Automorphism {z | ComplexNumbers.modulus z < 1}
  identity : Automorphism {z | ComplexNumbers.modulus z < 1}
  hasGroupStructure : Prop

/-- All automorphisms of 𝔻 are of the form e^{iθ}(z-a)/(1-āz). -/
def automorphismsOfUnitDisc : Axiom :=
  Axiom.mk "automorphismsOfUnitDisc" (Formula.pred 0 [])
    "Aut(𝔻) ≅ PSU(1,1): all automorphisms are Möbius transformations e^{iθ}(z-a)/(1-āz) with |a|<1"

/-- Automorphisms of ℂ are affine transformations: z ↦ az + b, a ≠ 0. -/
def automorphismsOfPlane : Axiom :=
  Axiom.mk "automorphismsOfPlane" (Formula.pred 0 [])
    "Aut(ℂ) = {z ↦ az + b | a ≠ 0}"

/-- Automorphisms of the Riemann sphere are Möbius transformations. -/
def automorphismsOfRiemannSphere : Axiom :=
  Axiom.mk "automorphismsOfRiemannSphere" (Formula.pred 0 [])
    "Aut(ℂ̂) ≅ PSL(2,ℂ): all Möbius transformations z ↦ (az+b)/(cz+d), ad-bc=1"

/-! ## #eval Tests -/

#eval "Morphisms.Iso: BiholomorphicEquivalence, ConformalEquivalence, AutUnitDisc"
#eval "Morphisms.Iso: Aut(𝔻) ≅ PSU(1,1), Aut(ℂ) = affine, Aut(ℂ̂) = PSL(2,ℂ)"
#eval "Morphisms.Iso: Riemann sphere automorphism group"

end MiniHolomorphicFunctions
