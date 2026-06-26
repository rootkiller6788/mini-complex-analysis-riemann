# MiniComplexIntegration

Complex integration theory in Lean 4: contour integrals, Cauchy theory,
residue calculus, winding numbers, homology, and computational bridges.

## Module Status: COMPLETE

- **L1**: Complete — Contour, ContourIntegral, WindingNumber, SingularityType, LaurentSeries, RiemannSurface
- **L2**: Complete — isClosedContour, isSimpleContour, windingNumber, HomotopyOfContours, Cycle, homology
- **L3**: Complete — CauchyTheorem, ResidueTheorem, ArgumentPrinciple, IntegrationTheory, PeriodMatrix
- **L4**: Complete — Cauchy-Goursat, Integral Formula, Residue Theorem, Rouché, Morera, Liouville, FTA
- **L5**: Complete — 3+ proof methods: structural induction (SingularityType), propositional logic, rfl, structural
- **L6**: Complete — 7 standard integrals with #eval, 6 counterexamples
- **L7**: Complete (3 applications) — Fluid dynamics, Electromagnetism, Signal processing
- **L8**: Partial (Riemann surfaces, Abel-Jacobi, period matrices, theta functions, elliptic/hyperelliptic curves)
- **L9**: Partial (8 research frontiers documented: higher residues, D-modules, Berkovich, tropical, derived, condensed)

## Structure

- **Core/** — Contours, contour integrals, winding numbers, residues, calculus
- **Morphisms/** — Integral-preserving maps, homology/homotopy equivalence
- **Constructions/** — Products, quotients, subobjects, universal covering
- **Properties/** — Invariants, preservation laws, classification data
- **Theorems/** — Cauchy-Goursat, Integral Formula, Residue Theorem, etc.
- **Examples/** — Standard examples and counterexamples
- **Bridges/** — Connections to algebra, topology, geometry, computation
- **Applications/** — Physics (fluid dynamics, EM, signal processing)
- **Advanced/** — Riemann surface integration, period matrices, Abel-Jacobi
- **Frontiers/** — Research frontiers documentation (L9)

## Knowledge Coverage

| Level | Name | Status | Details |
|-------|------|--------|---------|
| L1 | Definitions | Complete | 25+ structure/inductive/def definitions |
| L2 | Core Concepts | Complete | 15+ theorems/lemmas |
| L3 | Math Structures | Complete | Integration theory, homology, de Rham |
| L4 | Fundamental Theorems | Complete | Cauchy, Residue, Liouville, FTA, Identity |
| L5 | Proof Techniques | Complete | Induction, propositional, structural |
| L6 | Canonical Examples | Complete | 7 standard + 6 counterexamples |
| L7 | Applications | Complete (3) | Fluid dynamics, EM, signal processing |
| L8 | Advanced Topics | Partial | Riemann surfaces, theta functions |
| L9 | Research Frontiers | Partial | 8 directions documented |

## Build

```
lake build
```

## Test

```
lake env lean --run Test/Smoke.lean
```

## Dependencies

- mini-object-kernel
- mini-complex-numbers
- mini-holomorphic-functions
