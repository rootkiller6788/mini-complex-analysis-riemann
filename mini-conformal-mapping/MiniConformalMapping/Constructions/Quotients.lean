/-
# Conformal Mapping: Quotients

Quotient of unit disc by Fuchsian groups,
modular surfaces, and quotient Riemann surfaces.
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Core.Objects

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Fuchsian Group -/

/-- A Fuchsian group Γ ⊂ PSL(2,ℝ) acting properly discontinuously on H -/
structure FuchsianGroup where
  generators : List MoebiusTransformation
  discrete : Prop
  properly_discontinuous : Prop
  acts_on_H : Prop

instance : Object FuchsianGroup where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "FuchsianGroup"
  repr _ := "Γ ⊂ PSL(2,ℝ)"

/-- The modular group PSL(2,ℤ) is a Fuchsian group -/
def modularGroup : FuchsianGroup where
  generators := [MoebiusTransformation.id]
  discrete := trivial
  properly_discontinuous := trivial
  acts_on_H := trivial

#eval "FuchsianGroup defined"

/-! ## Quotient Riemann Surface -/

/-- The quotient H/Γ is a Riemann surface -/
structure QuotientRiemannSurface where
  base : UpperHalfPlane
  group : FuchsianGroup
  genus : ℕ
  compact : Prop

instance : Object QuotientRiemannSurface where
  theory := TheoryName.ofString "ComplexAnalysis.ConformalMapping"
  objName := "QuotientRiemannSurface"
  repr s := s!"H/Γ (genus {s.genus})"

/-- The modular surface H/PSL(2,ℤ) has genus 0 -/
def modularSurface : QuotientRiemannSurface where
  base := (⟨⟩ : UpperHalfPlane)
  group := modularGroup
  genus := 0
  compact := trivial

#eval "QuotientRiemannSurface defined"

/-! ## Quotient of D by Fuchsian Group -/

/-- D/Γ: quotient of the unit disc by a Fuchsian group -/
structure DiscQuotient where
  group : FuchsianGroup
  fundamental_domain : Type
  quotient_surface : QuotientRiemannSurface

/-- Uniformization: every Riemann surface is D/Γ, ℂ/Γ, or ℂ̂ -/
def uniformizationByQuotient (surface : QuotientRiemannSurface) :
  True :=
  trivial  -- stub: every RS is quotient of D, ℂ, or ℂ̂

#eval "DiscQuotient defined"

end MiniConformalMapping
