# mini-holomorphic-functions

A Lean 4 Lake package providing the theory of holomorphic functions
in one complex variable.

## Overview

This package covers:
- **Complex differentiability** -- limit definition, Cauchy-Riemann equations
- **Holomorphic functions** -- entire functions, analyticity, power series expansions
- **Singularities** -- removable, poles, essential; classification theorems
- **Conformal maps** -- biholomorphisms, automorphisms, conformal equivalence
- **Key theorems** -- Liouville, identity theorem, open mapping, maximum modulus
- **Constructions** -- H(D), H^∞(D), A(D), Bergman space, modular forms
- **Bridges** -- connections to algebra, topology, geometry, computation

## Dependencies

- `mini-object-kernel` -- Object typeclass framework
- `mini-complex-numbers` -- Complex numbers

## Structure

```
MiniHolomorphicFunctions/
  Core/          -- Basic definitions, laws, objects
  Morphisms/     -- Hom, Iso, Equiv (biholomorphic, conformal)
  Constructions/ -- Subobjects, Quotients, Products, Universal
  Properties/    -- Invariants, Preservation, ClassificationData
  Theorems/      -- Basic, Classification, UniversalProperties, Main
  Examples/      -- Standard holomorphic functions, counterexamples
  Bridges/       -- ToAlgebra, ToTopology, ToGeometry, ToComputation
Test/            -- Smoke, Examples, Regression
Benchmark/       -- Core coverage, university exam benchmarks
Computation/     -- notebooks, python, sage
docs/            -- architecture, coverage, dependency
scripts/         -- check.ps1, check.sh
```

## Usage

```lean
import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

-- Check theory registration
#eval holomorphicTheory.segments
```
