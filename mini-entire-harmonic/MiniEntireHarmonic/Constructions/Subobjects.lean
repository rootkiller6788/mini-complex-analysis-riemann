/-
# MiniEntireHarmonic: Subobjects

Polynomials ⊂ entire functions (finite order), exponential
polynomials, finite-order entire functions as subring,
bounded harmonic functions h^∞(D).
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic

/-! ## Polynomials as Subring of Entire Functions -/

def isPolynomialSubobject : Prop :=
  (∀ f : EntireFunction, isPolynomial f → isEntire f) ∧
  (isPolynomial entireZero) ∧
  (isPolynomial entireOne) ∧
  (∀ f g, isPolynomial f ∧ isPolynomial g → isPolynomial (entireAdd f g)) ∧
  (∀ f g, isPolynomial f ∧ isPolynomial g → isPolynomial (entireMul f g))

def polynomialOrder (f : EntireFunction) : Float :=
  0.0  -- stub: degree as real

def polynomialDegree (f : EntireFunction) : Nat :=
  0  -- stub

/-! ## Exponential Polynomials -/

def exponentialPolynomial (f : EntireFunction) : Prop :=
  -- f(z) = Σ P_k(z) e^{a_k z} where P_k are polynomials
  True

def expPolynomialStructure : String :=
  "Exponential polynomials: Σ P_k(z) e^{α_k z}, P_k polynomials, α_k ∈ ℂ"

def expPolynomialOrder (f : EntireFunction) : Float :=
  1.0  -- exponential polynomials have order ≤ 1

/-! ## Finite-Order Entire Functions -/

def finiteOrderEntireFunctions : Set EntireFunction :=
  fun f => orderOfGrowth_limsup f < 100.0  -- arbitrary bound for "finite"

def isFiniteOrderSubring : Prop :=
  (finiteOrderEntireFunctions entireZero) ∧
  (finiteOrderEntireFunctions entireOne) ∧
  (∀ f g, finiteOrderEntireFunctions f ∧ finiteOrderEntireFunctions g →
          finiteOrderEntireFunctions (entireAdd f g)) ∧
  (∀ f g, finiteOrderEntireFunctions f ∧ finiteOrderEntireFunctions g →
          finiteOrderEntireFunctions (entireMul f g))

/-! ## Bounded Harmonic Functions -/

def boundedHarmonicOnD (u : ComplexNumbers → Float) : Prop :=
  isHarmonic u ∧ (∀ z, modulus z < 1.0 → |u z| < M) where M := 100.0

def boundedHarmonicSpace : Set (ComplexNumbers → Float) :=
  fun u => isHarmonic u ∧ (∃ M, ∀ z, |u z| ≤ M)

def hInfinityNorm (u : ComplexNumbers → Float) : Float :=
  0.0  -- stub: ||u||_∞

/-! ## Subharmonic Functions (generalization) -/

def isSubharmonic (u : ComplexNumbers → Float) : Prop :=
  -- Δu ≥ 0 (distributional sense)
  True

def subharmonicFunctions : Set (ComplexNumbers → Float) :=
  fun u => isSubharmonic u

/-! ## #eval Tests -/

#eval "── Constructions.Subobjects: exp(z) is finite order ──"
#eval orderOfGrowth 1.0 1.0

#eval "── Constructions.Subobjects: Exponential polynomial structure ──"
#eval expPolynomialStructure

#eval "── Constructions.Subobjects: Finite order classification ──"
#eval finiteOrderEntireFunctions entireExpZ

end MiniEntireHarmonic
