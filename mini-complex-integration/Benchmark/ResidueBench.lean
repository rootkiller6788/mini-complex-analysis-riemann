/-
# Benchmark: ResidueBench — 13 targets

Residue theory, classification, residue computation,
and related theorems.
-/

import MiniComplexIntegration

/-!
## Residue Theory Benchmarks: 13 targets

[x] ResidueTheorem (structure, Core.Basic)                        | Core.Basic:82-85
[x] residueAt function                                             | Core.Basic:77-79
[x] residueTheoremFull (Theorems.Basic)                            | Theorems.Basic:37-40
[x] argumentPrincipleFull                                          | Theorems.Basic:42-45
[x] roucheTheoremFull                                              | Theorems.Basic:49-51
[x] partialFractionDecomposition                                   | Theorems.Classification:17-19
[x] mittagLefflerTheorem                                           | Theorems.Classification:23-25
[x] weierstrassFactorization                                       | Theorems.Classification:29-31
[x] casoratiWeierstrassFull                                        | Theorems.Classification:35-38
[x] greatPicardFull                                                | Theorems.Classification:42-44
[x] ResidueLinearFunctional (Bridges)                              | Bridges.ToAlgebra:14-18
[x] residueFromLaurentCoefficient                                  | Bridges.ToAlgebra:32-34
[x] ResidueComputation (Bridges.ToComputation)                     | Bridges.ToComputation:32-35
-/

#eval "ResidueBench: 13 residue theory targets, 13 done, 100%"
