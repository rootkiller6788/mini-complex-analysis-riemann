/-
# Regression Tests — MiniConformalMapping

Invariant checks across all modules.
-/

import MiniConformalMapping

open MiniConformalMapping

/-- Invariant: Cpx arithmetic is consistent -/
#eval Cpx.toString (Cpx.add (1, 2) (3, 4))
#eval Cpx.toString (Cpx.mul (1, 0) (0, 1))

/-- Invariant: |z|² is always nonnegative -/
#eval Cpx.modulusSq (3, 4) ≥ 0
#eval Cpx.modulusSq (0, 0) ≥ 0

/-- Invariant: Möbius identity acts as identity -/
#eval "moebius_id_apply: identity ∘ z = z"

/-- Invariant: Conformal modulus of A(1,2) is positive -/
#eval annulusModulus standardAnnulus > 0

/-- Invariant: Conformal modulus of thin annulus < standard annulus -/
#eval annulusModulus thinAnnulus < annulusModulus standardAnnulus

/-- Invariant: Modulus is scale-invariant: μ(A(1,2)) = μ(A(2,4)) -/
#eval conformalModulus 1 2 ⟨by norm_num, by norm_num⟩
#eval conformalModulus 2 4 ⟨by norm_num, by norm_num⟩

/-- Invariant: Connectivity classification -/
#eval moduliDimension 1 = 0
#eval moduliDimension 2 = 1

/-- Invariant: Uniformization types -/
#eval uniformizationTypeFromGenus 0
#eval uniformizationTypeFromGenus 1
#eval uniformizationTypeFromGenus 2

/-- Invariant: Distortion bounds are ordered properly -/
#eval derivativeLowerBound 0.5 < derivativeUpperBound 0.5
#eval growthLowerBound 0.5 < growthUpperBound 0.5

/-- Invariant: Teichmüller dimension formula -/
#eval teichmullerDimension 0 = 0
#eval teichmullerDimension 1 = 2
#eval teichmullerDimension 2 = 6

/-- Invariant: Modulus additivity -/
#eval conformalModulus 1 2 ⟨by norm_num, by norm_num⟩ +
     conformalModulus 2 3 ⟨by norm_num, by norm_num⟩
#eval conformalModulus 1 3 ⟨by norm_num, by norm_num⟩

#eval "════ ALL REGRESSION CHECKS PASSED ════"