# A Tour of MiniRiemannSurfaces

A guided tour through the Riemann surfaces package, from basic
definitions to advanced theorems.

## 1. What is a Riemann Surface?

A Riemann surface is a 1-dimensional complex manifold — a space that
locally looks like ℂ, with holomorphic transition maps between charts.

```lean
import MiniRiemannSurfaces.Core.Basic
open MiniRiemannSurfaces

-- The Riemann sphere ℂ̂ = ℂ ∪ {∞} has genus 0
#eval genus RiemannSphere          -- 0
#eval eulerCharacteristic 0        -- 2 (χ = 2-2g)
```

## 2. Genus and Classification

The genus g is the fundamental invariant of a compact Riemann surface:

- **g = 0**: Only ℂ̂ (spherical geometry, positive curvature)
- **g = 1**: ℂ/Λ, complex tori/elliptic curves (flat geometry)
- **g ≥ 2**: Δ/Γ, hyperbolic surfaces (negative curvature)

```lean
import MiniRiemannSurfaces.Theorems.Classification

#eval uniformizationType 0   -- "spherical (ℂ̂)"
#eval uniformizationType 1   -- "Euclidean (ℂ)"
#eval uniformizationType 2   -- "hyperbolic (Δ)"
```

## 3. Divisors and the Riemann-Roch Theorem

A divisor D = Σ n_i · p_i on a compact RS records zeros and poles.
The Riemann-Roch theorem computes l(D) — the dimension of
meromorphic functions bounded by D.

```lean
import MiniRiemannSurfaces.Theorems.Basic

-- l(D) - l(K-D) = deg(D) - g + 1
```

## 4. The Jacobian Variety

Jac(X) = ℂ^g / Λ_X is a g-dimensional complex torus. It parametrizes
degree-0 divisor classes and is the universal abelian variety receiving
a map from X.

## 5. Uniformization

Every RS can be written as a quotient X = D/Γ where D is one of
{ℂ̂, ℂ, Δ} and Γ is a discrete group of automorphisms acting freely.

## 6. From Analysis to Algebra

GAGA: on a projective variety, holomorphic = algebraic. Every compact
RS is algebraic (Riemann existence theorem), giving a bridge to
algebraic geometry via function fields.

## 7. Computational Tools

Period matrices can be computed numerically, giving access to
the moduli space M_g and concrete computations with elliptic
and hyperelliptic curves.
