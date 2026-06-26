/-
# MiniConformalMapping

Conformal mapping theory: Möbius transformations, Riemann mapping theorem,
uniformization, Schwarz lemma, and conformal invariants.

## Sub-packages
- `Core`         — Möbius transformations, cross-ratio, conformal maps, Aut(D), Aut(H)
- `Morphisms`    — ConformalMap, MöbiusMap, SchwarzChristoffelMap, Isomorphism, Equiv
- `Constructions` — Simply connected domains, annuli, quotients by Fuchsian groups, universal cover
- `Properties`   — Conformal modulus, extremal length, harmonic measure, Green's function
- `Theorems`     — Schwarz lemma, Riemann mapping, Carathéodory extension, Koebe theorems
- `Examples`     — Standard Möbius transforms, Cayley map, Joukowski map, counterexamples
- `Bridges`      — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Core.Objects
import MiniConformalMapping.Core.Laws
import MiniConformalMapping.Morphisms.Hom
import MiniConformalMapping.Morphisms.Iso
import MiniConformalMapping.Morphisms.Equiv
import MiniConformalMapping.Constructions.Subobjects
import MiniConformalMapping.Constructions.Quotients
import MiniConformalMapping.Constructions.Products
import MiniConformalMapping.Constructions.Universal
import MiniConformalMapping.Properties.Invariants
import MiniConformalMapping.Properties.Preservation
import MiniConformalMapping.Properties.ClassificationData
import MiniConformalMapping.Theorems.Basic
import MiniConformalMapping.Theorems.Classification
import MiniConformalMapping.Theorems.Main
import MiniConformalMapping.Theorems.UniversalProperties
import MiniConformalMapping.Examples.Standard
import MiniConformalMapping.Examples.Counterexamples
import MiniConformalMapping.Bridges.ToAlgebra
import MiniConformalMapping.Bridges.ToTopology
import MiniConformalMapping.Bridges.ToGeometry
import MiniConformalMapping.Bridges.ToComputation
