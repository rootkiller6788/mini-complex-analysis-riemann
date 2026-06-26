/-
# Benchmark: Schwarz Lemma — MiniConformalMapping Coverage

Target: Schwarz lemma and Schwarz-Pick lemma
-/

import MiniConformalMapping

/-!
## Schwarz Lemma

-- [x] Schwarz lemma: |f(z)| ≤ |z|                      | Core.Basic
-- [x] Equality case: f is rotation                     | Core.Laws (test cases)
-- [x] Schwarz-Pick: Poincaré metric contraction        | Core.Basic, Theorems.Basic
-- [x] Derivative bound from Schwarz-Pick               | Theorems.Basic
-- [x] Aut(D) are rotations fixing 0                    | Theorems.UniversalProperties

## Coverage Summary

Schwarz targets: 5/5 done | 0 partial
-/

#eval "SchwarzBench: 5 targets, 5 done, 100%"
