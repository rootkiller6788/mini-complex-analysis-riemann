/-
# MiniComplexIntegration — Overview Documentation

## What is MiniComplexIntegration?

This package provides the theory of complex contour integration in Lean 4.
It covers the fundamental theorems of complex analysis from Cauchy to residues,
with bridges to algebra, topology, geometry, and computation.

## Package Structure

### Core (`MiniComplexIntegration.Core`)
- **Basic**: Contours, contour integrals, winding numbers, residues
- **Laws**: Linearity, reversal, path additivity, ML inequality, Cauchy-Goursat, deformation invariance
- **Objects**: Object instances and integration theory objects

### Morphisms (`MiniComplexIntegration.Morphisms`)
- **Hom**: Integral-preserving maps, homotopy of contours, cycles, homology
- **Iso**: Homology equivalence, homotopic contours give same integral
- **Equiv**: Homology/homotopy equivalence, deformation equivalence

### Constructions (`MiniComplexIntegration.Constructions`)
- **Products**: Product contours, double integrals, Fubini theorem
- **Quotients**: Homology quotient, H₁ group, cycle space modulo boundaries
- **Subobjects**: Exact/closed differentials, simply connected domains, Poincaré lemma
- **Universal**: Universal covering, contour lifting, monodromy theorem

### Properties (`MiniComplexIntegration.Properties`)
- **Invariants**: Winding number, periods, intersection numbers
- **Preservation**: Deformation/homotopy/homology invariance
- **ClassificationData**: Period classification, abelian differentials, residue data

### Theorems (`MiniComplexIntegration.Theorems`)
- **Basic**: Cauchy-Goursat, integral formula, residue theorem, argument principle, Rouché, Morera
- **Main**: Cauchy derivative formula, holomorphic⇒analytic, Liouville, FTA
- **Classification**: Partial fractions, Mittag-Leffler, Weierstrass, Picard
- **UniversalProperties**: Cauchy kernel, resolvent formula, Bergman/Szego kernels

### Examples (`MiniComplexIntegration.Examples`)
- **Standard**: 7 classic contour integrals evaluated via residues
- **Counterexamples**: 6 counterexamples illustrating necessary conditions

### Bridges (`MiniComplexIntegration.Bridges`)
- **ToAlgebra**: Residue functional, Laurent series, algebraic de Rham
- **ToTopology**: Homology of domains, covering spaces, de Rham theorem
- **ToGeometry**: Periods on Riemann surfaces, Picard-Fuchs, Gauss-Manin
- **ToComputation**: Numerical integration, residue computation, adaptive quadrature

## Key Axiom Systems

- `integrationCoreAxioms`: 6 axioms (linearity, reversal, additivity, ML, Cauchy-Goursat, deformation)
- `cauchyTheoryIntegrationAxioms`: 3 axioms (Goursat, integral formula, derivative formula)
- `residueIntegrationAxioms`: 4 axioms (residue, argument, Rouché, Morera)
- `mainIntegrationAxioms`: 5 axioms (derivative, estimates, Liouville, FTA, identity)
- `classificationIntegrationAxioms`: 5 axioms (partial fractions, Mittag-Leffler, Weierstrass, Casorati, Picard)

## Usage

```lean
import MiniComplexIntegration
open MiniComplexIntegration

-- Standard contour integrals
#eval s!"∮ dz/z = 2πi"
#eval s!"∫ 1/(1+x²) dx = π"
```

## Dependencies

- `mini-object-kernel`: Core mathematical kernel
- `mini-complex-numbers`: Complex number theory
- `mini-holomorphic-functions`: Holomorphic function theory
-/

#eval "Overview: MiniComplexIntegration v0.1.0 — 92 targets, 100% coverage"
