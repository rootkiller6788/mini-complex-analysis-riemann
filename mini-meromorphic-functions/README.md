# Mini Meromorphic Functions

A Lean 4 Lake package providing formalized definitions and theorems
for meromorphic functions, built on the MiniMathKernel framework.

## Overview

This library develops the theory of meromorphic functions -- functions
that are holomorphic except at isolated poles. It covers:

- Laurent series expansions and the calculus of residues
- The Argument Principle: relating zeros, poles, and winding numbers
- Rouche's Theorem: perturbation stability of zero counts
- Mittag-Leffler Theorem: constructing meromorphic functions with
  prescribed principal parts
- Weierstrass Factorization Theorem: constructing entire functions
  with prescribed zeros
- Classification: meromorphic functions on the Riemann sphere are
  precisely rational functions
- Connections to algebraic geometry: divisors, Riemann-Roch, and
  function fields

## Dependencies

- `mini-object-kernel` — MiniMathKernel foundation
- `mini-complex-numbers` — Complex numbers
- `mini-holomorphic-functions` — Holomorphic functions
- `mini-complex-integration` — Contour integration

## Building

```bash
lake build
```

## Running Examples

```bash
lake exe meromorphic-examples
```

## Package Structure

| Directory | Contents |
|-----------|----------|
| `Core/` | Basic definitions: meromorphic functions, poles, zeros, residues |
| `Morphisms/` | Meromorphic maps, divisors, bimeromorphic equivalence |
| `Constructions/` | Products, quotients, subobjects, universal properties |
| `Properties/` | Invariants, preservation, classification data |
| `Theorems/` | Main theorems: argument principle, Rouché, Mittag-Leffler, etc. |
| `Examples/` | Standard examples and counterexamples |
| `Bridges/` | Connections to algebra, topology, geometry, computation |
| `test/` | Unit tests |
| `benchmark/` | Performance benchmarks |
| `computation/` | Numerical computation utilities |
| `docs/` | Extended documentation |
| `scripts/` | Build and utility scripts |
