/-
# MiniComplexIntegration.Core.Laws

Laws of contour integration: linearity, reversal, path additivity,
ML inequality, Cauchy-Goursat theorem, deformation invariance.
All represented as Axiom values.
-/

import MiniComplexIntegration.Core.Basic
import MiniMathKernel

open MiniMathKernel

/-! ## Linearity of Contour Integral -/

def linearityOfContourIntegral : Axiom :=
  Axiom.mk "linearityOfContourIntegral" (Formula.pred 0 [])
    "∫_γ (α f(z) + β g(z)) dz = α ∫_γ f(z) dz + β ∫_γ g(z) dz"

/-! ## Reversal of Contour -/

def reversalOfContour : Axiom :=
  Axiom.mk "reversalOfContour" (Formula.pred 0 [])
    "∫_{-γ} f(z) dz = -∫_γ f(z) dz"

/-! ## Path Additivity -/

def pathAdditivity : Axiom :=
  Axiom.mk "pathAdditivity" (Formula.pred 0 [])
    "If γ = γ₁ ∪ γ₂ (concatenation), then ∫_γ f(z) dz = ∫_{γ₁} f(z) dz + ∫_{γ₂} f(z) dz"

/-! ## ML Inequality -/

def mlInequality : Axiom :=
  Axiom.mk "mlInequality" (Formula.pred 0 [])
    "|∫_γ f(z) dz| ≤ M · L where M = sup_{z∈γ} |f(z)| and L = length(γ)"

/-! ## Cauchy-Goursat Theorem -/

def cauchyGoursatTheorem : Axiom :=
  Axiom.mk "cauchyGoursatTheorem" (Formula.pred 0 [])
    "If f is holomorphic in a simply connected domain D, then ∮_γ f(z) dz = 0 for every closed contour γ in D"

/-! ## Deformation Invariance -/

def deformationInvariance : Axiom :=
  Axiom.mk "deformationInvariance" (Formula.pred 0 [])
    "If γ₀, γ₁ are homotopic through closed curves in a region where f is holomorphic, then ∫_{γ₀} f = ∫_{γ₁} f"

/-! ## Axiom System -/

def integrationCoreAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[
    linearityOfContourIntegral,
    reversalOfContour,
    pathAdditivity,
    mlInequality,
    cauchyGoursatTheorem,
    deformationInvariance
  ]

/-! ## #eval Tests -/

#eval s!"Integration core axioms: {integrationCoreAxioms.axioms.length} (expected: 6)"
#eval "Core.Laws: linearity, reversal, pathAdditivity, mlInequality, cauchyGoursat, deformationInvariance"
