/-
# MiniEntireHarmonic

The entire functions and harmonic functions sub-package — defines `EntireFunction`
(holomorphic on all ℂ), `HarmonicFunction` (Δu = 0), Poisson kernel,
Hadamard factorization, Weierstrass products, and the Dirichlet problem.

## Sub-packages
- `Core`          — EntireFunction, HarmonicFunction, order of growth, Poisson kernel
- `Morphisms`     — EntireFunctionMap, HadamardTransform, HarmonicMap
- `Constructions` — Hadamard products, Borel transform, quotients, subobjects, universal
- `Properties`    — Invariants (order, type, genus, Nevanlinna), Preservation, ClassificationData
- `Theorems`      — Weierstrass/Hadamard factorization, Jensen, Picard, Poisson, Harnack
- `Examples`      — e^z, sin z, cos πz, e^{e^z}, harmonic functions
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Core.Laws
import MiniEntireHarmonic.Core.Objects
import MiniEntireHarmonic.Morphisms.Hom
import MiniEntireHarmonic.Morphisms.Iso
import MiniEntireHarmonic.Morphisms.Equiv
import MiniEntireHarmonic.Constructions.Products
import MiniEntireHarmonic.Constructions.Quotients
import MiniEntireHarmonic.Constructions.Subobjects
import MiniEntireHarmonic.Constructions.Universal
import MiniEntireHarmonic.Properties.ClassificationData
import MiniEntireHarmonic.Properties.Invariants
import MiniEntireHarmonic.Properties.Preservation
import MiniEntireHarmonic.Theorems.Basic
import MiniEntireHarmonic.Theorems.Classification
import MiniEntireHarmonic.Theorems.Main
import MiniEntireHarmonic.Theorems.UniversalProperties
import MiniEntireHarmonic.Examples.Standard
import MiniEntireHarmonic.Examples.Counterexamples
import MiniEntireHarmonic.Bridges.ToAlgebra
import MiniEntireHarmonic.Bridges.ToTopology
import MiniEntireHarmonic.Bridges.ToGeometry
import MiniEntireHarmonic.Bridges.ToComputation
