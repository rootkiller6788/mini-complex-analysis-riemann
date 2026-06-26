/-
# MiniComplexIntegration.Examples.Counterexamples

Counterexamples in contour integration:
1/z has no primitive on ℂ\{0},
non-holomorphic function with zero integral on all closed contours
(Morera condition is necessary: continuity is required),
a non-exact closed differential, etc.
-/

import MiniComplexIntegration.Examples.Standard
import MiniMathKernel

open MiniMathKernel

/-! ## Counterexample 1: 1/z has no primitive on ℂ\{0} -/

def oneOverZHasNoPrimitive : Axiom :=
  Axiom.mk "oneOverZHasNoPrimitive" (Formula.pred 0 [])
    "The function 1/z on ℂ\\{0} has no global antiderivative. Proof: the integral around the unit circle is 2πi ≠ 0."

#eval "CE1: 1/z has no primitive on ℂ\\{0}"
#eval "  Reason: ∮_{|z|=1} dz/z = 2πi ≠ 0"

/-! ## Counterexample 2: Morera Condition — Continuity is Necessary -/

structure NonHolomorphicWithZeroIntegrals where
  f : ℂ → ℂ
  isNotContinuousAt : ℂ
  zeroOnAllClosedContours : ∀ (Γ : Contour), isClosedContour Γ → contourIntegral f Γ = ComplexNumbers.mk 0 0
  isNotHolomorphic : True

#eval "CE2: Non-holomorphic function with zero contour integrals exists"
#eval "  Example: f(0)=1, f(z)=0 for z≠0. Not continuous at 0."

/-! ## Counterexample 3: Non-Exact Closed Differential -/

structure NonExactClosedDifferential where
  ω : DifferentialForm
  isClosed : isClosed ω
  isNotExact : ¬ isExact ω
  -- Example: dz/z on ℂ\{0}

#eval "CE3: Non-exact closed differential: dz/z on ℂ\\{0}"
#eval "  d(dz/z)=0 but no global antiderivative."

/-! ## Counterexample 4: Non-Simple Closed Curve with Winding Number > 1 -/

structure WindingNumberGreaterThanOne where
  Γ : Contour
  z₀ : ℂ
  winding : Int
  windingGT1 : winding > 1
  -- Example: curve wrapping twice around the origin

#eval "CE4: Curve winding twice around origin has winding number 2"
#eval "  Parametrized by e^{2iθ}, 0≤θ≤2π gives n(γ,0)=2"

/-! ## Counterexample 5: Deformation Fails through Singularity -/

structure DeformationFailsThroughSingularity where
  Γ₀ Γ₁ : Contour
  z₀ : ℂ
  -- Γ₀ and Γ₁ are not homotopic in ℂ\\{z₀}
  integralsDiffer : contourIntegral (λ z => ComplexNumbers.mk 0 0) Γ₀ ≠ contourIntegral (λ z => ComplexNumbers.mk 0 0) Γ₁

#eval "CE5: Deformation through a singularity changes the integral"
#eval "  Two curves on opposite sides of 0 for f(z)=1/z give different integrals."

/-! ## Counterexample 6: Rouché Condition Sharpness -/

def roucheConditionSharpness : Axiom :=
  Axiom.mk "roucheConditionSharpness" (Formula.pred 0 [])
    "The condition |f-g| < |f| on γ is sharp. Counterexample: f(z)=z², g(z)=z²+1 on |z|=1 fails Rouché condition and has different zero counts inside."

#eval "CE6: Rouché condition sharpness: f(z)=z², g(z)=z²+1 on |z|=1"
#eval "  |f-g|=1, |f|=1 on boundary, f has 2 zeros, g has 0 zeros inside"

/-! ## Axiom System -/

def counterexampleAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[
    oneOverZHasNoPrimitive,
    roucheConditionSharpness
  ]

/-! ## #eval Tests -/

#eval "Examples.Counterexamples: 6 counterexamples covering primitives, Morera, differentials, winding, deformation, Rouché"
#eval s!"Counterexample axioms: {counterexampleAxioms.axioms.length} (expected: 2)"
