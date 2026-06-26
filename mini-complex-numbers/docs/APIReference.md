# MiniComplexNumbers API Reference

## Namespace: `MiniComplexNumbers`

## Core

### `ComplexNumbers` structure
- `re : Float` -- real part
- `im : Float` -- imaginary part
- `ComplexNumbers.of (r i : Float) : ComplexNumbers`
- `ℂ` notation

### Constants
- `i : ComplexNumbers` -- imaginary unit (0,1)
- `zero : ComplexNumbers` -- (0,0)
- `one : ComplexNumbers` -- (1,0)

### Arithmetic
- `ComplexNumbers.add (z w : ComplexNumbers) : ComplexNumbers`
- `ComplexNumbers.mul (z w : ComplexNumbers) : ComplexNumbers`
- `ComplexNumbers.neg (z : ComplexNumbers) : ComplexNumbers`
- Instances: `Add`, `Mul`, `Neg`

### Complex Conjugate
- `complexConjugate (z : ComplexNumbers) : ComplexNumbers`

### Modulus and Argument
- `modulus (z : ComplexNumbers) : Float` -- `|z|` notation
- `argument (z : ComplexNumbers) : Float` -- principal value

### Polar Form
- `polarForm (r θ : Float) : ComplexNumbers`
- `cis (θ : Float) : ComplexNumbers` -- cos θ + i sin θ
- `deMoivre (θ : Float) (n : Nat) : ComplexNumbers`
- `nthRootsOfUnity (n : Nat) : List ComplexNumbers`

### Topology
- `complexDist (z w : ComplexNumbers) : Float`
- `OpenSet (U : ComplexNumbers → Prop) : Prop`
- `ClosedSet (C : ComplexNumbers → Prop) : Prop`
- `isConnected (U : ComplexNumbers → Prop) : Prop`
- `isSimplyConnected (U : ComplexNumbers → Prop) : Prop`

## Morphisms

### Hom
- `ComplexLinearMap` structure
- `ConjugateLinearMap` structure
- `isRealLinear (f : ComplexNumbers → ComplexNumbers) : Prop`
- `isComplexLinear (f : ComplexNumbers → ComplexNumbers) : Prop`
- `isConformal (f : ComplexNumbers → ComplexNumbers) (z₀ : ComplexNumbers) : Prop`

### Iso
- `ComplexFieldIso` structure
- `isBiholomorphic (f : ComplexNumbers → ComplexNumbers) : Prop`
- `identityAutomorphism : ComplexFieldIso`
- `conjugationAutomorphism : ComplexFieldIso`

### Equiv
- `ConformalEquivalence (U V : Set ComplexNumbers)`
- `BiholomorphicEquivalence (U V : Set ComplexNumbers)`
- `stereographicProject (z : ComplexNumbers) : Float × Float × Float`
- `stereographicInverse (x y z' : Float) : ComplexNumbers`

## Constructions

### Products
- `ComplexPair` structure
- Component-wise `add`, `mul`, `neg`, `scale`

### Quotients
- `projectToQuotientByReal (z : ComplexNumbers) : ComplexNumbers`
- `Lattice` structure, `standardLattice`
- `projectToQuotientByConjugate (z : ComplexNumbers) : ComplexNumbers`

### Subobjects
- `RealSubfield (r : Float) : ComplexNumbers`
- `isReal (z : ComplexNumbers) : Prop`
- `UpperHalfPlane : Set ComplexNumbers` (`ℍ` notation)
- `UnitDisc : Set ComplexNumbers`

### Universal
- `extensionBasis : List ComplexNumbers`
- `rootsOfX2plus1 : List ComplexNumbers`
- `splittingPolynomial (z : ComplexNumbers) : ComplexNumbers`
- `isSplittingField : Prop`

## Bridges

### ToAlgebra
- `GaloisGroupAction` inductive
- `galoisAction (g : GaloisGroupAction) (z : ComplexNumbers) : ComplexNumbers`
- `galoisFixedField : Set ComplexNumbers`

### ToTopology
- `ExtendedComplex` inductive (`ℂ̂` notation)
- `riemannSphereProjection (ez : ExtendedComplex) : Float × Float × Float`
- `chordalMetric (ez ew : ExtendedComplex) : Float`

### ToGeometry
- `euclideanDistance (z w : ComplexNumbers) : Float`
- `crossRatioGeom (z₁ z₂ z₃ z₄ : ComplexNumbers) : ComplexNumbers`
- `inversion (z : ComplexNumbers) (r : Float) : ComplexNumbers`
- `reflection (z : ComplexNumbers) : ComplexNumbers`

### ToComputation
- `principalSqrt (z : ComplexNumbers) : ComplexNumbers`
- `principalLog (z : ComplexNumbers) : ComplexNumbers`
- `Polynomial` structure
- `findRootsDurandKerner (p : Polynomial) (n : Nat) : List ComplexNumbers`
