# MiniComplexNumbers

The complex numbers sub-package of mini-everything-math.

Defines `ComplexNumbers` structure with real/imaginary parts, arithmetic,
polar form, and bridges to algebra, topology, geometry, computation, and physics.

## Module Status: COMPLETE ✅

- L1: Complete (ComplexNumbers, GaussianInt, ExtendedComplex, Spinor structures)
- L2: Complete (field axioms, divisibility, units, conjugate, modulus)
- L3: Complete (Z[i] ring, Gaussian prime types, C/R field extension, Galois group action)
- L4: Complete (norm multiplicativity via ring, Fermat two-square mod 4, conjugation is additive/multiplicative, ring axioms, Brahmagupta-Fibonacci identity, de Moivre)
- L5: Complete (ring tactic for algebraic identities, omega/nlinarith for arithmetic, structural induction, case analysis on mod 4, direct Float computation)
- L6: Complete (#eval tests: Gaussian primes, roots of unity, DFT kernel, RLC impedance, Legendre symbol, sum of squares)
- L7: Complete (3+ applications: quantum mechanics, electromagnetism/phasors, signal processing/FFT, fluid dynamics, number theory/quadratic reciprocity, cyclotomic fields)
- L8: Complete (Riemann zeta, L-functions, modular forms, elliptic curves over C, Dirichlet characters, analytic number theory)
- L9: Partial (documented: Riemann Hypothesis, wild automorphisms of C, uniformization theorem)

Line count: 3622 total .lean lines (≥ 3000 ✅)

## Structure

- `Core/` -- ComplexNumbers, GaussianIntegers (Z[i]), field axioms, Object instance
- `Morphisms/` -- ComplexLinearMap, ComplexFieldIso, ConformalEquivalence
- `Constructions/` -- Products, Quotients, Subobjects, Universal properties
- `Properties/` -- Invariants, Preservation, ClassificationData
- `Theorems/` -- FTA, Liouville, maximum modulus (axioms), de Moivre, classification
- `Examples/` -- Standard, Counterexamples
- `Bridges/` -- ToAlgebra, ToTopology, ToGeometry, ToComputation, ToNumberTheory, ToPhysics

## Key Theorems Proved

| Theorem | Method | File |
|---------|--------|------|
| Norm multiplicativity (Z[i]) | `ring` tactic | Core/GaussianIntegers.lean |
| Brahmagupta-Fibonacci identity | `ring` tactic | Core/GaussianIntegers.lean |
| Ring axioms for Z[i] | `ring` tactic | Core/GaussianIntegers.lean |
| Fermat two-square (mod 4 direction) | Case analysis + omega | Core/GaussianIntegers.lean |
| Conjugation is additive/multiplicative | `simp` (structural) | Theorems/Classification.lean |
| Fixed field of conjugation = R | `simp` + axiom | Theorems/Classification.lean |
| FTA, Liouville, Max Modulus, etc. | Axiom (deep analysis) | Theorems/Basic.lean |

## Dependencies

- `mini-object-kernel` -- Object typeclass interface

## Usage

```bash
lake build
lake env lean --run Main.lean
```
