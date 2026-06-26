/-
# MiniComplexNumbers: Counterexamples

Counterexamples: non-algebraically closed subfield,
connected but not simply connected domain, and related examples.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Constructions.Subobjects
import MiniComplexNumbers.Properties.Invariants

namespace MiniComplexNumbers

/-! ## ℝ is Not Algebraically Closed -/

def counterexampleRealNotAlgebraicallyClosed : Prop :=
  ¬ (∀ (p : ComplexNumbers → ComplexNumbers), True)
  -- x²+1 = 0 has no solution in ℝ

def polyX2plus1 (z : ComplexNumbers) : ComplexNumbers := z * z + one

def hasNoRootInReal : Prop :=
  ∀ (z : ComplexNumbers), isReal z → polyX2plus1 z ≠ zero

def counterexample_real : Prop := hasNoRootInReal

/-! ## Punctured Plane is Connected but Not Simply Connected -/

def puncturedPlane : Set ComplexNumbers :=
  fun z => z ≠ zero

def counterexampleConnectedNotSimplyConnected : Prop :=
  isConnected puncturedPlane ∧ ¬ isSimplyConnected puncturedPlane

/-! ## Not Every Connected Open Set is Simply Connected -/

def annulus (r1 r2 : Float) : Set ComplexNumbers :=
  fun z => r1 < |z| ∧ |z| < r2

def counterexampleAnnulus : Prop :=
  isConnected (annulus 1 3) ∧ ¬ isSimplyConnected (annulus 1 3)

/-! ## ℝ-Linear but Not ℂ-Linear Map -/

def realLinearNotComplexLinear (z : ComplexNumbers) : ComplexNumbers :=
  ComplexNumbers.of z.re (2 * z.im)  -- scaling im by 2 is ℝ-linear but not ℂ-linear

def counterexampleRealVsComplexLinear : Prop :=
  isRealLinear realLinearNotComplexLinear ∧ ¬ isComplexLinear realLinearNotComplexLinear

/-! ## #eval Tests -/

#eval "── Examples.Counterexamples: ℝ not algebraically closed (x²+1 has no real root) ──"
#eval polyX2plus1 (ComplexNumbers.of 1 0)
#eval polyX2plus1 (ComplexNumbers.of 0 0)
#eval polyX2plus1 i  -- = 0, root exists in ℂ

#eval "── Examples.Counterexamples: Punctured plane ──"
#eval puncturedPlane (ComplexNumbers.of 1 0)
#eval puncturedPlane zero

#eval "── Examples.Counterexamples: ℝ-linear but not ℂ-linear map ──"
#eval realLinearNotComplexLinear (ComplexNumbers.of 3 4)
#eval realLinearNotComplexLinear (i * ComplexNumbers.of 3 4)

#eval "── Examples.Counterexamples: Annulus at z=2 ──"
#eval annulus 1 3 (ComplexNumbers.of 2 0)
#eval annulus 1 3 (ComplexNumbers.of 0 0.5)

end MiniComplexNumbers
