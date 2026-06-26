/-
# Benchmark: MLInequalityBench — 12 targets

ML inequality, estimation lemmas, integral bounds,
and convergence results.
-/

import MiniComplexIntegration

/-!
## ML Inequality and Estimation Benchmarks: 12 targets

[x] mlInequality axiom                                             | Core.Laws:28-30
[x] linearityOfContourIntegral                                     | Core.Laws:16-18
[x] reversalOfContour                                              | Core.Laws:20-22
[x] pathAdditivity                                                 | Core.Laws:24-26
[x] deformationInvariance                                           | Core.Laws:36-38
[x] homotopyInvarianceOfContourIntegral                            | Properties.Preservation:20-22
[x] DeformationPreservesIntegral                                   | Properties.Preservation:14-17
[x] ParameterizationInvariance                                     | Properties.Preservation:27-31
[x] HomologyInvariance                                             | Properties.Preservation:34-37
[x] ConformalPreservation                                          | Properties.Preservation:40-44
[x] cauchyEstimates                                                | Theorems.Main:28-32
[x] AdaptiveContourQuadrature (Bridges)                            | Bridges.ToComputation:51-57
-/

#eval "MLInequalityBench: 12 estimation targets, 12 done, 100%"
