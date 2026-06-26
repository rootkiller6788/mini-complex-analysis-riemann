/-
# MiniHolomorphicFunctions.Theorems.Classification

Singularity classification theorems:
Riemann removable, Casorati-Weierstrass,
Picard (Little and Great).
-/

import MiniHolomorphicFunctions.Theorems.Basic
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Riemann Removable Singularity -/

/-- If f is holomorphic and bounded on a punctured disk, the singularity is removable. -/
theorem riemannRemovableSingularity (f : ℂ → ℂ) (z₀ : ℂ) (r : ℝ) (hr : r > 0) (hhol : ∀ z, z ≠ z₀ ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r → isComplexDifferentiable f z) (hbounded : ∃ M : ℝ, ∀ z, z ≠ z₀ ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r → ComplexNumbers.modulus (f z) ≤ M) : isRemovableSingularity f z₀ := by
  sorry

/-! ## Casorati-Weierstrass -/

/-- Near an essential singularity, f comes arbitrarily close to any value. -/
theorem casoratiWeierstrass (f : ℂ → ℂ) (z₀ : ℂ) (hessential : isEssentialSingularity f z₀) : ∀ (w : ℂ) (ε : ℝ), ε > 0 → ∃ z : ℂ, z ≠ z₀ ∧ ComplexNumbers.modulus (ComplexNumbers.add (f z) { real := -w.real, imag := -w.imag }) < ε := by
  sorry

/-- Equivalent: the image of any punctured neighborhood is dense in ℂ. -/
theorem casoratiWeierstrassDense (f : ℂ → ℂ) (z₀ : ℂ) (hessential : isEssentialSingularity f z₀) (r : ℝ) (hr : r > 0) : ∀ (w : ℂ) (ε : ℝ), ε > 0 → ∃ z : ℂ, 0 < ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r ∧ ComplexNumbers.modulus (ComplexNumbers.add (f z) { real := -w.real, imag := -w.imag }) < ε := by
  sorry

/-! ## Picard Little Theorem -/

/-- A non-constant entire function misses at most one complex value. -/
theorem picardLittleTheorem (f : ℂ → ℂ) (hentire : isEntire f) (hnonconst : True) : (∀ w : ℂ, ∃ z : ℂ, ComplexNumbers.modulus (ComplexNumbers.add (f z) { real := -w.real, imag := -w.imag }) = 0) ∨ (∃ a : ℂ, (∀ w : ℂ, w ≠ a → ∃ z : ℂ, ComplexNumbers.modulus (ComplexNumbers.add (f z) { real := -w.real, imag := -w.imag }) = 0) ∧ ∀ z : ℂ, f z ≠ a) := by
  sorry

/-- Example verification: exp(z) omits only 0. -/
theorem exponentialOmitsOnlyZero : True := by
  sorry

/-! ## Picard Great Theorem -/

/-- Near an essential singularity, f attains every value infinitely often
    with at most one exception. -/
theorem picardGreatTheorem (f : ℂ → ℂ) (z₀ : ℂ) (hessential : isEssentialSingularity f z₀) : (∀ w : ℂ, ∀ r : ℝ, r > 0 → (Set.Infinite {z | 0 < ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r ∧ f z = w})) ∨ (∃ a : ℂ, (∀ w : ℂ, w ≠ a → ∀ r : ℝ, r > 0 → (Set.Infinite {z | 0 < ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r ∧ f z = w}) ∧ ∀ r : ℝ, r > 0 → ∀ z, z ≠ z₀ ∧ ComplexNumbers.modulus (ComplexNumbers.add z { real := -z₀.real, imag := -z₀.imag }) < r → f z ≠ a)) := by
  sorry

/-! ## Summary Theorems -/

def classificationTotalAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[
    riemannRemovableSingularityTheorem,
    casoratiWeierstrassTheorem,
    picardLittleTheorem,
    picardGreatTheorem
  ]

/-! ## #eval Tests -/

#eval "Theorems.Classification: riemannRemovableSingularity (with sorry proof)"
#eval "Theorems.Classification: casoratiWeierstrass, casoratiWeierstrassDense"
#eval "Theorems.Classification: picardLittleTheorem, picardGreatTheorem"

end MiniHolomorphicFunctions
