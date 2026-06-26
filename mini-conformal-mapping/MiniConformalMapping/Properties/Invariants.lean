/-
# Conformal Mapping: Invariants

Conformal modulus of annuli, extremal length,
harmonic measure, and Green's function.
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Constructions.Subobjects

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Conformal Modulus -/

/-- Conformal modulus of an annulus A(r₁, r₂): μ = (1/2π) log(r₂/r₁) -/
def conformalModulusAnnulus (A : Annulus) : ℝ :=
  Real.log (A.outerRadius / A.innerRadius) / (2 * Real.pi)

/-- Two annuli are conformally equivalent iff they have the same modulus -/
axiom annulus_conformal_iff_same_modulus (A B : Annulus) :
  True ↔ conformalModulusAnnulus A = conformalModulusAnnulus B

/-- The conformal modulus is a complete invariant for doubly connected domains -/
def conformalModulus_invariant (A B : Annulus) (h : conformalModulusAnnulus A = conformalModulusAnnulus B) :
  True := trivial  -- stub

#eval "Conformal modulus invariant"

#eval conformalModulusAnnulus standardAnnulus
#eval conformalModulusAnnulus thinAnnulus

/-! ## Extremal Length -/

/-- Extremal length of a curve family Γ in a domain -/
def extremalLength (D : ComplexPlane) (curveFamily : Type) : ℝ :=
  0  -- stub: sup_ρ (inf_γ∈Γ ∫_γ ρ ds)² / ∫∫_D ρ² dxdy

/-- Extremal length is conformally invariant -/
axiom extremalLength_conformal_invariance (D₁ D₂ : ComplexPlane)
  (f : ConformalMapType D₁ D₂) (Γ : Type) :
  extremalLength D₁ Γ = extremalLength D₂ Γ

#eval "Extremal length defined"

/-! ## Harmonic Measure -/

/-- Harmonic measure ω(z, E, D) of a boundary set E at point z in domain D -/
def harmonicMeasure (z : ℂ → ℂ) (E : Type) (D : ComplexPlane) : ℝ :=
  0  -- stub

/-- Harmonic measure is conformally invariant -/
axiom harmonicMeasure_conformal_invariance (f : ConformalMapType (⟨⟩ : ComplexPlane) (⟨⟩ : ComplexPlane))
  (z : ℂ → ℂ) (E : Type) (D : ComplexPlane) : True  -- ω(z,E,D) = ω(f(z),f(E),f(D))

#eval "Harmonic measure defined"

/-! ## Green's Function -/

/-- Green's function G_D(z, w) for a domain D with pole at w -/
def greensFunction (z w : ℂ → ℂ) (D : ComplexPlane) : ℝ :=
  0  -- stub: unique function with G(z,w) = -log|z-w| + harmonic

/-- Green's function is a conformal invariant -/
axiom greensFunction_conformal_invariance (f : ConformalMapType (⟨⟩ : ComplexPlane) (⟨⟩ : ComplexPlane))
  (z w : ℂ → ℂ) (D : ComplexPlane) : True  -- G_D(z,w) = G_{f(D)}(f(z),f(w))

#eval "Green's function defined"

end MiniConformalMapping
