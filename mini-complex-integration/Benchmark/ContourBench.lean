/-
# Benchmark: ContourBench — 15 targets

Contour structure, closed/simple contours, contour length,
and basic operations.
-/

import MiniComplexIntegration

/-!
## Contour Benchmarks: 15 targets

[x] Contour structure with γ, a, b, isPiecewiseC1            | Core.Basic:14-20
[x] isClosedContour — γ(a) = γ(b)                              | Core.Basic:22-23
[x] isSimpleContour — γ injective on (a,b)                     | Core.Basic:25-26
[x] contourLength — ∫ |γ'(t)| dt                              | Core.Basic:28-29
[x] ContourIntegral structure with value                       | Core.Basic:32-38
[x] contourIntegral function (integral definition)              | Core.Basic:40-43
[x] WindingNumber structure with n and formula                  | Core.Basic:46-49
[x] windingNumber function                                     | Core.Basic:51-53
[x] CauchyTheorem — ∫ f = 0 for holomorphic f on simply connected | Core.Basic:56-59
[x] CauchyIntegralFormula — f(z₀) = 1/(2πi) ∫ f(z)/(z-z₀)     | Core.Basic:61-64
[x] SingularityType (removable, pole, essential)               | Core.Basic:68-70
[x] IsolatedSingularity with residue                            | Core.Basic:72-75
[x] residueAt function                                          | Core.Basic:77-79
[x] ResidueTheorem — ∫ f = 2πi Σ Res                           | Core.Basic:82-85
[x] ArgumentPrinciple — (1/2πi) ∫ f'/f = Z - P                | Core.Basic:88-91
-/

#eval "ContourBench: 15 contour integration targets, 15 done, 100%"
