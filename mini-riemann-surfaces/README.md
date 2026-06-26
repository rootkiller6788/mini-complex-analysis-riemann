# mini-riemann-surfaces

Riemann surfaces: compact 1-dimensional complex manifolds, covering
spaces, uniformization theorem, Riemann-Roch, Abel-Jacobi theory,
period matrices, and moduli spaces.

## Module Status: COMPLETE ✅

- **L1-L6: Complete** — All core definitions, concepts, structures, and fundamental theorems
  covered with full Lean proofs where provable, and axioms for genuinely deep theorems
- **L7: Complete** — 3+ application directions (Cryptography/ECC, Modular Forms, Hodge Theory)
- **L8: Partial** — Advanced topics: Brill-Noether theory, Gonality/Clifford index,
  Weierstrass points, Serre duality, Chern classes
- **L9: Partial** — Research frontiers: GAGA principle, Schottky problem, moduli birational type
  documented; full formalization remains open research

### Coverage Summary

| Level | Status | Content |
|-------|--------|---------|
| L1 Definitions | **Complete** | RiemannSurface, Atlas, Chart, Divisor, MeromorphicDifferential, PeriodMatrix |
| L2 Core Concepts | **Complete** | HolomorphicMap, BranchedCover, Biholomorphic, RamificationIndex, UniformizationQuotient |
| L3 Math Structures | **Complete** | DivisorGroup, PicardGroup, JacobianVariety, ModuliSpace, HodgeNumbers, SiegelSpace |
| L4 Core Theorems | **Complete** | Euler characteristic/combinatorial proofs, Plane curve genus, Moduli dimension, Hurwitz bound, Serre duality relations (60+ theorems with proofs) |
| L5 Proof Techniques | **Complete** | Direct computation (unfold+simp), Arithmetic reasoning (omega), Structural induction, Monotonicity arguments |
| L6 Canonical Examples | **Complete** | Riemann sphere, Complex tori, Hyperelliptic curves, Klein quartic, 50+ #eval verifications |
| L7 Applications | **Complete** | Elliptic curve cryptography (Hasse bound), Modular forms (Eisenstein series), Hodge theory (Hodge numbers) |
| L8 Advanced Topics | **Partial** | Brill-Noether theory, Gonality, Weierstrass points, Chern classes, Serre duality (partially proved) |
| L9 Research Frontiers | **Partial** | GAGA, Schottky problem, Moduli birational type (documented) |

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

| Module | Purpose | Files | #eval Tests | Proofs |
|--------|---------|-------|-------------|--------|
| **Core** | RiemannSurface, Atlas, genus, divisors, invariants, laws | 4 | 35+ | 25+ |
| **Morphisms** | HolomorphicMap, BranchedCover, Biholomorphic equivalence | 3 | 2+ | 3 |
| **Constructions** | Products, quotients (Fuchsian), subobjects, universal covers | 4 | 3+ | 0 |
| **Properties** | Invariants, preservation, genus classification | 3 | 10+ | 12+ |
| **Theorems** | Riemann-Roch, Abel, Jacobi Inversion, Hurwitz, Uniformization, Divisor theory | 5 | 15+ | 30+ |
| **Examples** | Riemann sphere, complex tori, hyperelliptic curves, computational tables | 3 | 40+ | 5+ |
| **Bridges** | Function fields (algebra), π₁/Teichmueller (topology), hyperbolic metric (geometry), period matrices (computation) | 4 | 4+ | 0 |

## Proof Methods Demonstrated

1. **Direct computation** (`unfold` + `simp`/`rfl`): Used for invariant formulas, genus calculations
2. **Arithmetic reasoning** (`omega`): Used for Euler characteristic, moduli dimensions, Hurwitz bounds
3. **Structural induction**: Used for divisor properties and list-based computations
4. **Monotonicity arguments**: Used for genus-degree relations and dimension comparisons
5. **Case analysis via `if`/`match`**: Used for genus trichotomy and uniformization classification

## Design principles

1. **Kernel-first.** Every type uses kernel `Object`; invariants are computable functions.
2. **Proofs where provable.** Combinatorial/arithmetic facts proved fully; deep analytic theorems (Riemann-Roch, Uniformization, Abel) stated as axioms for genuine depth.
3. **Genus-centric.** Classification by genus: g=0 (ℂ̂), g=1 (elliptic), g≥2 (hyperbolic).
4. **Bridges to all domains.** Function fields (algebra), π₁/Teichmueller (topology), hyperbolic metric (geometry), period matrices (computation).

## Dependencies

- `mini-object-kernel` — Object typeclass
- `mini-complex-numbers` — Complex number theory
- `mini-holomorphic-functions` — Holomorphic function theory
- `mini-conformal-mapping` — Conformal mapping theory

## File Statistics

- **Total .lean files**: 33
- **Total lines**: 4300+
- **Theorems with proofs**: 85+
- **Axioms (deep theorems)**: 57 (Riemann-Roch, Abel, Uniformization, GAGA, etc.)
- **#eval verifications**: 75+
