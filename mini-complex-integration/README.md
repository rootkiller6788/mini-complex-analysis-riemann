# MiniComplexIntegration

Complex integration theory in Lean 4: contour integrals, Cauchy theory,
residue calculus, winding numbers, homology, and computational bridges.

## Structure

- **Core/** — Contours, contour integrals, winding numbers, residues
- **Morphisms/** — Integral-preserving maps, homology/homotopy equivalence
- **Constructions/** — Products, quotients, subobjects, universal covering
- **Properties/** — Invariants, preservation laws, classification data
- **Theorems/** — Cauchy-Goursat, Integral Formula, Residue Theorem, etc.
- **Examples/** — Standard examples and counterexamples
- **Bridges/** — Connections to algebra, topology, geometry, computation

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
