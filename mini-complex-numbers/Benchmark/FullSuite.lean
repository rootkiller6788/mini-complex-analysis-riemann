/-
# Benchmark: Full Suite

Comprehensive benchmark covering all operations in the package.
Tracks every definition with implementation status.

Run: `lake env lean --run Benchmark/FullSuite.lean`
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ MINI-COMPLEX-NUMBERS FULL BENCHMARK SUITE ══"

/-!
## Coverage Report

### Core — 20 targets
-- [x] ComplexNumbers structure        | Core/Basic.lean
-- [x] i = (0,1)                       | Core/Basic.lean
-- [x] add/mul/neg instances           | Core/Basic.lean
-- [x] complexConjugate                 | Core/Basic.lean
-- [x] modulus |z|                      | Core/Basic.lean
-- [x] argument                         | Core/Basic.lean
-- [x] polarForm                        | Core/Basic.lean
-- [x] cis                              | Core/Basic.lean
-- [x] deMoivre                         | Core/Basic.lean
-- [x] nthRootsOfUnity                  | Core/Basic.lean
-- [x] complexDist                      | Core/Basic.lean
-- [x] OpenSet / ClosedSet              | Core/Basic.lean
-- [x] isConnected / isSimplyConnected  | Core/Basic.lean
-- [x] fieldAxioms                      | Core/Laws.lean
-- [x] conjugateProperties              | Core/Laws.lean
-- [x] modulusProperties                | Core/Laws.lean
-- [x] polarDecomposition               | Core/Laws.lean
-- [x] deMoivreTheorem                  | Core/Laws.lean
-- [x] FTA axiom                        | Core/Laws.lean
-- [x] Object instance                  | Core/Objects.lean

### Morphisms — 8 targets
-- [x] ComplexLinearMap                 | Morphisms/Hom.lean
-- [x] ConjugateLinearMap               | Morphisms/Hom.lean
-- [x] isRealLinear / isComplexLinear   | Morphisms/Hom.lean
-- [x] isConformal                      | Morphisms/Hom.lean
-- [x] ComplexFieldIso                  | Morphisms/Iso.lean
-- [x] identity/conjugation autom.       | Morphisms/Iso.lean
-- [x] ConformalEquivalence             | Morphisms/Equiv.lean
-- [x] stereographicProject             | Morphisms/Equiv.lean

### Constructions — 9 targets
-- [x] ComplexPair / product ops        | Constructions/Products.lean
-- [x] ℂ/ℝ quotient                     | Constructions/Quotients.lean
-- [x] Torus ℂ/Λ                        | Constructions/Quotients.lean
-- [x] ℝ subfield / UpperHalfPlane      | Constructions/Subobjects.lean
-- [x] UnitDisc / ℍ                     | Constructions/Subobjects.lean
-- [x] ℂ as degree-2 extension          | Constructions/Universal.lean
-- [x] Algebraic closure                | Constructions/Universal.lean
-- [x] Splitting field of x²+1          | Constructions/Universal.lean
-- [x] Universal property               | Constructions/Universal.lean

### Properties — 7 targets
-- [x] isAlgebraicallyClosed            | Properties/Invariants.lean
-- [x] characteristicZero / uncountable | Properties/Invariants.lean
-- [x] automorphismsPreserveModulus     | Properties/Preservation.lean
-- [x] conjugation preserves props      | Properties/Preservation.lean
-- [x] Möbius preserve cross-ratio      | Properties/Preservation.lean
-- [x] Subfield classification          | Properties/ClassificationData.lean
-- [x] realClosed subfields             | Properties/ClassificationData.lean

### Theorems — 8 targets
-- [~] FTA (stub)                       | Theorems/Basic.lean
-- [~] Liouville (sorry)                | Theorems/Basic.lean
-- [~] Maximum Modulus (trivial)        | Theorems/Basic.lean
-- [~] Open Mapping (sorry)             | Theorems/Basic.lean
-- [~] Identity Theorem (sorry)         | Theorems/Basic.lean
-- [~] Automorphism classification      | Theorems/Classification.lean
-- [x] ℂ complete / ≅ ℝ²               | Theorems/Main.lean
-- [~] Universal properties             | Theorems/UniversalProperties.lean

### Examples — 8 targets
-- [x] Roots of unity examples          | Examples/Standard.lean
-- [x] Polar form of 1+i                | Examples/Standard.lean
-- [x] Solving z²=2i                    | Examples/Standard.lean
-- [x] Modulus examples                 | Examples/Standard.lean
-- [x] Gaussian integers                | Examples/Standard.lean
-- [x] ℝ not algebraically closed        | Examples/Counterexamples.lean
-- [x] Punctured plane counterexample   | Examples/Counterexamples.lean
-- [x] ℝ-linear vs ℂ-linear             | Examples/Counterexamples.lean

### Bridges — 12 targets
-- [x] ℂ as alg. closed field           | Bridges/ToAlgebra.lean
-- [x] Gal(ℂ/ℝ) ≅ ℤ/2                   | Bridges/ToAlgebra.lean
-- [x] Riemann sphere ℂ̂                  | Bridges/ToTopology.lean
-- [x] Stereographic projection          | Bridges/ToTopology.lean
-- [x] Chordal metric                    | Bridges/ToTopology.lean
-- [x] ℂ as Euclidean model             | Bridges/ToGeometry.lean
-- [x] Cross-ratio                       | Bridges/ToGeometry.lean
-- [x] Inversion                         | Bridges/ToGeometry.lean
-- [x] Möbius transformations            | Bridges/ToGeometry.lean
-- [x] Complex floating point            | Bridges/ToComputation.lean
-- [x] Branch cuts / principal values    | Bridges/ToComputation.lean
-- [x] Numerical root finding            | Bridges/ToComputation.lean

## Summary
Total: 72 targets
Done: 64 (89%)
Stub/sorry: 8 (11%)
-/

#eval "── FullSuite: Quick verification ──"
#eval i * i
#eval |ComplexNumbers.of 3 4|
#eval nthRootsOfUnity 4
#eval complexConjugate (ComplexNumbers.of 1 1)

#eval "══ FULL SUITE BENCHMARK COMPLETE ══"
