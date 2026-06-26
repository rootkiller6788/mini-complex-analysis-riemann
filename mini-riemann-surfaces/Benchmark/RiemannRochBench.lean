/-
# Benchmark: Riemann-Roch Formula Evaluations

Measures throughput of Riemann-Roch formula parameter computations.
-/

import MiniRiemannSurfaces.Properties.Invariants

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ Riemann-Roch Bench ═══"
  let start := IO.monoMsNow
  let mut sum : ℤ := 0
  for _ in [0:20000] do
    for g in [0:50] do
      sum := sum + canonicalBundleDegree g
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"20000*51 canonical degree computations: {elapsed}ms"
  IO.println s!"Checksum: {sum}"
