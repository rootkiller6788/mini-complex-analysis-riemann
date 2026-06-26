/-
# MiniEntireHarmonic: Standard Examples

e^z (order 1, type 1), sin z (order 1, type 1; zeros at nπ),
cos πz (zeros at n+1/2), e^{e^z} (infinite order),
harmonic: log|z| on ℂ\{0}, Re(z^n), Poisson of 1.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Properties.Invariants
import MiniEntireHarmonic.Properties.ClassificationData

namespace MiniEntireHarmonic

/-! ## e^z: Order 1, Type 1 -/

def expOrder : Float := 1.0
def expType : Float := 1.0

def expGrowth (r : Float) : Float := Float.exp r

def expZeros : List ComplexNumbers := []  -- e^z has no zeros

def expHadamard : String :=
  "e^z: order 1, type 1, m=0, P(z)=z, no zeros → z^0 e^z ∏ (empty)"

#eval "── Examples.Standard: e^z at z=1 ──"
#eval entireExpZ (ComplexNumbers.of 1.0 0.0)

#eval "── Examples.Standard: e^z at z=iπ ──"
#eval entireExpZ (ComplexNumbers.of 0.0 3.141592653589793)

/-! ## sin z: Order 1, Type 1, Zeros at nπ -/

def sinOrder : Float := 1.0
def sinType : Float := 1.0

def sinZeroSet (n : Nat) : List ComplexNumbers :=
  (List.range n).bind fun k => [
    ComplexNumbers.of (Float.ofNat k * Float.pi) 0.0,
    ComplexNumbers.of (-Float.ofNat k * Float.pi) 0.0
  ]

def sinHadamard : String :=
  "sin z: order 1, type 1, zeros at nπ → z ∏_{n≠0} (1 - z/(nπ))"

#eval "── Examples.Standard: sin(z) at z=π/2 ──"
#eval entireSinZ (ComplexNumbers.of 1.5707963267948966 0.0)

#eval "── Examples.Standard: sin(z) at z=0 ──"
#eval entireSinZ (ComplexNumbers.of 0.0 0.0)

#eval "── Examples.Standard: sin zeros up to 3 ──"
#eval sinZeroSet 3

/-! ## cos πz: Zeros at n + 1/2 -/

def cosPiOrder : Float := 1.0
def cosPiZerosSet (n : Nat) : List ComplexNumbers :=
  (List.range n).map fun k => ComplexNumbers.of (Float.ofNat k + 0.5) 0.0

def cosPiHadamard : String :=
  "cos πz: order 1, zeros at n+1/2 → ∏ (1 - z/(n+1/2))"

#eval "── Examples.Standard: cos(z) at z=0 ──"
#eval entireCosZ (ComplexNumbers.of 0.0 0.0)

#eval "── Examples.Standard: cos zeros up to 5 ──"
#eval cosPiZerosSet 5

/-! ## e^{e^z}: Infinite Order -/

def doubleExpZeros : List ComplexNumbers := []  -- also no zeros

def doubleExpHadamard : String :=
  "e^{e^z}: infinite order → NO finite Hadamard factorization"

#eval "── Examples.Standard: e^{e^z} at z=0 ──"
#eval entireExpExpZ (ComplexNumbers.of 0.0 0.0)

#eval "── Examples.Standard: e^{e^z} at z=1 ──"
#eval entireExpExpZ (ComplexNumbers.of 1.0 0.0)

/-! ## Harmonic Examples -/

def logModulus (z : ComplexNumbers) : Float :=
  Float.log (modulus z)  -- harmonic on ℂ\{0}

def rePartOfZPower (z : ComplexNumbers) (n : Nat) : Float :=
  -- Re(z^n) is harmonic
  z.re  -- simplified

def poissonOfOne (z : ComplexNumbers) : Float :=
  -- The harmonic function identically 1 on D
  1.0

def harmonicReZL (z : ComplexNumbers) : Float := z.re  -- Re(z) is harmonic

def harmonicImZL (z : ComplexNumbers) : Float := z.im  -- Im(z) is harmonic

def harmonicZ2Real (z : ComplexNumbers) : Float :=
  z.re * z.re - z.im * z.im  -- Re(z²) = x² - y² is harmonic

#eval "── Examples.Standard: log|z| at z=2 ──"
#eval logModulus (ComplexNumbers.of 2.0 0.0)

#eval "── Examples.Standard: Re(z) at z=3+4i ──"
#eval harmonicReZL (ComplexNumbers.of 3.0 4.0)

#eval "── Examples.Standard: Poisson of 1 at z=0.5 ──"
#eval poissonOfOne (ComplexNumbers.of 0.5 0.0)

#eval "── Examples.Standard: Re(z²) at z=1+i ──"
#eval harmonicZ2Real (ComplexNumbers.of 1.0 1.0)

end MiniEntireHarmonic
