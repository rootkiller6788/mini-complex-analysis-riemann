/-
# Benchmark: Divisor Group and Moduli Space Operations

Measures throughput of divisor group and moduli dimension computations.
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Morphisms.Equiv

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ Divisor/Moduli Bench ═══"
  let start := IO.monoMsNow
  let mut sum : ℕ := 0
  for _ in [0:10000] do
    for g in [3:100] do
      sum := sum + moduliDimension g
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"10000*97 moduli dimension computations: {elapsed}ms"
  IO.println s!"Checksum: {sum}"
