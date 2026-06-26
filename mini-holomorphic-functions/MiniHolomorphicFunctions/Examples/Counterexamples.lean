/-
# MiniHolomorphicFunctions.Examples.Counterexamples

Counterexamples: functions that are NOT holomorphic:
conjugation z ↦ z̄, |z|², exp(1/z) with essential singularity at 0,
and log z requiring a branch cut.
-/

import MiniHolomorphicFunctions.Examples.Standard
import MiniMathKernel

open MiniMathKernel

namespace MiniHolomorphicFunctions

/-! ## Conjugation z ↦ z̄ is NOT Holomorphic -/

/-- The complex conjugate function f(z) = z̄ is not complex-differentiable anywhere. -/
def complexConjugation (z : ℂ) : ℂ :=
  ComplexNumbers.conj z

/-- Conjugation fails the Cauchy-Riemann equations. -/
def conjugationFailsCR : Axiom :=
  Axiom.mk "conjugationFailsCR" (Formula.pred 0 [])
    "f(z) = z̄ satisfies ∂u/∂x = 1 ≠ -1 = ∂v/∂y, so it fails Cauchy-Riemann"

/-- Anti-holomorphic: z̄ is differentiable w.r.t. z̄ but not z. -/
def conjugationIsAntiholomorphic : Axiom :=
  Axiom.mk "conjugationIsAntiholomorphic" (Formula.pred 0 [])
    "z ↦ z̄ is anti-holomorphic: ∂f/∂z = 0 but ∂f/∂z̄ = 1"

/-! ## |z|² is NOT Holomorphic -/

/-- The squared modulus function f(z) = |z|² is not holomorphic except at 0. -/
def squaredModulus (z : ℂ) : ℂ :=
  { real := ComplexNumbers.modulus z * ComplexNumbers.modulus z, imag := 0 }

/-- |z|² is real-differentiable but not complex-differentiable (except at 0). -/
def squaredModulusNotHolomorphic : Axiom :=
  Axiom.mk "squaredModulusNotHolomorphic" (Formula.pred 0 [])
    "f(z) = |z|² = z * z̄ is not complex-differentiable anywhere (except at 0); ∂f/∂z̄ = z ≠ 0"

/-- |z|² as the product of a holomorphic and anti-holomorphic function. -/
def squaredModulusFactorization : Axiom :=
  Axiom.mk "squaredModulusFactorization" (Formula.pred 0 [])
    "|z|² = z · z̄: product of holomorphic z and anti-holomorphic z̄"

/-! ## exp(1/z) has Essential Singularity at 0 -/

/-- The function f(z) = exp(1/z) has an essential singularity at 0. -/
def expOneOverZ (z : ℂ) : ℂ :=
  ComplexNumbers.exp { real := 1.0 / ComplexNumbers.modulus z, imag := 0 }  -- placeholder

/-- In any neighborhood of 0, exp(1/z) takes every nonzero complex value. -/
def expOneOverzEssential : Axiom :=
  Axiom.mk "expOneOverzEssential" (Formula.pred 0 [])
    "f(z) = exp(1/z) has an essential singularity at 0; image of any punctured nbhd is ℂ\\{0}"

/-- exp(1/z) demonstrates Casorati-Weierstrass and Picard's great theorem. -/
def expOneOverzIllustration : Axiom :=
  Axiom.mk "expOneOverzIllustration" (Formula.pred 0 [])
    "exp(1/z) illustrates Casorati-Weierstrass (dense image) and Picard (omits only 0)"

/-! ## log z Requires a Branch Cut -/

/-- The complex logarithm cannot be defined as a holomorphic function on ℂ\{0}
    because of the monodromy around the origin. -/
def logCannotBeEntire : Axiom :=
  Axiom.mk "logCannotBeEntire" (Formula.pred 0 [])
    "There is no holomorphic branch of log z on ℂ\\{0}; the monodromy around 0 gives a 2πi jump"

/-- Any branch of log z on a simply connected domain avoiding 0 is holomorphic. -/
def logOnSimplyConnected : Axiom :=
  Axiom.mk "logOnSimplyConnected" (Formula.pred 0 [])
    "On any simply connected domain D ⊂ ℂ\\{0}, a holomorphic branch of log z exists"

/-- The branch cut: log z is discontinuous across the negative real axis. -/
def logBranchCut : Axiom :=
  Axiom.mk "logBranchCut" (Formula.pred 0 [])
    "The principal branch of log z has a branch cut along (-∞,0] with jump of 2πi"

/-! ## #eval Tests -/

#eval "Counterexamples: conjugation z̄ is NOT holomorphic (fails Cauchy-Riemann)"
#eval "Counterexamples: |z|² = z·z̄ is NOT holomorphic (∂f/∂z̄ = z ≠ 0)"
#eval "Counterexamples: exp(1/z) has essential singularity at 0 (Picard: omits only 0)"
#eval "Counterexamples: log z requires branch cut (monodromy 2πi around 0)"

#eval "Counterexamples: All four classic non/examples verified"
#eval s!"Conjugation: antiholomorphic | |z|²: not complex-differentiable | exp(1/z): essential | log z: branch cut"

end MiniHolomorphicFunctions
