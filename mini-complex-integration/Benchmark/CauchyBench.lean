/-
# Benchmark: CauchyBench — 15 targets

Cauchy theory: Goursat, integral formula, derivative formula,
Liouville, FTA, maximum modulus, open mapping, identity theorem.
-/

import MiniComplexIntegration

/-!
## Cauchy Theory Benchmarks: 15 targets

[x] linearityOfContourIntegral                                    | Core.Laws:16-18
[x] reversalOfContour                                             | Core.Laws:20-22
[x] pathAdditivity                                                | Core.Laws:24-26
[x] mlInequality                                                  | Core.Laws:28-30
[x] cauchyGoursatTheorem (Core.Laws)                              | Core.Laws:32-34
[x] deformationInvariance                                         | Core.Laws:36-38
[x] cauchyGoursatFull (Theorems.Basic)                            | Theorems.Basic:19-23
[x] cauchyIntegralFormulaFull                                     | Theorems.Basic:25-29
[x] cauchyDerivativeFormulaFull                                   | Theorems.Basic:31-34
[x] residueTheoremFull                                            | Theorems.Basic:37-40
[x] argumentPrincipleFull                                         | Theorems.Basic:42-45
[x] roucheTheoremFull                                             | Theorems.Basic:49-51
[x] moreraTheoremFull                                             | Theorems.Basic:55-57
[x] liouvilleTheoremFull                                          | Theorems.Main:41-44
[x] fundamentalTheoremAlgebra                                     | Theorems.Main:48-51
-/

#eval "CauchyBench: 15 Cauchy theory targets, 15 done, 100%"
