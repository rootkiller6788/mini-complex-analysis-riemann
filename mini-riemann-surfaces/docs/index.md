# MiniRiemannSurfaces Documentation

Compact Riemann surfaces: complex manifolds of dimension 1, classified
by genus g = 0 (sphere), g = 1 (torus/elliptic), g >= 2 (hyperbolic).

## Architecture

```
MiniRiemannSurfaces/
  Core/          — RiemannSurface, Atlas, genus, χ, Divisors, MeromorphicDifferentials
  Morphisms/     — HolomorphicMap, BranchedCover, Biholomorphic, ModuliSpace M_g
  Constructions/ — Products, Quotients (Fuchsian), Subobjects, Universal covers
  Properties/    — Invariants (genus, period matrix, K_X), Preservation, Classification
  Theorems/      — Riemann-Roch, Abel, Jacobi Inversion, Hurwitz, Uniformization, GAGA
  Examples/      — Riemann sphere, complex tori, elliptic curves, hyperelliptic curves
  Bridges/       — ToAlgebra (function fields), ToTopology (π₁, Γ_g),
                    ToGeometry (hyperbolic metric), ToComputation (period matrices)
```

## Key Types

| Type | Description |
|------|-------------|
| `RiemannSurface` | 1-dim complex manifold with holomorphic atlas |
| `Chart` | Homeomorphism from open set to open subset of ℂ |
| `Atlas` | Collection of compatible charts |
| `HolomorphicMap` | Map between RS, holomorphic in local coordinates |
| `BranchedCover` | Holomorphic map with finite ramification |
| `Biholomorphic` | Invertible holomorphic map (isomorphism) |
| `Divisor` | Formal sum Σ n_i p_i of points |
| `MeromorphicDifferential` | Meromorphic 1-form ω = f(z) dz |
| `PeriodMatrix` | Ω ∈ H_g, symmetric with Im(Ω) > 0 |
| `JacobianVariety` | Jac(X) = ℂ^g / Λ_X, g-dimensional torus |

## Key Theorems

| Theorem | Statement |
|---------|-----------|
| Riemann-Roch | l(D) - l(K-D) = deg(D) - g + 1 |
| Abel | D = (f) iff deg(D)=0 and φ(D)=0 in Jac(X) |
| Jacobi Inversion | Sym^g X → Jac(X) is surjective |
| Riemann-Hurwitz | 2g_X-2 = n(2g_Y-2) + Σ(e_p-1) |
| Uniformization | Every simply connected RS ≅ ℂ̂, ℂ, or Δ |
| Riemann Existence | Every compact RS is algebraic |
| GAGA | Analytic ↔ algebraic for projective varieties |
| Torelli | RS determined by its Jacobian |
| Hurwitz | \|Aut(X)\| ≤ 84(g-1) for g ≥ 2 |

## Classification by Genus

| Genus | Universal Cover | Moduli Dimension | Example |
|-------|----------------|-----------------|---------|
| 0 | ℂ̂ | 0 | ℂ̂ (Riemann sphere) |
| 1 | ℂ | 1 | ℂ/Λ (elliptic curves) |
| ≥ 2 | Δ (unit disk) | 3g-3 | y² = P(x) (hyperelliptic) |
