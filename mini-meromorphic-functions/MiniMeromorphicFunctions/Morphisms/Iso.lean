import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Morphisms
import MiniMeromorphicFunctions.Core.Basic
import MiniMeromorphicFunctions.Morphisms.Hom

/-!
  # Isomorphisms: Bimeromorphic Equivalence and Automorphisms

  - `bimeromorphicEquivalence`: isomorphism in the category of
    meromorphic maps
  - `CremonaTransformation`: birational self-map of the projective plane
  - `MöbiusTransformation`: automorphism of the Riemann sphere
-/

namespace MiniMeromorphicFunctions

open MiniObjectKernel

/-! ## Bimeromorphic Equivalence -/

/-- Two Riemann surfaces are bimeromorphically equivalent if there
    exists a meromorphic map with a meromorphic inverse. For the
    Riemann sphere, this reduces to a Möbius transformation. -/
structure BimeromorphicEquivalence (X Y : Type) where
  forward : X → Y
  backward : Y → X
  forward_meromorphic : MeromorphicMap
  backward_meromorphic : MeromorphicMap
  left_inv : ∀ x, backward (forward x) = x
  right_inv : ∀ y, forward (backward y) = y

/-- The group of automorphisms of the Riemann sphere ℂ̂ is
    PGL(2, ℂ), the group of Möbius transformations
    z ↦ (az + b) / (cz + d) with ad - bc ≠ 0. -/
structure MöbiusTransformation where
  a : ℂ
  b : ℂ
  c : ℂ
  d : ℂ
  det_nonzero : a * d - b * c ≠ 0

/-- Apply a Möbius transformation to a point. -/
def MöbiusTransformation.apply (m : MöbiusTransformation) (z : ℂ) : ℂ :=
  if m.c * z + m.d = 0 then 0 else (m.a * z + m.b) / (m.c * z + m.d)

/-- Möbius transformations form a group under composition. -/
def MöbiusTransformation.comp (m₁ m₂ : MöbiusTransformation) : MöbiusTransformation where
  a := m₁.a * m₂.a + m₁.b * m₂.c
  b := m₁.a * m₂.b + m₁.b * m₂.d
  c := m₁.c * m₂.a + m₁.d * m₂.c
  d := m₁.c * m₂.b + m₁.d * m₂.d
  det_nonzero := by
    -- det(m₁ ∘ m₂) = det(m₁) * det(m₂) ≠ 0
    sorry

/-- Every Möbius transformation defines a meromorphic map. -/
def MöbiusTransformation.toMeromorphicMap (m : MöbiusTransformation) : MeromorphicMap where
  function := {
    toFun := m.apply
    poles := {z | m.c * z + m.d = 0}
    holomorphicOn := by sorry
    polesIsolated := by sorry
    finitePrincipalPart := by sorry
  }
  valueAtInfinity :=
    if m.c = 0 then WithInfinity.infinity
    else WithInfinity.some (m.a / m.c)

/-! ## Cremona Transformation -/

/-- A Cremona transformation is a birational self-map of the
    projective plane ℙ². The standard quadratic transformation is
    [x:y:z] ↦ [yz : zx : xy]. -/
structure CremonaTransformation where
  /-- Homogeneous polynomials defining the map. -/
  f0 : Polynomial (ℂ × ℂ × ℂ)
  f1 : Polynomial (ℂ × ℂ × ℂ)
  f2 : Polynomial (ℂ × ℂ × ℂ)
  /-- Birational: has a rational inverse. -/
  isBirational : True -- placeholder

/-! ## #eval Examples -/

#eval "Möbius: z ↦ (az+b)/(cz+d), ad-bc ≠ 0"
#eval "Bimeromorphic equivalence: invertible meromorphic map"
#eval "Cremona: birational self-map of ℙ²"

end MiniMeromorphicFunctions
