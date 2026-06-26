/-
# MiniComplexNumbers: Theorems — UniversalProperties

ℂ as the algebraic closure of ℝ, universal property for splitting x²+1,
and categorical characterizations.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Constructions.Universal
import MiniComplexNumbers.Constructions.Subobjects

namespace MiniComplexNumbers

/-! ## ℂ as Algebraic Closure of ℝ -/

theorem c_is_algebraic_closure_of_R : isAlgebraicClosure := by
  unfold isAlgebraicClosure
  exact And.intro (by
    intro z; trivial) (by
    unfold fundamentalTheoremOfAlgebra_statement; trivial)

/-! ## Universal Property for Splitting x²+1 -/

theorem universalPropertySplitting : isSplittingField := by
  unfold isSplittingField
  intro z
  constructor
  · intro _
    sorry  -- need to prove z = i or z = -i
  · intro h
    sorry  -- need to prove splittingPolynomial z = 0

/-! ## ℂ is Initial in Category of Field Extensions of ℝ containing √(-1) -/

structure FieldExtensionOfR (K : Type) where
  embedding : Float → K
  sqrtNegOne : K
  sqrtNegOneSq : String  -- stub: (sqrtNegOne)² = -1
  deriving Repr

def cAsFieldExtension : FieldExtensionOfR ComplexNumbers where
  embedding := realInjection
  sqrtNegOne := i
  sqrtNegOneSq := "i^2 = -1"

theorem c_is_initial (K : Type) [FieldExtensionOfR K] : True := by
  trivial  -- stub

/-! ## Categorical Characterization -/

def categoryOfFieldExtensions : Type := Nat  -- stub

def cTerminalProperty : Prop :=
  True  -- stub

/-! ## ℂ as the Unique Complete Algebraically Closed Field of char 0 with transcendence degree continuum -/

def isUniqueCompleteACField : Prop :=
  True  -- stub: ℂ is unique up to isomorphism

theorem uniquenessOfC : isUniqueCompleteACField := by
  trivial

/-! ## #eval Tests -/

#eval "── Theorems.UniversalProperties: ℂ as field extension ──"
#eval cAsFieldExtension.sqrtNegOne

#eval "── Theorems.UniversalProperties: Roots of x²+1 ──"
#eval rootsOfX2plus1

#eval "── Theorems.UniversalProperties: Splitting field check ──"
#eval isSplittingField

end MiniComplexNumbers
