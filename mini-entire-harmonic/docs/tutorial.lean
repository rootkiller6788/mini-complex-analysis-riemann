/-
# MiniEntireHarmonic: Tutorial

Step-by-step tutorial for using the mini-entire-harmonic package.
Covers basic definitions, working with entire functions, harmonic
functions, and solving the Dirichlet problem.
-/

import MiniEntireHarmonic
import MiniEntireHarmonic.Examples.Standard

open MiniEntireHarmonic

/-! ## Tutorial: Getting Started

### 1. Working with Entire Functions

The package defines `EntireFunction` as ℂ → ℂ. The standard examples
are already defined:

```lean
def f : EntireFunction := entireExpZ    -- e^z
def g : EntireFunction := entireSinZ    -- sin z
def h : EntireFunction := entireCosZ    -- cos z
```

### 2. Computing Values

```lean
#eval entireExpZ (ComplexNumbers.of 1.0 0.0)    -- e^1
#eval entireSinZ (ComplexNumbers.of 0.0 0.0)    -- 0
#eval entireCosZ (ComplexNumbers.of 0.0 0.0)    -- 1
```

### 3. Order of Growth

```lean
#eval orderOfGrowth 1.0 1.0    -- displays "order ρ = 1.0, type τ = 1.0"
#eval classifyByOrder entireExpZ
```

### 4. Poisson Kernel

```lean
#eval poissonKernel 0.5 0.0           -- P(0.5, 0) = (1-0.25)/(1-1+0.25) = 3
#eval poissonKernel 0.0 1.5707963     -- P(0, any) = 1
```

### 5. Harmonic Functions

```lean
def u (z : ComplexNumbers) : Float := z.re    -- Re(z) is harmonic
def v (z : ComplexNumbers) : Float := z.im    -- Im(z) is harmonic
```

### 6. Hadamard Factorization

```lean
#eval hadamardForm entireExpZ
#eval classificationByOrder entireExpZ
```

### 7. Solving Dirichlet Problem

The Dirichlet problem on the unit disc is solved via the Poisson integral:
```lean
def boundary (θ : Float) : Float := Float.cos θ
def solution (z : ComplexNumbers) : Float :=
  poissonIntegral boundary (modulus z) (argument z)
```

### 8. Key Theorems (available as axioms/sorry)

- Weierstrass factorization: every entire function factors over its zeros
- Hadamard factorization: finite order entire = z^m e^P ∏ canonical products
- Picard's little theorem: non-constant entire misses at most one value
- Jensen's formula: relates zero distribution to growth
- Poisson formula: harmonic on D = Poisson integral of boundary values
- Harnack inequality: bounds for positive harmonic functions

### 9. Next Steps

- Explore the `Bridges/` directory for connections to algebra, topology, geometry, computation
- Run the benchmarks in `Benchmark/`
- Try the computational examples in `Computation/python/`

#eval "── docs/tutorial.lean ──"
#eval "Tutorial for MiniEntireHarmonic"

-- Quick example session
#eval "── Tutorial: exp(1) ──"
#eval entireExpZ (ComplexNumbers.of 1.0 0.0)

#eval "── Tutorial: sin(π/2) ──"
#eval entireSinZ (ComplexNumbers.of 1.5707963267948966 0.0)

#eval "── Tutorial: P(0.3, π/4) ──"
#eval poissonKernel 0.3 0.7853981633974483

#eval "── Tutorial: Classification of exp ──"
#eval classificationByOrder entireExpZ
