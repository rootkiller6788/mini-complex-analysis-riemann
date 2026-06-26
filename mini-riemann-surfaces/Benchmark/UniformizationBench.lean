/-
# Benchmark: Uniformization Type Classification

Measures throughput of uniformization domain classification
by genus.
-/

import MiniRiemannSurfaces.Theorems.Classification
import MiniRiemannSurfaces.Bridges.ToTopology

open MiniRiemannSurfaces

def main : IO Unit := do
  IO.println "═══ Uniformization Bench ═══"
  let start := IO.monoMsNow
  let mut count0 := 0
  let mut count1 := 0
  let mut countHyper := 0
  for _ in [0:5000] do
    for g in [0:100] do
      match classifyGenus g with
      | GenusClass.genus0 => count0 := count0 + 1
      | GenusClass.genus1 => count1 := count1 + 1
      | GenusClass.hyperbolic _ => countHyper := countHyper + 1
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"5000*101 classifications: {elapsed}ms"
  IO.println s!"  genus0={count0}, genus1={count1}, hyperbolic={countHyper}"
