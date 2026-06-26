/-
# MiniComplexIntegration.Properties.Invariants

Winding number as topological invariant, period of differential form,
integrals as periods, homology intersection numbers.
-/

import MiniComplexIntegration.Core.Basic
import MiniComplexIntegration.Constructions.Quotients
import MiniMathKernel

open MiniMathKernel

/-! ## Winding Number as Topological Invariant -/

structure WindingNumberInvariant (Γ : Contour) (z₀ : ℂ) where
  winding : Int
  isHomotopyInvariant : Prop
  -- n(γ, z₀) is invariant under homotopy in ℂ \ {z₀}
  integerValued : True

def windingNumberHomotopyInvariant : Axiom :=
  Axiom.mk "windingNumberHomotopyInvariant" (Formula.pred 0 [])
    "The winding number n(γ, z₀) is invariant under homotopy of γ in ℂ \\ {z₀}"

/-! ## Period of Differential Form -/

structure PeriodOfDifferential (ω : DifferentialForm) (Γ : Contour) where
  period : ℂ
  -- ∫_Γ ω is a period of ω
  isIndependentOfHomology : Prop
  -- If Γ₁ ~ Γ₂ (homologous), then ∫_{Γ₁} ω = ∫_{Γ₂} ω

/-! ## Integrals as Periods -/

structure IntegralAsPeriod (f : ℂ → ℂ) where
  periods : List ℂ
  -- Primitive differences on homology basis
  equalsIntegral : contourIntegral f (Contour.mk (λ _ => ComplexNumbers.mk 0 0) 0 1 (by sorry) (by sorry) 1) ∈ periods

/-! ## Intersection Number -/

structure IntersectionNumber (Γ₁ Γ₂ : Contour) where
  number : Int
  formula : Prop
  -- Algebraic count of intersection points
  isBilinear : Prop
  isAntisymmetric : Prop

/-! ## Period Matrix -/

structure PeriodMatrix (Ω : Set ℂ) where
  genus : Nat
  periods : List (List ℂ)  -- 2g × g matrix
  riemannBilinearRelations : Prop
  -- Period matrix of a domain / Riemann surface

/-! ## #eval Tests -/

#eval "Properties.Invariants: WindingNumberInvariant, PeriodOfDifferential, IntegralAsPeriod"
#eval "Properties.Invariants: IntersectionNumber, PeriodMatrix, windingNumberHomotopyInvariant"
