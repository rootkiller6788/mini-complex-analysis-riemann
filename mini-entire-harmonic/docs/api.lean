/-
# MiniEntireHarmonic: API Reference

Complete API reference for the mini-entire-harmonic package.
Documents all public definitions, theorems, and structures.
-/

import MiniEntireHarmonic

/-! ## Core API

### Entire Functions
- `EntireFunction` : Type alias for ℂ → ℂ
- `isEntire f` : proposition that f is holomorphic on ℂ
- `orderOfGrowth_limsup f` : order ρ of entire function f
- `typeOfEntire f` : type τ of entire function f
- `genusOfEntire f` : genus of entire function f
- `maxModulus f r` : M(r,f) = max_{|z|=r} |f(z)|

### Weierstrass Products
- `primaryFactor z k` : E_k(z) = (1-z) exp(z + ... + z^k/k)
- `weierstrassCanonicalProduct zeros k` : ∏ E_k(z/a_n)
- `HadamardFactorization f` : representation as z^m e^{P(z)} ∏ E_k

### Harmonic Functions
- `isHarmonic u` : Δu = 0
- `HarmonicFunction` : subtype of harmonic functions
- `harmonicConjugate v u` : u+iv holomorphic
- `LaplaceOperator u z` : Δu(z)

### Poisson Kernel
- `poissonKernel r θ` : P(r,θ) = (1-r^2)/(1-2r cos θ + r^2)
- `poissonIntegral u r θ` : Poisson integral formula
- `dirichletProblemOnD boundaryValue` : Dirichlet solver via Poisson

## Morphisms API

### Hom
- `EntireFunctionMap` : structure preserving order
- `HadamardTransform` : Hadamard factorization data
- `HarmonicMap` : map between harmonic function domains

### Iso
- `BiholomorphicMap` : invertible conformal map
- `ConjugateHarmonicPair` : (u,v) with u+iv holomorphic
- `HarmonicIsomorphism` : isomorphism of harmonic structures

### Equiv
- `harmonicAsRealPartOfHolomorphic` : local equivalence
- `DirichletEquivalence` : equivalence via Dirichlet solvability

## Theorems API

- `weierstrassFactorizationTheorem` : f = z^m e^g ∏ E_k
- `hadamardFactorizationTheorem` : finite order case
- `jensenFormula` : relates zeros to growth
- `picardLittleTheorem` : entire misses at most 1 value
- `poissonFormula` : harmonic = Poisson integral
- `harnackInequalityTheorem` : positive harmonic bounds
- `harnackPrinciple` : monotone limits of harmonic functions

## Classification API

- `classificationByOrder f` : classify by growth order
- `hadamardClassification` : classify finite-order entire functions
- `lindelofPringsheim` : growth bound for finite type
- `borelTheorem` : order < 1 implies zero exponent = order

## Computation API (Bridges.ToComputation)

- `finiteDifferenceLaplacian u z h` : FD approximation of Δu
- `dirichletFDSolver` : finite difference Dirichlet solver
- `computeWeierstrassProduct` : numerical Weierstrass product
- `poissonIntegralNumerical` : numerical Poisson integral

#eval "── docs/api.lean ──"
#eval "API Reference for MiniEntireHarmonic"
