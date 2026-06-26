# mini-conformal-mapping -- Architecture

## Overview

Conformal mapping theory: Mobius transformations, Riemann mapping theorem,
uniformization, Schwarz lemma, and conformal invariants.

## Dependency Graph

```
mini-conformal-mapping
├── mini-object-kernel (../../0. mini-math-kernel/mini-object-kernel)
├── mini-complex-numbers (../mini-complex-numbers)
└── mini-holomorphic-functions (../mini-holomorphic-functions)
```

## Module Map

```
MiniConformalMapping/
├── Core/
│   ├── Basic.lean              — MobiusTransformation, crossRatio, conformalMap, Aut(D), Aut(H), SchwarzLemma, RiemannMappingTheorem
│   ├── Objects.lean            — MoebiusGroup (PSL(2,C)), ConformalAutomorphismGroup, UnitDisc, UpperHalfPlane
│   └── Laws.lean               — Group laws, cross-ratio invariance, Schwarz inequality, uniqueness of Riemann map
├── Morphisms/
│   ├── Hom.lean                — ConformalMapType, MoebiusMap, SchwarzChristoffelMap, composition
│   ├── Iso.lean                — ConformalIsomorphism, Riemann mapping, Cayley isomorphism
│   └── Equiv.lean              — Conformal equivalence, classification by connectivity and genus
├── Constructions/
│   ├── Subobjects.lean         — SimplyConnectedDomain, MultiplyConnectedDomain, Annulus, conformalModulus
│   ├── Quotients.lean          — FuchsianGroup, QuotientRiemannSurface, DiscQuotient
│   ├── Products.lean           — ProductDomain, bidisc, polydisc, product of conformal maps
│   └── Universal.lean          — UniversalCover, UniformizationType, Koebe theorem
├── Properties/
│   ├── Invariants.lean         — conformalModulus, extremalLength, harmonicMeasure, greensFunction
│   ├── Preservation.lean       — Angle preservation, harmonic preservation, Dirichlet energy
│   └── ClassificationData.lean — PlanarDomainClass, KoebeQuarterTheorem, Distortion theorems
├── Theorems/
│   ├── Basic.lean              — Schwarz lemma, Schwarz-Pick, Riemann mapping, Carathéodory, Koebe theorems
│   ├── Classification.lean     — Planar domain classification, annulus classification, modulus rigidity
│   ├── Main.lean               — Riemann mapping summary, boundary behavior, Dirichlet problem
│   └── UniversalProperties.lean — Normalization, universal property of disc, Koebe uniformization
├── Examples/
│   ├── Standard.lean           — Möbius transforms, Cayley map, Joukowski map, exponential map, SC examples
│   └── Counterexamples.lean    — Liouville (C ≇ D), annulus ≇ disc, slit domain, boundary extension failure
└── Bridges/
    ├── ToAlgebra.lean          — PSL(2,C) as simple group, Möbius representation, CFT
    ├── ToTopology.lean         — Uniformization theorem, Koebe circle domain, Carathéodory kernel convergence
    ├── ToGeometry.lean         — Poincaré metric on D and H, conformal maps as isometries, Beltrami coefficient
    └── ToComputation.lean      — Schwarz-Christoffel numerics, zipper algorithm, circle packing
```
