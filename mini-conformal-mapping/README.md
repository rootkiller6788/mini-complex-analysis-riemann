# mini-conformal-mapping

Conformal mapping theory: Möbius transformations, Riemann mapping theorem, uniformization, Schwarz lemma, and conformal invariants.

## Modules

| Layer | Files | Description |
|-------|-------|-------------|
| Core | Basic, Objects, Laws | Möbius transformations, cross-ratio, conformal maps, Aut(D), Aut(H), Schwarz lemma, Riemann mapping |
| Morphisms | Hom, Iso, Equiv | ConformalMap, MöbiusMap, SchwarzChristoffelMap, conformal isomorphism, equivalence classes |
| Constructions | Subobjects, Quotients, Products, Universal | Simply connected domains, annuli, quotient Riemann surfaces, universal cover |
| Properties | Invariants, Preservation, ClassificationData | Conformal modulus, extremal length, harmonic measure, Green's function, Koebe theorems |
| Theorems | Basic, Classification, Main, UniversalProperties | Schwarz lemma, Riemann mapping, Carathéodory, Koebe, uniformization |
| Examples | Standard, Counterexamples | Möbius transforms, Cayley map, Joukowski map, exponential map, non-equivalent domains |
| Bridges | ToAlgebra, ToTopology, ToGeometry, ToComputation | PSL(2,ℂ), uniformization, hyperbolic metric, Schwarz-Christoffel numerics |

## Quick Start

```bash
cd mini-conformal-mapping
lake build
lake env lean --run Test/Smoke.lean
```
