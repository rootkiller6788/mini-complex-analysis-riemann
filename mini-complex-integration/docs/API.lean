/-
# API Reference — MiniComplexIntegration

Complete API reference for the complex integration package.
-/

import MiniComplexIntegration

open MiniComplexIntegration

/-!
## Core API

### Contour
- `Contour.mk (γ : ℝ → ℂ) (a b : ℝ) (isPiecewiseC1 isContinuous : Prop) (segmentCount : Nat) : Contour`
- `isClosedContour (Γ : Contour) : Prop`
- `isSimpleContour (Γ : Contour) : Prop`
- `contourLength (Γ : Contour) : ℝ`

### Contour Integral
- `contourIntegral (f : ℂ → ℂ) (Γ : Contour) : ℂ`
- `ContourIntegral.mk (f : ℂ → ℂ) (Γ : Contour) (value : ℂ) (definitionSum : Prop) : ContourIntegral f Γ`

### Winding Number
- `windingNumber (Γ : Contour) (z₀ : ℂ) : Int`
- `WindingNumber.mk (Γ : Contour) (z₀ : ℂ) (n : Int) (formula : Prop) : WindingNumber Γ z₀`

### Residue
- `residueAt (f : ℂ → ℂ) (z₀ : ℂ) : ℂ`
- `SingularityType : removable | pole (order : Nat) | essential`

### Axiom Systems
- `integrationCoreAxioms : AxiomSystem` (6 axioms)
- `cauchyTheoryIntegrationAxioms : AxiomSystem` (3 axioms)
- `residueIntegrationAxioms : AxiomSystem` (4 axioms)
- `preservationAxioms : AxiomSystem` (3 axioms)
- `equivalenceMorphismAxioms : AxiomSystem` (2 axioms)
- `mainIntegrationAxioms : AxiomSystem` (5 axioms)
- `classificationIntegrationAxioms : AxiomSystem` (5 axioms)
- `standardExamplesAxioms : AxiomSystem` (7 axioms)
- `counterexampleAxioms : AxiomSystem` (2 axioms)
- `complexIntegrationAxioms : AxiomSystem` (total)
- `complexIntegrationTotalAxioms : AxiomSystem` (total)
-/

#eval "API Reference: Core structures and axiom systems documented"
