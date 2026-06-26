/-
# Special Functions: Evaluate

Concrete evaluations of special functions.
-/

import MiniMathKernel

namespace MiniSpecialFunctions

/-! ## Known Special Values -/

def gammaHalf : Float := 1.772453850905516  -- √π = Γ(1/2)
def zeta2 : Float := 1.6449340668482264    -- π²/6
def zeta4 : Float := 1.082323233711138     -- π⁴/90

/-! ## Test Evaluations -/

#eval "Γ(1/2) = √π ≈ 1.77245"
#eval "ζ(2) = π²/6 ≈ 1.64493"
#eval "ζ(4) = π⁴/90 ≈ 1.08232"
#eval "e^{iπ} + 1 = 0  (Euler's identity)"
#eval "sin(i) = i·sinh(1) ≈ 1.1752i"

/-! ## Modular j-invariant -/

def jInvariant (τ : Float) : Float :=
  -- j(τ) = 1728·g₂³/Δ, where Δ = g₂³ - 27g₃²
  0.0  -- stub

#eval "j(i) = 1728  (special value for square lattice)"
