/-
# MiniComplexIntegration.Examples.Standard

Standard examples of contour integration:
∫_γ 1/z dz around origin, ∫_γ e^z/(z-1) dz,
∫_{-∞}^{∞} 1/(1+x²) dx via residues,
∫_0^{2π} 1/(5+4cosθ) dθ = 2π/3.
-/

import MiniComplexIntegration.Theorems.Basic
import MiniMathKernel

open MiniMathKernel

/-! ## Example 1: ∫_γ 1/z dz = 2πi around origin -/

def exampleIntegralOneOverZ : Axiom :=
  Axiom.mk "integralOneOverZ" (Formula.pred 0 [])
    "∮_{|z|=1} dz/z = 2πi — the fundamental contour integral"

#eval "Example 1: ∫_γ 1/z dz = 2πi around the origin"
#eval "  The function 1/z has residue 1 at z=0."

/-! ## Example 2: ∫_γ e^z/(z-1) dz -/

def exampleIntegralExpOverZM1 : Axiom :=
  Axiom.mk "integralExpOverZM1" (Formula.pred 0 [])
    "∮_{|z-1|=r} e^z/(z-1) dz = 2πi·e (residue at z=1 is e)"

#eval "Example 2: ∫_γ e^z/(z-1) dz = 2πi·e"
#eval "  Residue of e^z/(z-1) at z=1 is e^1 = e."

/-! ## Example 3: ∫_{-∞}^{∞} 1/(1+x²) dx = π via residues -/

def exampleIntegralRealRational : Axiom :=
  Axiom.mk "integralRealRational" (Formula.pred 0 [])
    "∫_{-∞}^{∞} 1/(1+x²) dx = π — evaluate via semicircular contour and residues"

#eval "Example 3: ∫_{-∞}^{∞} 1/(1+x²) dx = π"
#eval "  Use upper half-plane contour; poles at z=±i, only z=i inside."

/-! ## Example 4: ∫_0^{2π} 1/(5+4cosθ) dθ = 2π/3 -/

def exampleIntegralTrigonometric : Axiom :=
  Axiom.mk "integralTrigonometric" (Formula.pred 0 [])
    "∫_0^{2π} 1/(5+4cosθ) dθ = 2π/3"

#eval "Example 4: ∫_0^{2π} 1/(5+4cosθ) dθ = 2π/3"
#eval "  Substitute z=e^{iθ}, cosθ=(z+1/z)/2, unit circle contour."

/-! ## Example 5: ∫_0^{2π} 1/(a+bcosθ) dθ (general) -/

def exampleIntegralTrigonometricGeneral : Axiom :=
  Axiom.mk "integralTrigonometricGeneral" (Formula.pred 0 [])
    "∫_0^{2π} 1/(a+b cosθ) dθ = 2π/√(a²-b²) for a > |b|"

#eval "Example 5: ∫_0^{2π} 1/(a+b cosθ) dθ = 2π/√(a²-b²) when a > |b|"

/-! ## Example 6: ∫_0^{∞} sin x / x dx = π/2 -/

def exampleIntegralSincInfinity : Axiom :=
  Axiom.mk "integralSincInfinity" (Formula.pred 0 [])
    "∫_0^{∞} sin x / x dx = π/2 — evaluate via indented contour and Jordan lemma"

#eval "Example 6: ∫_0^{∞} sin x / x dx = π/2"
#eval "  Indented contour avoiding z=0, Jordan's lemma for large R."

/-! ## Example 7: ∫_0^{∞} cos x / (1+x²) dx = π/(2e) -/

def exampleIntegralRealCos : Axiom :=
  Axiom.mk "integralRealCos" (Formula.pred 0 [])
    "∫_0^{∞} cos x / (1+x²) dx = π/(2e)"

#eval "Example 7: ∫_0^{∞} cos x / (1+x²) dx = π/(2e)"
#eval "  Use contour integral of e^{iz}/(1+z²); pole at z=i."

/-! ## Axiom System -/

def standardExamplesAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[
    exampleIntegralOneOverZ,
    exampleIntegralExpOverZM1,
    exampleIntegralRealRational,
    exampleIntegralTrigonometric,
    exampleIntegralTrigonometricGeneral,
    exampleIntegralSincInfinity,
    exampleIntegralRealCos
  ]

/-! ## #eval Tests -/

#eval s!"Standard examples: {standardExamplesAxioms.axioms.length} integral evaluations (expected: 7)"
