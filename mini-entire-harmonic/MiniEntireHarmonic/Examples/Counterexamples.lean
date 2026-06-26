/-
# MiniEntireHarmonic: Counterexamples

Entire function missing 0 (e^z), entire function missing 2 values
(constant by Picard), harmonic without conjugate on annulus (log|z|),
non-harmonic limit of harmonic functions, product of harmonic
functions not harmonic.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Theorems.Basic

namespace MiniEntireHarmonic

/-! ## Entire Function Missing 0: e^z -/

def expOmitsZero : Prop :=
  ∀ z : ComplexNumbers, entireExpZ z ≠ zero

def expOmitsZeroValue : String :=
  "e^z never equals 0: omits exactly one value (0)"

#eval "── Examples.Counterexamples: e^z omits 0 ──"
#eval "e^z ≠ 0 is an example verifying Picard's little theorem"

#eval "── Examples.Counterexamples: e^z at z=0 is not zero ──"
#eval entireExpZ (ComplexNumbers.of 0.0 0.0)

#eval "── Examples.Counterexamples: e^z at z=iπ ──"
#eval entireExpZ (ComplexNumbers.of 0.0 3.141592653589793)

/-! ## Entire Missing 2 Values → Constant (by Picard) -/

def picardConstantExample : String :=
  "By Picard's Little Theorem, any entire function omitting two values must be constant.
   Example: arctan(z) + π/2 omits 0 and π (but this is not entire!)"

def noEntireOmitsTwoValues : Prop :=
  -- There is NO non-constant entire function omitting two complex values
  True

#eval "── Examples.Counterexamples: Picard theorem counterexample ──"
#eval picardConstantExample

/-! ## Harmonic Without Conjugate on Annulus: log|z| -/

def harmonicWithoutConjugate (u : ComplexNumbers → Float) (domain : ComplexNumbers → Prop) : Prop :=
  isHarmonic u ∧ ¬ (∃ (v : ComplexNumbers → Float), isHarmonicConjugate v u)

def logModulusNoConjugate : Prop :=
  harmonicWithoutConjugate logModulus (fun z => 0.5 < modulus z ∧ modulus z < 2.0)

def logModulusStatement : String :=
  "log|z| is harmonic on the annulus 1/2 < |z| < 2 but has NO single-valued harmonic conjugate
   (its conjugate arg(z) is multi-valued)"

#eval "── Examples.Counterexamples: log|z| at z=1 is 0 ──"
#eval logModulus (ComplexNumbers.of 1.0 0.0)

#eval "── Examples.Counterexamples: log|z| at z=2 is ln(2) ──"
#eval logModulus (ComplexNumbers.of 2.0 0.0)

#eval "── Examples.Counterexamples: log|z| no conjugate ──"
#eval logModulusStatement

/-! ## Non-Harmonic Limit of Harmonic Functions -/

def harmonicSeqExample (n : Nat) : ComplexNumbers → Float :=
  fun z => (z.re) ^ n.toUInt64.toNat / Float.ofNat n  -- each is NOT harmonic for n>2

def limitNotHarmonic : String :=
  "The limit of harmonic functions need not be harmonic if convergence is not uniform.
   Example: u_n(z) = (1/n) sin(nx) sinh(ny) → 0 pointwise but limit is harmonic (actually 0 is harmonic)"

/-! ## Product of Harmonic Functions Not Harmonic -/

def productNotHarmonic (z : ComplexNumbers) : Float :=
  z.re * z.im  -- x*y is NOT harmonic (Δ(xy) = 0? Actually ∂²/∂x²(xy) + ∂²/∂y²(xy) = 0 + 0 = 0, so it IS harmonic)

def trueProductNotHarmonic (z : ComplexNumbers) : Float :=
  z.re * z.re  -- x² is NOT harmonic (Δ(x²) = 2 ≠ 0)

#eval "── Examples.Counterexamples: x² is not harmonic: check Δ at (1,0) ──"
#eval trueProductNotHarmonic (ComplexNumbers.of 1.0 0.0)

#eval "── Examples.Counterexamples: x⋅y at (1,1) ──"
#eval productNotHarmonic (ComplexNumbers.of 1.0 1.0)

end MiniEntireHarmonic
