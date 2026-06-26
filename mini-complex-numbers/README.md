# MiniComplexNumbers

The complex numbers sub-package of mini-everything-math.

Defines `ComplexNumbers` structure with real/imaginary parts, arithmetic,
polar form, and bridges to algebra, topology, geometry, and computation.

## Structure

- `Core/` -- ComplexNumbers structure, field axioms, Object instance
- `Morphisms/` -- ComplexLinearMap, ComplexFieldIso, conformalEquivalence
- `Constructions/` -- Products, Quotients, Subobjects, Universal properties
- `Properties/` -- Invariants, Preservation, ClassificationData
- `Theorems/` -- FTA, Liouville, maximum modulus, classification
- `Examples/` -- Standard, Counterexamples
- `Bridges/` -- ToAlgebra, ToTopology, ToGeometry, ToComputation

## Dependencies

- `mini-object-kernel` -- Object typeclass interface

## Usage

```bash
lake build
lake env lean --run Main.lean
```
