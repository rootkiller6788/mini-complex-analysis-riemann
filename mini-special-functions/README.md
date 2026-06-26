# MiniSpecialFunctions

The special functions sub-package of mini-everything-math.

Defines complex exponential, trigonometric, logarithmic, power functions,
Gamma function, Riemann zeta function, Weierstrass elliptic functions,
Jacobi theta functions, and modular forms. Includes functional equations,
product formulas, and bridges to algebra, topology, geometry, and computation.

## Structure

- `Core/` -- ComplexExponential, ComplexTrig, ComplexLogarithm, ComplexPower, GammaFunction, RiemannZeta, WeierstrassP, JacobiTheta, ModularForms
- `Morphisms/` -- FunctionalEquation morphisms, ModularTransformation, SL(2,Z) action
- `Constructions/` -- Hadamard products, theta products, quotient constructions, subobject hierarchy, universal properties
- `Properties/` -- Invariants (period, weight, level, character), preservation laws, classification data
- `Theorems/` -- Euler reflection, Legendre duplication, zeta functional equation, classification of elliptic functions, modular forms ring
- `Examples/` -- Standard values, special evaluations, counterexamples
- `Bridges/` -- ToAlgebra (modular forms ring, Hecke algebra), ToTopology (fundamental domain, modular curve), ToGeometry (elliptic curves), ToComputation (Stirling, AGM)

## Dependencies

- `mini-object-kernel` -- Object typeclass interface
- `mini-complex-numbers` -- Complex numbers structure
- `mini-holomorphic-functions` -- Holomorphic function theory
- `mini-complex-integration` -- Complex integration theory

## Usage

```bash
lake build
lake env lean --run Main.lean
```
