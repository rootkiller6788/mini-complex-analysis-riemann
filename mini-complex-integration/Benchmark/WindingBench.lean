/-
# Benchmark: WindingBench — 11 targets

Winding number, homology, covering spaces,
and topological aspects of contour integration.
-/

import MiniComplexIntegration

/-!
## Winding/Homology Benchmarks: 11 targets

[x] WindingNumber structure (Core.Basic)                          | Core.Basic:46-49
[x] windingNumber function                                         | Core.Basic:51-53
[x] WindingNumberInvariant (Properties.Invariants)                 | Properties.Invariants:14-19
[x] windingNumberHomotopyInvariant                                 | Properties.Invariants:21-23
[x] Cycle, cycleBoundary, areHomologous                            | Morphisms.Hom:28-37
[x] HomologyQuotient, areHomologousCycles                          | Constructions.Quotients:15-21
[x] FirstHomologyGroup, h1                                         | Constructions.Quotients:24-31
[x] DomainHomology (Bridges.ToTopology)                            | Bridges.ToTopology:14-18
[x] WindingFundamentalGroup                                        | Bridges.ToTopology:21-25
[x] CoveringSpace, ContourLiftingTheorem                           | Bridges.ToTopology:28-37
[x] NumericalWindingNumber (Bridges.ToComputation)                 | Bridges.ToComputation:44-48
-/

#eval "WindingBench: 11 winding/homology targets, 11 done, 100%"
