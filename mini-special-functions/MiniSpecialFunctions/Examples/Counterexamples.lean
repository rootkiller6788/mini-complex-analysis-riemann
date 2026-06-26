/-
# MiniSpecialFunctions: Counterexamples

Non-examples and edge cases:
- log z discontinuity across branch cut (negative real axis)
- ζ(1) pole (divergent harmonic series)
- e^{2πi} = 1 (exponential periodicity)
- Divergent series for zeta outside Re(s) > 1
- Non-modular functions
-/

import MiniSpecialFunctions.Examples.Standard

namespace MiniSpecialFunctions

open MiniComplexNumbers

/-! ## Logarithm Branch Cut Discontinuity -/

/-- Approaching the branch cut from above: log(-1 + εi) ≈ πi -/
def logAboveBranchCut (eps : Float) : ComplexNumbers :=
  complexLog (ComplexNumbers.of (-1) eps)

/-- Approaching the branch cut from below: log(-1 - εi) ≈ -πi -/
def logBelowBranchCut (eps : Float) : ComplexNumbers :=
  complexLog (ComplexNumbers.of (-1) (-eps))

/-- The discontinuity across the branch cut is 2πi -/
def logDiscontinuity (eps : Float) : Float :=
  let above := logAboveBranchCut eps
  let below := logBelowBranchCut eps
  above.im - below.im  -- should approach 2π

/-! ## ζ(1) Pole -/

/-- The harmonic series diverges: Σ 1/n = ∞ -/
def harmonicSum (N : Nat) : Float :=
  (List.range N).foldl (fun acc n =>
    acc + 1.0 / (Float.ofNat (n+1))
  ) 0.0

/-- Growth of harmonic sum demonstrates divergence (log N + γ) -/
def harmonicGrowthDemonstration : List Float :=
  [harmonicSum 10, harmonicSum 100, harmonicSum 1000, harmonicSum 10000]

/-! ## Exponential Periodicity: e^{2πi} = 1 -/

/-- e^{2πi} = 1, so log is not globally invertible -/
def expTwoPiI : ComplexNumbers :=
  complexExp (ComplexNumbers.of 0 (2.0 * Float.pi))

/-- Multiple preimages: e^z = e^{z + 2πin} for any n ∈ ℤ -/
def expPeriodicityCheck (n : Int) : ComplexNumbers :=
  complexExp (ComplexNumbers.of 0 (Float.ofInt n * 2.0 * Float.pi))

/-! ## Divergent Series for Zeta -/

/-- ζ(s) = Σ 1/n^s converges only for Re(s) > 1 -/
def zetaFailsAtOne : Float :=
  zetaPartialSum 1.0 100000  -- returns NaN

/-- ζ(0.5) series diverges (critical line requires analytic continuation) -/
def zetaFailsAtHalf : Float :=
  zetaPartialSum 0.5 100000  -- returns NaN (divergent series)

/-- Partial sums grow without bound for s ≤ 1 -/
def zetaPartialSumGrowth (s : Float) (N : Nat) : Float :=
  if s ≤ 1.0 then Float.nan
  else zetaPartialSum s N

/-! ## Non-Modular Functions -/

/-- exp(τ) is NOT a modular form: it grows too fast at the cusp -/
def exponentialNotModular (τ : ComplexNumbers) : ComplexNumbers :=
  complexExp τ

/-- A random function f(τ) = τ² is not modular -/
def tauSquaredNotModular (τ : ComplexNumbers) : ComplexNumbers :=
  τ.mul τ

/-! ## #eval Tests -/

#eval "── Examples.Counterexamples: log branch cut jump (~2π) ──"
#eval logDiscontinuity 0.001

#eval "── Examples.Counterexamples: Harmonic sum growth ──"
#eval harmonicGrowthDemonstration

#eval "── Examples.Counterexamples: e^{2πi} = 1 ──"
#eval expTwoPiI

#eval "── Examples.Counterexamples: e^{4πi} = 1 ──"
#eval expPeriodicityCheck 2

#eval "── Examples.Counterexamples: ζ(1) is NaN (divergent) ──"
#eval zetaFailsAtOne

#eval "── Examples.Counterexamples: ζ(0.5) series diverges ──"
#eval zetaFailsAtHalf

end MiniSpecialFunctions
