/-
# MiniSpecialFunctions

The special functions sub-package — defines complex exponential, trigonometric,
logarithmic, and power functions, Gamma function Γ(z), Riemann zeta ζ(s),
Weierstrass ℘(z;Λ), Jacobi theta, and modular forms.

## Sub-packages
- `Core`          — ComplexExponential, ComplexTrig, ComplexLogarithm, ComplexPower,
                    GammaFunction, RiemannZeta, WeierstrassP, JacobiTheta, ModularForms
- `Morphisms`     — FunctionalEquation morphisms, ModularTransformation, SL(2,Z) action
- `Constructions` — Hadamard products, quotient constructions, subobjects, universal properties
- `Properties`    — Invariants (period, weight, level, character), preservation, classification
- `Theorems`      — Euler reflection, Legendre duplication, zeta functional equation, classification
- `Examples`      — Standard special values, counterexamples
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniSpecialFunctions.Core.Basic
import MiniSpecialFunctions.Core.Laws
import MiniSpecialFunctions.Core.Objects
import MiniSpecialFunctions.Morphisms.Hom
import MiniSpecialFunctions.Morphisms.Iso
import MiniSpecialFunctions.Morphisms.Equiv
import MiniSpecialFunctions.Constructions.Products
import MiniSpecialFunctions.Constructions.Quotients
import MiniSpecialFunctions.Constructions.Subobjects
import MiniSpecialFunctions.Constructions.Universal
import MiniSpecialFunctions.Properties.Invariants
import MiniSpecialFunctions.Properties.Preservation
import MiniSpecialFunctions.Properties.ClassificationData
import MiniSpecialFunctions.Theorems.Basic
import MiniSpecialFunctions.Theorems.Classification
import MiniSpecialFunctions.Theorems.Main
import MiniSpecialFunctions.Theorems.UniversalProperties
import MiniSpecialFunctions.Examples.Standard
import MiniSpecialFunctions.Examples.Counterexamples
import MiniSpecialFunctions.Bridges.ToAlgebra
import MiniSpecialFunctions.Bridges.ToTopology
import MiniSpecialFunctions.Bridges.ToGeometry
import MiniSpecialFunctions.Bridges.ToComputation
