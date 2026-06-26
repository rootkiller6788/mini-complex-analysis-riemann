/-
# MiniRiemannSurfaces

Riemann surfaces: compact 1-dimensional complex manifolds, genus,
divisors, meromorphic differentials, holomorphic maps between surfaces,
branched covers, uniformization, Riemann-Roch theorem,
Abel-Jacobi theory, and classification by genus.

This is a sub-package of the mini-complex-analysis-riemann collection
in the mini-everything-math ecosystem.

## Sub-packages
- `Core`         — RiemannSurface, Atlas, genus, Euler characteristic, divisors, differentials
- `Morphisms`    — HolomorphicMap, BranchedCover, ramification, Biholomorphic equivalence
- `Constructions` — Products, quotients (by Fuchsian groups), subobjects, universal covers
- `Properties`   — Invariants (genus, period matrix), preservation, classification data
- `Theorems`     — Riemann-Roch, Abel, Jacobi Inversion, Hurwitz formula, Uniformization
- `Examples`     — Riemann sphere, complex tori, hyperelliptic curves
- `Bridges`      — ToAlgebra (function fields), ToTopology (π₁, Teichmueller),
                    ToGeometry (hyperbolic metric), ToComputation (period matrices)
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Core.Objects
import MiniRiemannSurfaces.Core.Laws
import MiniRiemannSurfaces.Core.Invariants
import MiniRiemannSurfaces.Morphisms.Hom
import MiniRiemannSurfaces.Morphisms.Iso
import MiniRiemannSurfaces.Morphisms.Equiv
import MiniRiemannSurfaces.Constructions.Products
import MiniRiemannSurfaces.Constructions.Quotients
import MiniRiemannSurfaces.Constructions.Subobjects
import MiniRiemannSurfaces.Constructions.Universal
import MiniRiemannSurfaces.Properties.Invariants
import MiniRiemannSurfaces.Properties.Preservation
import MiniRiemannSurfaces.Properties.ClassificationData
import MiniRiemannSurfaces.Theorems.Basic
import MiniRiemannSurfaces.Theorems.DivisorTheory
import MiniRiemannSurfaces.Theorems.UniversalProperties
import MiniRiemannSurfaces.Theorems.Classification
import MiniRiemannSurfaces.Theorems.Main
import MiniRiemannSurfaces.Examples.Standard
import MiniRiemannSurfaces.Examples.Counterexamples
import MiniRiemannSurfaces.Examples.Computations
import MiniRiemannSurfaces.Bridges.ToAlgebra
import MiniRiemannSurfaces.Bridges.ToTopology
import MiniRiemannSurfaces.Bridges.ToGeometry
import MiniRiemannSurfaces.Bridges.ToComputation
