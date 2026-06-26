/-
# Benchmark: Roots of Unity

Measures performance of nth roots of unity computation.
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ ROOTS OF UNITY BENCHMARK ══"

/-!
## Operations tested:
-- [x] nthRootsOfUnity n=4
-- [x] nthRootsOfUnity n=6
-- [x] nthRootsOfUnity n=8
-- [x] nthRootsOfUnity n=12
-- [x] nthRootsOfUnity n=100
-/

def benchRootsOfUnity (n : Nat) : Nat :=
  let roots := nthRootsOfUnity n
  roots.length

#eval "── RootsBench: n=4 ──"
#eval benchRootsOfUnity 4

#eval "── RootsBench: n=6 ──"
#eval benchRootsOfUnity 6

#eval "── RootsBench: n=8 ──"
#eval benchRootsOfUnity 8

#eval "── RootsBench: n=12 ──"
#eval benchRootsOfUnity 12

#eval "── RootsBench: n=20 ──"
#eval benchRootsOfUnity 20

#eval "── RootsBench: n=100 ──"
#eval benchRootsOfUnity 100

#eval "══ ROOTS BENCHMARK COMPLETE ══"
