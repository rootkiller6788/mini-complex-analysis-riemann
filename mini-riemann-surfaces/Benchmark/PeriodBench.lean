/-
# Benchmark: Period Matrix Operations

Measures throughput of period matrix-related computations:
Siegel upper half-space dimensions, period domain sizes.
-/

import MiniRiemannSurfaces.Properties.Invariants

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ Period Bench ═══"
  let start := IO.monoMsNow
  let mut sum : ℕ := 0
  for _ in [0:50000] do
    for g in [1:50] do
      sum := sum + siegelUpperHalfSpaceDimension g
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"50000*50 Siegel dimension computations: {elapsed}ms"
  IO.println s!"Checksum: {sum}"
