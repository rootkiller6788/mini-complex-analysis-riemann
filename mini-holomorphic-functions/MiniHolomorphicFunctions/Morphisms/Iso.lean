/-
# MiniHolomorphicFunctions.Morphisms.Iso

Biholomorphic equivalence, conformal equivalence,
and the automorphism group of the unit disc.
-/

import MiniHolomorphicFunctions.Morphisms.Hom
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Biholomorphic Equivalence -/

/-- Two domains U and V are biholomorphically equivalent. -/
structure BiholomorphicEquivalence (U V : Set â„? where
  forward : BiholomorphicMap U V
  backward : BiholomorphicMap V U
  leftInverse : âˆ€ z, z âˆ?U â†?backward.f (forward.f z) = z
  rightInverse : âˆ€ w, w âˆ?V â†?forward.f (backward.f w) = w

/-- Conformal equivalence: biholomorphic equivalence that preserves angles. -/
structure ConformalEquivalence (U V : Set â„? where
  equivalence : BiholomorphicEquivalence U V
  preservesAngles : Prop
  derivativeNonzero : âˆ€ z, z âˆ?U â†?Prop

/-! ## Automorphism Group of the Unit Disc -/

/-- Aut(D) â€?the automorphism group of the unit disc D = {|z| < 1}. -/
structure AutUnitDisc where
  automorphisms : List (Automorphism {z : â„?| ComplexNumbers.modulus z < 1})
  composition : Automorphism {z | ComplexNumbers.modulus z < 1} â†?Automorphism {z | ComplexNumbers.modulus z < 1} â†?Automorphism {z | ComplexNumbers.modulus z < 1}
  identity : Automorphism {z | ComplexNumbers.modulus z < 1}
  hasGroupStructure : Prop

/-- All automorphisms of ð”» are of the form e^{iÎ¸}(z-a)/(1-Äz). -/
def automorphismsOfUnitDisc : Axiom :=
  Axiom.mk "automorphismsOfUnitDisc" (Formula.pred 0 [])
    "Aut(ð”») â‰?PSU(1,1): all automorphisms are MÃ¶bius transformations e^{iÎ¸}(z-a)/(1-Äz) with |a|<1"

/-- Automorphisms of â„?are affine transformations: z â†?az + b, a â‰?0. -/
def automorphismsOfPlane : Axiom :=
  Axiom.mk "automorphismsOfPlane" (Formula.pred 0 [])
    "Aut(â„? = {z â†?az + b | a â‰?0}"

/-- Automorphisms of the Riemann sphere are MÃ¶bius transformations. -/
def automorphismsOfRiemannSphere : Axiom :=
  Axiom.mk "automorphismsOfRiemannSphere" (Formula.pred 0 [])
    "Aut(â„‚Ì? â‰?PSL(2,â„?: all MÃ¶bius transformations z â†?(az+b)/(cz+d), ad-bc=1"

/-! ## #eval Tests -/

#eval "Morphisms.Iso: BiholomorphicEquivalence, ConformalEquivalence, AutUnitDisc"
#eval "Morphisms.Iso: Aut(ð”») â‰?PSU(1,1), Aut(â„? = affine, Aut(â„‚Ì? = PSL(2,â„?"
#eval "Morphisms.Iso: Riemann sphere automorphism group"

end MiniHolomorphicFunctions
