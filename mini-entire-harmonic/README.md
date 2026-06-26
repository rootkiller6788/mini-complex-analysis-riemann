# MiniEntireHarmonic

Entire Functions and Harmonic Functions package in the mini-everything-math ecosystem.

## Overview

This package provides the theory of entire functions (holomorphic on the whole complex plane)
and harmonic functions (solutions to Laplace's equation Δu = 0), following the classic
treatments of Weierstrass, Hadamard, and Poisson.

## Key Features

- **Entire Functions**: Definition, order of growth, type, genus
- **Weierstrass Factorization**: Canonical products with prescribed zeros
- **Hadamard Factorization**: Finite-order entire functions as z^m e^{P(z)} ∏ canonical products
- **Harmonic Functions**: Laplace equation, harmonic conjugates, Poisson kernel
- **Dirichlet Problem**: Solvability on the unit disc via Poisson integral
- **Classical Theorems**: Picard's little theorem, Jensen's formula, Harnack inequality

## Structure

- `MiniEntireHarmonic/Core/` — Basic definitions and structures
- `MiniEntireHarmonic/Morphisms/` — Morphisms between entire and harmonic objects
- `MiniEntireHarmonic/Constructions/` — Products, quotients, subobjects, universal constructions
- `MiniEntireHarmonic/Properties/` — Invariants, preservation theorems, classification data
- `MiniEntireHarmonic/Theorems/` — Main theorems with axiomatized deep proofs
- `MiniEntireHarmonic/Examples/` — Standard examples and counterexamples
- `MiniEntireHarmonic/Bridges/` — Connections to algebra, topology, geometry, computation

## Dependencies

- `mini-object-kernel` — Object typeclass framework
- `mini-complex-numbers` — Complex numbers ℂ
- `mini-holomorphic-functions` — Holomorphic function theory
- `mini-complex-integration` — Complex contour integration
