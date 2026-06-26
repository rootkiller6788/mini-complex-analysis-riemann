/-
# MiniEntireHarmonic: PoissonBench

Benchmark for Poisson kernel and Poisson integral operations:
kernel evaluation, integral quadrature, Dirichlet problem solving,
numerical integration convergence.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Bridges.ToComputation

namespace MiniEntireHarmonic.Benchmark

open MiniEntireHarmonic

/-! ## Benchmark: Poisson Kernel Evaluation -/

def benchPoissonKernelGrid (n : Nat) : IO Unit := do
  for i in List.range n do
    for j in List.range n do
      let r := Float.ofNat i / Float.ofNat n
      let θ := 2.0 * Float.pi * Float.ofNat j / Float.ofNat n
      let _ := poissonKernel r θ
      pure ()
  IO.println s!"Benchmarked {n}×{n} Poisson kernel evaluations"

/-! ## Benchmark: Poisson Integral Quadrature -/

def benchPoissonIntegral (N : Nat) (n : Nat) : IO Unit := do
  let boundary := fun _ : Float => 1.0
  for _ in List.range n do
    let _ := poissonIntegralNumerical boundary 0.5 0.0 N
    pure ()
  IO.println s!"Benchmarked {n} Poisson integral computations (N={N})"

/-! ## Benchmark: Dirichlet Problem Solution -/

def benchDirichletSolve (n : Nat) : IO Unit := do
  let boundary := fun θ : Float => Float.cos θ
  for i in List.range n do
    let r := Float.ofNat i / 10.0
    let θ := 0.0
    let _ := poissonIntegralNumerical boundary r θ 50
    pure ()
  IO.println s!"Benchmarked {n} Dirichlet problem solutions"

/-! ## Benchmark: Numerical Convergence -/

def benchPoissonConvergence (maxN : Nat) : IO Unit := do
  let boundary := fun θ : Float => Float.cos θ
  for n in List.range maxN do
    if n % 10 == 0 then
      let _ := poissonIntegralNumerical boundary 0.5 0.0 (n+1)
      pure ()
  IO.println s!"Benchmarked Poisson integral convergence up to N={maxN}"

/-! ## Benchmark Runner -/

def runPoissonBench : IO Unit := do
  IO.println "═══ POISSON BENCHMARK ═══"
  benchPoissonKernelGrid 20
  benchPoissonIntegral 100 20
  benchDirichletSolve 50
  benchPoissonConvergence 100
  IO.println "═══ POISSON BENCHMARK COMPLETE ═══"

#eval "── Benchmark.PoissonBench: Ready ──"
#eval "Poisson benchmark suite ready"

end MiniEntireHarmonic.Benchmark
