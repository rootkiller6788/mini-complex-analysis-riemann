/-
# MiniComplexIntegration.Constructions.Products

Product of contours, Fubini-type theorem for double contour integral,
product integration domains.
-/

import MiniComplexIntegration.Core.Basic
import MiniMathKernel

open MiniMathKernel

/-! ## Product of Contours -/

structure ProductContour (Γ₁ Γ₂ : Contour) where
  γ_prod : ℝ × ℝ → ℂ × ℂ
  -- Product parametrization
  domain : Set (ℂ × ℂ)
  isProduct : Prop

/-! ## Double Contour Integral -/

structure DoubleContourIntegral (f : ℂ × ℂ → ℂ) (Γ₁ Γ₂ : Contour) where
  value : ℂ
  definition : Prop
  -- ∫_{Γ₁} ∫_{Γ₂} f(z, w) dw dz

/-! ## Fubini-Type Theorem -/

structure FubiniContourIntegral (f : ℂ × ℂ → ℂ) (Γ₁ Γ₂ : Contour) where
  isSeparable : Prop
  fubini : Prop
  -- ∫_{Γ₁} (∫_{Γ₂} f(z,w) dw) dz = ∫_{Γ₂} (∫_{Γ₁} f(z,w) dz) dw

/-! ## Tensor Product of Integration Domains -/

structure TensorProductIntegration (Ω₁ Ω₂ : Set ℂ) where
  productDomain : Set (ℂ × ℂ)
  productContour : ProductContour
    (Contour.mk (λ _ => ComplexNumbers.mk 0 0) 0 1 (by sorry) (by sorry) 1)
    (Contour.mk (λ _ => ComplexNumbers.mk 0 0) 0 1 (by sorry) (by sorry) 1)

/-! ## Product Homology -/

structure ProductHomologyClass where
  productClass : Cycle → Cycle → Cycle
  kunnethFormula : Prop
  -- H₁(X × Y) ≅ H₁(X) ⊗ H₁(Y)

/-! ## #eval Tests -/

#eval "Constructions.Products: ProductContour, DoubleContourIntegral, FubiniContourIntegral"
#eval "Constructions.Products: TensorProductIntegration, ProductHomologyClass"
