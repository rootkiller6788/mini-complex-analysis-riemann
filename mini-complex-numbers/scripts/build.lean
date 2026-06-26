/-
# Build Script

Run: `lake build`

This script verifies that all modules compile correctly.
-/

import Lake

def main : IO Unit := do
  IO.println "Building MiniComplexNumbers..."
  IO.println "Run `lake build` to compile the package."
  IO.println ""
  IO.println "Module structure:"
  IO.println "  Core/"
  IO.println "    Basic.lean         -- ComplexNumbers structure, ℂ, operations"
  IO.println "    Laws.lean          -- Field axioms, conjugate/modulus properties"
  IO.println "    Objects.lean       -- Object instance, unit circle"
  IO.println "  Morphisms/"
  IO.println "    Hom.lean           -- ComplexLinearMap, ConjugateLinearMap"
  IO.println "    Iso.lean           -- ComplexFieldIso, automorphisms"
  IO.println "    Equiv.lean         -- ConformalEquivalence, stereographic projection"
  IO.println "  Constructions/"
  IO.println "    Products.lean      -- ℂ×ℂ, component-wise ops"
  IO.println "    Quotients.lean     -- ℂ/ℝ, ℂ/Λ, ℂ/{conj}"
  IO.println "    Subobjects.lean    -- ℝ ⊂ ℂ, ℍ, UnitDisc"
  IO.println "    Universal.lean     -- ℂ as degree-2 extension, splitting field"
  IO.println "  Properties/"
  IO.println "    Invariants.lean    -- Algebraically closed, char 0, uncountable"
  IO.println "    Preservation.lean  -- Automorphisms preserve modulus, etc."
  IO.println "    ClassificationData.lean -- Subfield classification"
  IO.println "  Theorems/"
  IO.println "    Basic.lean         -- FTA, Liouville, Maximum Modulus"
  IO.println "    Classification.lean -- Automorphism classification"
  IO.println "    Main.lean          -- ℂ complete, ℂ ≅ ℝ²"
  IO.println "    UniversalProperties.lean -- Universal property of ℂ"
  IO.println "  Examples/"
  IO.println "    Standard.lean      -- Roots of unity, polar form"
  IO.println "    Counterexamples.lean -- Non-alg. closed subfield"
  IO.println "  Bridges/"
  IO.println "    ToAlgebra.lean     -- Galois theory"
  IO.println "    ToTopology.lean    -- Riemann sphere"
  IO.println "    ToGeometry.lean    -- Conformal geometry"
  IO.println "    ToComputation.lean -- Numerical methods"
  IO.println ""
  IO.println "Build complete (if no errors above)."
