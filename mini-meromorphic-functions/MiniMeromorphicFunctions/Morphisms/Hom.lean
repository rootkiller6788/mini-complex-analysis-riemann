import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Morphisms
import MiniMeromorphicFunctions.Core.Basic
import MiniMeromorphicFunctions.Core.Objects

/-!
  # Morphisms: Meromorphic Maps and Rational Maps

  - `MeromorphicMap`: a map between Riemann spheres given by
    meromorphic functions
  - `rationalMap`: a map defined by rational functions
  - `divisor`: a formal sum of points with integer multiplicities
-/

namespace MiniMeromorphicFunctions

open MiniObjectKernel

/-! ## Meromorphic Maps between Riemann Spheres -/

/-- A meromorphic map from the Riemann sphere to itself is given by
    a meromorphic function `f`. Equivalently, it is a holomorphic map
    `ℂ̂ → ℂ̂` (every holomorphic map to the Riemann sphere that is not
    identically ∞ is given by a meromorphic function). -/
structure MeromorphicMap where
  /-- The underlying meromorphic function on ℂ. -/
  function : MeromorphicFunction Set.univ
  /-- The value at ∞ (after compactification). -/
  valueAtInfinity : WithInfinity ℂ

/-- A rational map is a map ℂ̂ → ℂ̂ given by [P(z) : Q(z)]
    in homogeneous coordinates. -/
structure RationalMap where
  /-- Homogeneous polynomials P, Q of the same degree. -/
  P : Polynomial ℂ
  Q : Polynomial ℂ
  /-- Not both identically zero. -/
  notBothZero : P ≠ 0 ∨ Q ≠ 0
  /-- Same degree (or one is zero). -/
  sameDegree : natDegree P = natDegree Q ∨ P = 0 ∨ Q = 0

/-- Convert a rational map to a meromorphic map. -/
def RationalMap.toMeromorphicMap (r : RationalMap) : MeromorphicMap where
  function := {
    toFun := λ z ↦
      if r.Q.eval z = 0 then 0 else r.P.eval z / r.Q.eval z
    poles := {z | r.Q.eval z = 0}
    holomorphicOn := by sorry
    polesIsolated := by sorry
    finitePrincipalPart := by sorry
  }
  valueAtInfinity :=
    if h : r.Q ≠ 0 then
      WithInfinity.some (Polynomial.leadingCoeff r.P / Polynomial.leadingCoeff r.Q)
    else WithInfinity.infinity

/-! ## Divisors -/

/-- A divisor on the Riemann sphere is a formal finite sum of
    points with integer multiplicities (coefficients).
    D = Σ n_i [z_i] where n_i ∈ ℤ. -/
structure Divisor where
  /-- The support as a map from ℂ to ℤ, nonzero only at finitely many points. -/
  coeff : ℂ → ℤ
  /-- Finite support. -/
  finite_support : (Finset.filter (λ z ↦ coeff z ≠ 0) Finset.univ).Finite

/-- The divisor of a meromorphic function `f`:
    (f) = Σ ord_p(f) [p], where ord_p(f) is the order of zero
    (positive) or pole (negative). -/
def divisorOfMeromorphic (f : MeromorphicFunction U) : Divisor where
  coeff := λ z ↦
    if hz : IsZeroOfOrder f z 0 then 0
    else if hp : z ∈ f.poles then -((Classical.choose (f.finitePrincipalPart z hp) : ℕ) : ℤ)
    else 0
  finite_support := by sorry

/-- The degree of a divisor is the sum of its coefficients. -/
def Divisor.degree (D : Divisor) : ℤ :=
  ∑ z in D.finite_support.toFinset, D.coeff z

/-! ## #eval Examples -/

#eval "MeromorphicMap: f: ℂ̂ → ℂ̂ via meromorphic functions"
#eval "RationalMap: [P:Q] homogeneous coordinates"
#eval "Divisor: formal sum Σ n_i [z_i]"

end MiniMeromorphicFunctions
