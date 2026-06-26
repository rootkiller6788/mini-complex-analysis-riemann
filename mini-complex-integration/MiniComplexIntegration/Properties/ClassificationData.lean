/-
# MiniComplexIntegration.Properties.ClassificationData

Classification of periods, abelian differentials,
classification by residue data, period lattice.
-/

import MiniComplexIntegration.Properties.Invariants
import MiniMathKernel

open MiniMathKernel

/-! ## Classification of Periods -/

structure PeriodClassification (Ω : Set ℂ) where
  periodLattice : List ℂ → List ℂ → Prop
  -- Periods form a lattice Λ ⊂ ℂ
  isFullRank : Prop
  classNumber : Nat

/-! ## Abelian Differentials -/

structure AbelianDifferential (Ω : Set ℂ) where
  differential : DifferentialForm
  isHolomorphic : Prop
  -- ω is a holomorphic 1-form on Ω
  dimensionOfSpace : Nat  -- g = genus

structure AbelianDifferentialFirstKind (Ω : Set ℂ) extends AbelianDifferential Ω where
  isEverywhereHolomorphic : Prop

structure AbelianDifferentialSecondKind (Ω : Set ℂ) extends AbelianDifferential Ω where
  hasPolesOnly : Prop
  zeroResidue : ∀ (z₀ : ℂ), residueAt (λ _ => ComplexNumbers.mk 0 0) z₀ = ComplexNumbers.mk 0 0

structure AbelianDifferentialThirdKind (Ω : Set ℂ) extends AbelianDifferential Ω where
  simplePoles : Prop
  -- Simple poles with nonzero residues

/-! ## Classification by Residue Data -/

structure ResidueClassification (f : ℂ → ℂ) (Ω : Set ℂ) where
  poles : List ℂ
  residues : List ℂ
  principalParts : List (Nat → ℂ)
  -- Classify meromorphic functions by their principal parts at poles

/-! ## Riemann Bilinear Relations -/

structure RiemannBilinearRelations where
  periodMatrix : List (List ℂ)
  firstKindPeriods : List (List ℂ)
  secondKindPeriods : List (List ℂ)
  relations : Prop
  -- ∫_{a_i} ω_j = δ_{ij}, ∫_{b_i} ω_j = τ_{ij} with τ symmetric, Im(τ) > 0

/-! ## #eval Tests -/

#eval "Properties.ClassificationData: PeriodClassification, AbelianDifferential (1st/2nd/3rd kind)"
#eval "Properties.ClassificationData: ResidueClassification, RiemannBilinearRelations"
