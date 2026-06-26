# Architecture

## Package Structure

```
mini-holomorphic-functions/
  MiniHolomorphicFunctions/
    Core/          -- Basic, Laws, Objects
    Morphisms/     -- Hom, Iso, Equiv
    Constructions/ -- Subobjects, Quotients, Products, Universal
    Properties/    -- Invariants, Preservation, ClassificationData
    Theorems/      -- Basic, Classification, UniversalProperties, Main
    Examples/      -- Standard, Counterexamples
    Bridges/       -- ToAlgebra, ToTopology, ToGeometry, ToComputation
  Test/            -- Smoke, Examples, Regression
  Benchmark/       -- CoreCoverage, Princeton, Cambridge, Harvard, MIT, Oxford
  Computation/     -- notebooks, python, sage
  docs/            -- architecture, coverage, dependency
  scripts/         -- check.ps1, check.sh
```

## Dependency Graph

```
Core.Basic ──► Core.Objects ──► Core.Laws
                                    │
                                    ▼
              Morphisms.Hom ──► Morphisms.Iso ──► Morphisms.Equiv
                                    │
                                    ▼
Constructions.Subobjects ──► Constructions.Quotients ──► Constructions.Products ──► Constructions.Universal
                                    │
                                    ▼
Properties.Invariants ──► Properties.Preservation ──► Properties.ClassificationData
                                    │
                                    ▼
Theorems.Basic ──► Theorems.UniversalProperties ──► Theorems.Classification ──► Theorems.Main
                                    │
                                    ▼
Examples.Standard ──► Examples.Counterexamples
                                    │
                                    ▼
Bridges.ToAlgebra ──► Bridges.ToTopology ──► Bridges.ToGeometry ──► Bridges.ToComputation
```

## Design Principles

1. **Core first**: All definitions in Core; everything else imports upward
2. **Axiom system**: Theorems declared as `Axiom` values for registration
3. **sorry proofs**: Deep analysis proofs use `sorry` placeholders
4. **#eval in every file**: Every `.lean` file has at least one `#eval`
5. **Namespace**: All code under `MiniHolomorphicFunctions`
