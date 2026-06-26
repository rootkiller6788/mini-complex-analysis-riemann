/-
# Benchmark: Full Suite

Runs all benchmarks and reports aggregate performance.
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Theorems.Classification
import MiniRiemannSurfaces.Properties.Invariants
import MiniRiemannSurfaces.Morphisms.Equiv

open MiniRiemannSurfaces

def runBench (name : String) (f : IO (ℕ × ℕ)) : IO Unit := do
  IO.println s!"  {name}..."
  let start := IO.monoMsNow
  let (iters, result) ← f
  let elapsed := (IO.monoMsNow - start).toNat
  IO.println s!"    {name}: {iters} iters, {elapsed}ms, result={result}"

partial def fullSuite : IO Unit := do
  IO.println "══════════════════════════════════"
  IO.println "  Full Riemann Surfaces Benchmark Suite"
  IO.println "══════════════════════════════════"
  IO.println ""

  -- Genus bench
  do
    let start := IO.monoMsNow
    let mut sum : ℤ := 0
    for _ in [0:10000] do
      for g in [0:100] do
        sum := sum + eulerCharacteristic g
    let elapsed := (IO.monoMsNow - start).toNat
    IO.println s!"  Genus/Euler: 10000*101 iters, {elapsed}ms, checksum={sum}"

  -- Classification bench
  do
    let start := IO.monoMsNow
    let mut c0 := 0
    let mut c1 := 0
    let mut ch := 0
    for _ in [0:5000] do
      for g in [0:100] do
        match classifyGenus g with
        | GenusClass.genus0 => c0 := c0 + 1
        | GenusClass.genus1 => c1 := c1 + 1
        | GenusClass.hyperbolic _ => ch := ch + 1
    let elapsed := (IO.monoMsNow - start).toNat
    IO.println s!"  Classify: 5000*101 iters, {elapsed}ms, (0:{c0},1:{c1},h:{ch})"

  -- Invariants bench
  do
    let start := IO.monoMsNow
    let mut sumDeg : ℤ := 0
    let mut sumSiegel : ℕ := 0
    for _ in [0:5000] do
      for g in [0:50] do
        sumDeg := sumDeg + canonicalBundleDegree g
        sumSiegel := sumSiegel + siegelUpperHalfSpaceDimension g
    let elapsed := (IO.monoMsNow - start).toNat
    IO.println s!"  Invariants: 5000*51 iters, {elapsed}ms, deg={sumDeg}, siegel={sumSiegel}"

  -- Moduli bench
  do
    let start := IO.monoMsNow
    let mut sum : ℕ := 0
    for _ in [0:5000] do
      for g in [3:52] do
        sum := sum + moduliDimension g
    let elapsed := (IO.monoMsNow - start).toNat
    IO.println s!"  Moduli: 5000*49 iters, {elapsed}ms, checksum={sum}"

  IO.println ""
  IO.println "═══ Full Suite Complete ═══"

def main : IO Unit := fullSuite
