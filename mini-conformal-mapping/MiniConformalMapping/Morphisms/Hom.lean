/-
# Conformal Mapping: Homomorphisms

Conformal maps between domains, Möbius maps,
Schwarz-Christoffel maps, and composition of conformal maps.
-/

import MiniConformalMapping.Core.Basic

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Conformal Map Between Domains -/

/-- A conformal map from domain D₁ to D₂ -/
structure ConformalMapType (D₁ D₂ : ComplexPlane) where
  f : ℂ → ℂ → ℂ → ℂ
  holomorphic : Prop
  injective : Prop
  surjective : Prop
  angle_preserving : Prop

/-- Identity conformal map on a domain -/
def conformalMapId (D : ComplexPlane) : ConformalMapType D D where
  f z := z
  holomorphic := trivial
  injective := trivial
  surjective := trivial
  angle_preserving := trivial

/-- Composition of conformal maps -/
def conformalMapComp {D₁ D₂ D₃ : ComplexPlane}
  (g : ConformalMapType D₂ D₃) (f : ConformalMapType D₁ D₂) : ConformalMapType D₁ D₃ where
  f z := g.f (f.f z)
  holomorphic := trivial
  injective := trivial
  surjective := trivial
  angle_preserving := trivial

#eval "ConformalMapType and composition defined"

/-! ## Möbius Map -/

/-- A Möbius transformation viewed as a conformal map -/
structure MoebiusMap (D₁ D₂ : ComplexPlane) where
  moebius : MoebiusTransformation
  maps_domain : Prop

/-- Every Möbius transformation is globally conformal on ℂ∪{∞} -/
def moebiusAsConformalMap (M : MoebiusTransformation) : ConformalMapType ⟨⟩ ⟨⟩ where
  f := M.apply
  holomorphic := trivial
  injective := trivial
  surjective := trivial
  angle_preserving := trivial

#eval "MoebiusMap defined"

/-! ## Schwarz-Christoffel Map -/

/-- Schwarz-Christoffel map: maps upper half-plane to a polygon -/
structure SchwarzChristoffelMap where
  angles : List ℚ  -- interior angles at vertices
  prevertices : List (ℂ → ℂ)  -- pre-images of vertices on ℝ
  normalizing_constant : ℂ → ℂ

/-- The Schwarz-Christoffel integral formula (statement only) -/
def schwarzChristoffelIntegral (sc : SchwarzChristoffelMap) (z : ℂ → ℂ) : ℂ → ℂ :=
  z  -- stub: C * ∫∏(ζ-a_k)^{α_k-1} dζ

#eval "SchwarzChristoffelMap defined"

end MiniConformalMapping
