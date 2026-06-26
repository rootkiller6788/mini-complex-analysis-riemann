/-!
  # MiniMeromorphicFunctions

  A mini-library for meromorphic functions in Lean 4, built on the
  MiniMathKernel framework. Covers:
  - Meromorphic functions: holomorphic except at isolated poles
  - Laurent series expansions and residues
  - The Argument Principle and Rouché's Theorem
  - Mittag-Leffler and Weierstrass factorization theorems
  - Classification of meromorphic functions on the Riemann sphere
  - Connections to algebra, topology, geometry, and computation

  ## Module Structure
  - `Core/`: Basic definitions (meromorphic functions, poles, zeros, residues)
  - `Morphisms/`: Maps between Riemann spheres, divisors
  - `Constructions/`: Products, quotients, subobjects, universal properties
  - `Properties/`: Invariants, preservation, classification data
  - `Theorems/`: Main theorems and classifications
  - `Examples/`: Standard examples and counterexamples
  - `Bridges/`: Connections to algebra, topology, geometry, and computation
-/

import MiniMeromorphicFunctions.Core.Basic
import MiniMeromorphicFunctions.Core.Laws
import MiniMeromorphicFunctions.Core.Objects
import MiniMeromorphicFunctions.Morphisms.Hom
import MiniMeromorphicFunctions.Morphisms.Iso
import MiniMeromorphicFunctions.Morphisms.Equiv
import MiniMeromorphicFunctions.Constructions.Products
import MiniMeromorphicFunctions.Constructions.Quotients
import MiniMeromorphicFunctions.Constructions.Subobjects
import MiniMeromorphicFunctions.Constructions.Universal
import MiniMeromorphicFunctions.Properties.Invariants
import MiniMeromorphicFunctions.Properties.Preservation
import MiniMeromorphicFunctions.Properties.ClassificationData
import MiniMeromorphicFunctions.Theorems.Basic
import MiniMeromorphicFunctions.Theorems.Classification
import MiniMeromorphicFunctions.Theorems.Main
import MiniMeromorphicFunctions.Theorems.UniversalProperties
import MiniMeromorphicFunctions.Examples.Standard
import MiniMeromorphicFunctions.Examples.Counterexamples
import MiniMeromorphicFunctions.Bridges.ToAlgebra
import MiniMeromorphicFunctions.Bridges.ToTopology
import MiniMeromorphicFunctions.Bridges.ToGeometry
import MiniMeromorphicFunctions.Bridges.ToComputation
