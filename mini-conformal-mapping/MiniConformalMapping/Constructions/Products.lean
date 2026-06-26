/-
# Conformal Mapping: Products

Product of conformal maps, Cartesian product of domains,
bidisc D × D and polydiscs.
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Morphisms.Hom

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Product Domain -/

/-- Cartesian product of two domains -/
structure ProductDomain where
  D₁ : ComplexPlane
  D₂ : ComplexPlane

instance : Object ProductDomain where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "ProductDomain"
  repr p := s!"{p.D₁} × {p.D₂}"

/-- The bidisc D × D = {(z,w) : |z|<1, |w|<1} -/
def bidisc : ProductDomain where
  D₁ := ⟨⟩
  D₂ := ⟨⟩

#eval "ProductDomain and bidisc defined"

/-! ## Product of Conformal Maps -/

/-- The product of two conformal maps f × g : D₁×D₂ → D₁'×D₂' -/
def productConformalMap {D₁ D₂ D₁' D₂' : ComplexPlane}
  (f : ConformalMapType D₁ D₁') (g : ConformalMapType D₂ D₂') : ConformalMapType (ProductDomain.mk D₁ D₂) (ProductDomain.mk D₁' D₂') where
  f combined := combined  -- stub: (f(z), g(w)) for (z,w) ∈ D₁×D₂
  holomorphic := trivial
  injective := trivial
  surjective := trivial
  angle_preserving := trivial

#eval "Product conformal map defined"

/-! ## Polydisc -/

/-- The n-dimensional polydisc Dⁿ = ∏ᵢ{|zᵢ| < 1} -/
structure Polydisc where
  n : ℕ

instance : Object Polydisc where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "Polydisc"
  repr p := s!"D^{p.n}"

/-- Automorphisms of the bidisc (not just Aut(D)×Aut(D)!) -/
def bidiscAutomorphisms : Type := MoebiusTransformation  -- stub

#eval "Polydisc defined"

end MiniConformalMapping
