/-
# Conformal Mapping: Isomorphisms

Conformal isomorphisms, equivalence of simply connected domains,
Riemann mapping: all proper simply connected ≅ D.
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Core.Objects

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Conformal Isomorphism -/

/-- A conformal isomorphism (biholomorphic map) between domains D₁ and D₂ -/
structure ConformalIsomorphism (D₁ D₂ : ComplexPlane) where
  forward : ℂ → ℂ → ℂ → ℂ
  inverse : ℂ → ℂ → ℂ → ℂ
  forward_conformal : isConformalMap forward (⟨⟩ : ℂ → ℂ)
  inverse_conformal : isConformalMap inverse (⟨⟩ : ℂ → ℂ)
  left_inv : ∀ z, inverse (forward z) = z
  right_inv : ∀ w, forward (inverse w) = w

/-- Identity conformal isomorphism -/
def conformalIsoId (D : ComplexPlane) : ConformalIsomorphism D D where
  forward z := z
  inverse z := z
  forward_conformal := trivial
  inverse_conformal := trivial
  left_inv _ := rfl
  right_inv _ := rfl

/-- Composition of conformal isomorphisms -/
def conformalIsoComp {D₁ D₂ D₃ : ComplexPlane}
  (g : ConformalIsomorphism D₂ D₃) (f : ConformalIsomorphism D₁ D₂) : ConformalIsomorphism D₁ D₃ where
  forward z := g.forward (f.forward z)
  inverse w := f.inverse (g.inverse w)
  forward_conformal := trivial
  inverse_conformal := trivial
  left_inv z := by simp [f.left_inv, g.left_inv]
  right_inv w := by simp [f.right_inv, g.right_inv]

#eval "ConformalIsomorphism defined"

/-! ## Riemann Mapping: Simply Connected ≅ Disc -/

/-- Riemann mapping theorem as isomorphism statement -/
def riemannMappingIso (D : ComplexPlane) (h : True) : ConformalIsomorphism D (⟨⟩ : ComplexPlane) :=
  -- Every proper simply connected domain is conformally isomorphic to D
  sorry

/-- The Cayley map gives H ≅ D -/
def cayleyIso : ConformalIsomorphism (⟨⟩ : ComplexPlane) (⟨⟩ : ComplexPlane) :=
  sorry  -- z ↦ (z-i)/(z+i)

#eval "Riemann mapping isomorphism statement"

end MiniConformalMapping
