/-
# MiniEntireHarmonic: Overview

Documentation overview of the mini-entire-harmonic package.
Covers the theory of entire and harmonic functions, package
structure, and key concepts.
-/

import MiniEntireHarmonic

/-! ## Package Overview

This package provides a formalization of the theory of entire functions
(holomorphic on the whole complex plane ℂ) and harmonic functions
(solutions to Laplace's equation Δu = 0).

### Key Concepts

1. **Entire Functions**: Functions holomorphic on all of ℂ. Examples:
   - Polynomials: finite order, finite number of zeros
   - e^z: order 1, type 1, no zeros
   - sin z: order 1, type 1, zeros at nπ
   - e^{e^z}: infinite order, no Hadamard factorization

2. **Order of Growth**: ρ = limsup_{r→∞} log log M(r) / log r
   - Measures how fast the function grows
   - Classification: ρ < ∞ (finite order), ρ = ∞ (infinite order)

3. **Weierstrass Factorization**: f(z) = z^m e^{g(z)} ∏ E_k(z/a_n)
   - Every entire function factors over its zeros
   - E_k(z) are primary factors for convergence

4. **Hadamard Factorization**: For finite order ρ,
   f(z) = z^m e^{P(z)} ∏ E_p(z/a_n) where deg(P) ≤ floor(ρ)

5. **Harmonic Functions**: u: ℂ → ℝ with Δu = 0
   - Real parts of holomorphic functions (on simply connected domains)
   - Mean value property: u(z₀) = average on circle
   - Maximum principle: maximum attained only on boundary

6. **Poisson Kernel**: P(r,θ) = (1-r²)/(1-2r cos θ + r²)
   - Solves the Dirichlet problem on the unit disc D
   - u(re^{iθ}) = 1/(2π)∫P(r,θ-t) u(e^{it}) dt

### Package Structure

- `Core/` — Basic definitions
- `Morphisms/` — Hom, Iso, Equiv
- `Constructions/` — Products, Quotients, Subobjects, Universal
- `Properties/` — Invariants, Preservation, ClassificationData
- `Theorems/` — Basic, Classification, Main, UniversalProperties
- `Examples/` — Standard, Counterexamples
- `Bridges/` — ToAlgebra, ToTopology, ToGeometry, ToComputation

### References

- Ahlfors, "Complex Analysis"
- Conway, "Functions of One Complex Variable"
- Levin, "Distribution of Zeros of Entire Functions"
- Rudin, "Real and Complex Analysis"
-/

#eval "── docs/overview.lean ──"
#eval "MiniEntireHarmonic: Entire & Harmonic Functions Package"
