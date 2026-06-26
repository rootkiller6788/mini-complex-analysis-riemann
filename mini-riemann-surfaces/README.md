# mini-riemann-surfaces

Riemann surfaces: compact 1-dimensional complex manifolds, covering
spaces, uniformization theorem, Riemann-Roch, Abel-Jacobi theory,
period matrices, and moduli spaces.

## Quick Start

```bash
cd "7. mini-complex-analysis-riemann/mini-riemann-surfaces"

# Run the smoke tests
lake env lean --run Test/Smoke.lean

# Run step-by-step examples
lake env lean --run Test/Examples.lean

# Run regression checks
lake env lean --run Test/Regression.lean

# Run benchmarks
lake env lean --run Benchmark/FullSuite.lean
```

## What it provides

| Module | Purpose | Files | #eval Tests |
|--------|---------|-------|-------------|
| **Core** | RiemannSurface, Atlas, genus, divisors, meromorphic differentials | 3 | 3+ |
| **Morphisms** | HolomorphicMap, BranchedCover, ramification, Biholomorphic | 3 | 2+ |
| **Constructions** | Products, quotients (Fuchsian groups), subobjects, universal covers | 4 | 3+ |
| **Properties** | Invariants (genus, period matrix, canonical bundle), classification | 3 | 2+ |
| **Theorems** | Riemann-Roch, Abel, Jacobi Inversion, Hurwitz, Uniformization | 4 | 4+ |
| **Examples** | Riemann sphere, complex tori, hyperelliptic curves | 2 | 6+ |
| **Bridges** | Function fields, fundamental group, hyperbolic metric, computation | 4 | 4+ |

## Design principles

1. **Kernel-first.** Every type uses kernel `Object`; laws use `AxiomSystem`.
2. **Vocabulary, not proofs.** Deep theorems (Riemann-Roch, Uniformization, Abel) stated as axioms with `sorry`.
3. **Genus-centric.** Classification by genus: g=0 (ℂ̂), g=1 (elliptic), g≥2 (hyperbolic).
4. **Bridges to all domains.** Function fields (algebra), π₁/Teichmueller (topology), hyperbolic metric (geometry), period matrices (computation).

## Dependencies

- `mini-object-kernel` — Object typeclass, AxiomSystem
- `mini-complex-numbers` — Complex number theory
- `mini-holomorphic-functions` — Holomorphic function theory
- `mini-conformal-mapping` — Conformal mapping theory
