# MiniComplexNumbers Overview

## Purpose

The `mini-complex-numbers` package provides a comprehensive Lean 4 formalization
of complex numbers, including algebraic structure, topological properties,
analytic theorems, and bridges to other mathematical domains.

## Architecture

The package follows the standard `mini-everything-math` architecture:

```
mini-complex-numbers/
├── MiniComplexNumbers/     # Source code (flat namespace)
│   ├── Core/               # Basic definitions, laws, Object instance
│   ├── Morphisms/          # Linear maps, isomorphisms, equivalences
│   ├── Constructions/      # Products, quotients, subobjects, universal properties
│   ├── Properties/         # Invariants, preservation, classification data
│   ├── Theorems/           # Fundamental theorems (FTA, Liouville, etc.)
│   ├── Examples/           # Standard examples and counterexamples
│   └── Bridges/            # Connections to algebra, topology, geometry, computation
├── Test/                   # Test files
├── Benchmark/              # Performance benchmarks
├── Computation/            # Algorithms, decision procedures, evaluations
├── docs/                   # Documentation
└── scripts/                # Build and maintenance scripts
```

## Key Features

1. **Complex number structure**: `ComplexNumbers` with `re` and `im` parts
2. **Field operations**: addition, multiplication, negation with typeclass instances
3. **Polar representation**: modulus, argument, polar form, cis
4. **De Moivre's theorem** and roots of unity
5. **Metric space**: complex distance, open/closed sets, connectivity
6. **Morphisms**: complex-linear maps, conformal maps, biholomorphic equivalence
7. **Stereographic projection**: ℂ ≅ S²\{∞}
8. **Riemann sphere**: extended complex plane ℂ̂
9. **Theorems**: FTA, Liouville, maximum modulus, open mapping, identity (stubs)
10. **Bridges**: Galois theory, Möbius transformations, numerical computation

## Dependencies

- `mini-object-kernel` -- Object typeclass interface

## Usage

```bash
cd "mini-complex-numbers"
lake build
lake env lean --run Main.lean
lake env lean --run Test/Basic.lean
```

## Implementation Status

- Core definitions: complete (Float-based model)
- Morphisms: complete (structure definitions, stubs for proofs)
- Theorems: stated, proofs are `sorry` (deep analytic results)
- Bridges: complete for topology/algebra/geometry/computation connections
