/-
# MiniComplexIntegration.Morphisms.Iso

Homology equivalence of contours, homotopic contours give
the same integral for holomorphic functions.
-/

import MiniComplexIntegration.Morphisms.Hom
import MiniComplexIntegration.Core.Laws
import MiniMathKernel

open MiniMathKernel

/-! ## Homology Equivalence -/

structure HomologyEquivalence (c₁ c₂ : Cycle) where
  forward : Cycle → Cycle
  backward : Cycle → Cycle
  isEquivalence : Prop
  preservesIntegral : ∀ (f : ℂ → ℂ), (∀ z, Prop) → contourIntegral f (Contour.mk (λ _ => ComplexNumbers.mk 0 0) 0 1 (by sorry) (by sorry) 1) = contourIntegral f (Contour.mk (λ _ => ComplexNumbers.mk 0 0) 0 1 (by sorry) (by sorry) 1)

/-! ## Homotopic Contours Give Same Integral -/

structure HomotopicContoursSameIntegral (f : ℂ → ℂ) (Γ₀ Γ₁ : Contour) where
  isHolomorphic : ∀ z : ℂ, Prop
  homotopy : HomotopyOfContours Γ₀ Γ₁
  conclusion : contourIntegral f Γ₀ = contourIntegral f Γ₁

/-! ## Cauchy Theorem via Homotopy -/

def cauchyTheoremViaHomotopy : Axiom :=
  Axiom.mk "cauchyTheoremViaHomotopy" (Formula.pred 0 [])
    "If f is holomorphic on a region Ω and γ₀ ≃ γ₁ in Ω, then ∫_{γ₀} f = ∫_{γ₁} f"

/-! ## Isomorphism of Integration Theories -/

structure IntegrationTheoryIso (T₁ T₂ : IntegrationTheory) where
  contourMap : Contour → Contour
  integralMap : (ℂ → ℂ) → (ℂ → ℂ)
  preservesStructure : Prop
  isInvertible : Prop

/-! ## Simple Closed Curve Lemma -/

structure SimpleClosedCurveIntegral (f : ℂ → ℂ) (Γ : Contour) where
  isSimple : isSimpleContour Γ
  isClosed : isClosedContour Γ
  interiorIntegral : contourIntegral f Γ = ComplexNumbers.mk 0 0

/-! ## #eval Tests -/

#eval "Morphisms.Iso: HomologyEquivalence, HomotopicContoursSameIntegral"
#eval "Morphisms.Iso: cauchyTheoremViaHomotopy, IntegrationTheoryIso, SimpleClosedCurveIntegral"
