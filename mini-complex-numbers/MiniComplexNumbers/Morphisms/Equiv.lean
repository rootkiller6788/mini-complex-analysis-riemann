/-
# MiniComplexNumbers: Morphisms — Equiv

Conformal equivalence of domains in ℂ, biholomorphic equivalence,
and stereographic projection (ℂ ≅ S²\{∞}).
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Morphisms.Hom

namespace MiniComplexNumbers

/-! ## Conformal Equivalence of Domains -/

structure ConformalEquivalence (U V : Set ComplexNumbers) where
  forward  : ComplexNumbers → ComplexNumbers
  backward : ComplexNumbers → ComplexNumbers
  mapsTo   : ∀ z, U z → V (forward z)
  mapsBack : ∀ w, V w → U (backward w)
  isConformalOn : ∀ z, U z → isConformal forward z
  leftInv  : ∀ z, U z → backward (forward z) = z
  rightInv : ∀ w, V w → forward (backward w) = w
  deriving Repr

/-! ## Biholomorphic Equivalence -/

structure BiholomorphicEquivalence (U V : Set ComplexNumbers) where
  forward  : ComplexNumbers → ComplexNumbers
  backward : ComplexNumbers → ComplexNumbers
  forwardHolomorphic : True  -- stub
  backwardHolomorphic : True  -- stub
  forward_backward : ∀ z, U z → backward (forward z) = z
  backward_forward : ∀ w, V w → forward (backward w) = w
  deriving Repr

/-! ## Stereographic Projection (ℂ ≅ S²\{∞}) -/

def stereographicProject (z : ComplexNumbers) : Float × Float × Float :=
  let d := 1 + z.re * z.re + z.im * z.im
  ((2 * z.re) / d, (2 * z.im) / d, (1 - z.re * z.re - z.im * z.im) / d)

def stereographicInverse (x y z' : Float) : ComplexNumbers :=
  if z' = 1 then ComplexNumbers.of 0 0  -- point at infinity
  else
    let d := 1 - z'
    ComplexNumbers.of (x / d) (y / d)

/-! ## Riemann Sphere Point at Infinity -/

def pointAtInfinity : Float × Float × Float := (0, 0, 1)

def riemannSphere : Set (Float × Float × Float) :=
  fun p => p.1 * p.1 + p.2.1 * p.2.1 + p.2.2 * p.2.2 = 1

/-! ## #eval Tests -/

#eval "── Morphisms.Equiv: Stereographic projection of 0 ──"
#eval stereographicProject (ComplexNumbers.of 0 0)

#eval "── Morphisms.Equiv: Stereographic projection of 1 ──"
#eval stereographicProject (ComplexNumbers.of 1 0)

#eval "── Morphisms.Equiv: Stereographic projection of i ──"
#eval stereographicProject (ComplexNumbers.of 0 1)

#eval "── Morphisms.Equiv: Inverse check ──"
#eval stereographicInverse 0 0 (-1)

end MiniComplexNumbers
