import MiniHolomorphicFunctions

open MiniHolomorphicFunctions

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniHolomorphicFunctions v0.1.0"
  IO.println "  Holomorphic Functions, Conformal Maps, Singularities"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  isComplexDifferentiable f z₀: limit of difference quotient exists"
  IO.println s!"  isHolomorphicAt f z₀: complex-differentiable in a neighborhood"
  IO.println s!"  isHolomorphicOn f U: differentiable at each point of open set U"
  IO.println s!"  isEntire f: holomorphic on all of ℂ"
  IO.println s!"  Cauchy-Riemann equations: ∂u/∂x = ∂v/∂y, ∂u/∂y = -∂v/∂x"
  IO.println s!"  isAnalytic f z₀: convergent power series expansion"
  IO.println s!"  AnalyticContinuation: extension along a path"
  IO.println s!"  SingularityType: removable, pole(order n), essential"
  IO.println s!"  IsolatedSingularity: type, residue, punctured disk analysis"
  IO.println ""
  IO.println "  Depends on: mini-math-kernel, mini-complex-numbers"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
