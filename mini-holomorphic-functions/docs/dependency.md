# Dependencies

## Package Dependencies

### Direct
- `mini-object-kernel` -- Object typeclass and axiom registration framework
  - Path: `../../0. mini-math-kernel/mini-object-kernel`
  - Provides: `MiniObjectKernel.Core.Basic`, `TheoryName`, `Object`, `Axiom`, `AxiomSystem`, `Formula`, `Dependency`

- `mini-complex-numbers` -- Complex number definitions
  - Path: `../mini-complex-numbers`
  - Provides: `ComplexNumbers` (ℂ with add, mul, conj, modulus, exp, log, pow)

### Transitive
- `MiniMathKernel` (imported via both packages above)
  - Provides: `TheoryName`, `Object`, `Axiom`, `AxiomSystem`, `Formula`, `Dependency`

## Internal Dependency Chain

```
Core.Basic
    │
    ├── Core.Objects
    │       │
    │       └── Core.Laws
    │               │
    │               ├── Morphisms.Hom
    │               │       │
    │               │       └── Morphisms.Iso
    │               │               │
    │               │               └── Morphisms.Equiv
    │               │
    │               ├── Properties.Invariants
    │               │       │
    │               │       └── Properties.Preservation
    │               │               │
    │               │               └── Properties.ClassificationData
    │               │                       │
    │               │                       └── Theorems.Basic
    │               │                               │
    │               │                               ├── Theorems.UniversalProperties
    │               │                               │
    │               │                               └── Theorems.Classification
    │               │                                       │
    │               │                                       └── Theorems.Main
    │               │
    │               └── Constructions.Subobjects
    │                       │
    │                       ├── Constructions.Quotients
    │                       │
    │                       └── Constructions.Products
    │                               │
    │                               └── Constructions.Universal
    │
    └── Examples.Standard
            │
            └── Examples.Counterexamples
                    │
                    └── Bridges.ToAlgebra
                            │
                            └── Bridges.ToTopology
                                    │
                                    └── Bridges.ToGeometry
                                            │
                                            └── Bridges.ToComputation
```

## Notes

- The `Core` modules form the foundation and are imported by all other modules
- `Theorems` and `Examples` have separate dependency chains from `Core`
- `Bridges` import from `Theorems.Main` and `Examples` to ensure all content is available
- No circular dependencies exist in the import graph
