/-
# MiniComplexNumbers

The complex numbers sub-package — defines `ComplexNumbers` structure,
the field `ℂ`, and bridges to algebra, topology, geometry, and computation.

## Sub-packages
- `Core`          — ComplexNumbers structure, field axioms, Object instance
- `Morphisms`     — ComplexLinearMap, ComplexFieldIso, conformalEquivalence
- `Constructions` — Products, Quotients, Subobjects, Universal properties
- `Properties`    — Invariants, Preservation, ClassificationData
- `Theorems`      — Basic, Classification, Main, UniversalProperties
- `Examples`      — Standard, Counterexamples
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Core.Laws
import MiniComplexNumbers.Core.Objects
import MiniComplexNumbers.Core.GaussianIntegers
import MiniComplexNumbers.Morphisms.Hom
import MiniComplexNumbers.Morphisms.Iso
import MiniComplexNumbers.Morphisms.Equiv
import MiniComplexNumbers.Constructions.Products
import MiniComplexNumbers.Constructions.Quotients
import MiniComplexNumbers.Constructions.Subobjects
import MiniComplexNumbers.Constructions.Universal
import MiniComplexNumbers.Properties.ClassificationData
import MiniComplexNumbers.Properties.Invariants
import MiniComplexNumbers.Properties.Preservation
import MiniComplexNumbers.Theorems.Basic
import MiniComplexNumbers.Theorems.Classification
import MiniComplexNumbers.Theorems.Main
import MiniComplexNumbers.Theorems.UniversalProperties
import MiniComplexNumbers.Examples.Standard
import MiniComplexNumbers.Examples.Counterexamples
import MiniComplexNumbers.Bridges.ToAlgebra
import MiniComplexNumbers.Bridges.ToTopology
import MiniComplexNumbers.Bridges.ToGeometry
import MiniComplexNumbers.Bridges.ToComputation
import MiniComplexNumbers.Bridges.ToNumberTheory
import MiniComplexNumbers.Bridges.ToPhysics
