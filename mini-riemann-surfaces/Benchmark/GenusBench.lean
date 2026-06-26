/-
# Benchmark: Genus and Euler Characteristic

Measures throughput of genus and Euler characteristic computations
across a range of values.
-/

import MiniRiemannSurfaces.Core.Basic

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ Genus Bench ═══"
  let start := IO.monoMsNow
  let mut sum : ℤ := 0
  for _ in [0:10000] do
    for g in [0:100] do
      sum := sum + eulerCharacteristic g
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"10000*101 Euler characteristic computations: {elapsed}ms"
  IO.println s!"Checksum: {sum}"
