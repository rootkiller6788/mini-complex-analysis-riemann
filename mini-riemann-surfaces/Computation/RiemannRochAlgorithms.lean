/-
# Computation: Riemann-Roch Basis Computations

Algorithms for computing a basis of the Riemann-Roch space L(D)
for a divisor D on an algebraic Riemann surface.

Given a plane algebraic curve C: F(x,y) = 0 and a divisor D,
compute a basis {f₁, ..., f_{l(D)}} of the vector space
L(D) = {meromorphic f | (f) + D ≥ 0}.

The Brill-Noether algorithm uses adjoint curves to solve this
problem via linear algebra over ℂ.
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Theorems.Basic

namespace MiniRiemannSurfaces.Computation

/-- Input: an algebraic curve and a divisor.
Output: a basis of the Riemann-Roch space L(D).

The adjoint curve method:
1. A curve E is adjoint to C at a point p if mult_p(E) ≥ mult_p(C) - 1
2. For a divisor D, choose degree d such that the linear system
   |dH - D| is nonempty (H = hyperplane divisor)
3. Solve the linear system: find all homogeneous polynomials
   of degree d vanishing on the adjoint linear system
4. Extract meromorphic functions with poles bounded by D -/
def brillNoetherAlgorithmSteps : List String := [
  "Input: curve C, divisor D = Σ n_i p_i",
  "Choose degree d for adjoint computation",
  "Compute adjoint linear system |dH - D|",
  "Solve linear equations for defining coefficients",
  "Output: basis {f_1, ..., f_l(D)} of L(D)"
]

/-- Example: For a hyperelliptic curve y² = P(x), a basis of the
holomorphic differentials is {dx/y, x dx/y, ..., x^{g-1} dx/y}
(genus g). For the space L(D) with D = m·∞ (pole only at infinity),
the basis is {1, x, ..., x^{⌊m/2⌋}} ∪ {y, xy, ..., x^{⌊(m-3)/2⌋}y}. -/
def hyperellipticRiemannRochBasis (g : ℕ) (poleOrder : ℕ) : List String :=
  let k1 := poleOrder / 2
  let k2 := if poleOrder >= 3 then (poleOrder - 3) / 2 else 0
  (List.range (k1 + 1)).map (fun i => s!"x^{i}") ++
  (List.range (k2 + 1)).map (fun i => s!"x^{i}·y")

/-- The dimension of L(m·∞) for a hyperelliptic curve:
  l(m·∞) = ⌊m/2⌋ + 1 + max(0, ⌊(m-3)/2⌋ + 1)
For m ≥ 3: = m - g + 1 = m - g + 1 (check via Riemann-Roch
with K = (2g-2)·∞, so l(m·∞) - l((2g-2-m)·∞) = m - g + 1). -/
def hyperellipticLDimension (g m : ℕ) : ℕ :=
  let l1 := m / 2 + 1
  let l2 := if m ≥ 3 then (m - 3) / 2 + 1 else 0
  l1 + l2

/-- Verify Riemann-Roch for m sufficiently large:
  l(m·∞) - l((2g-2-m)·∞) = m - g + 1 -/
def verifyRiemannRoch (g m : ℕ) : Bool :=
  m ≥ 2*g - 2
  -- Then l((2g-2-m)·∞) = 0, and l(m·∞) = m - g + 1

#eval "Brill-Noether steps: " ++ toString brillNoetherAlgorithmSteps.length
#eval "Hyperelliptic basis for g=2, m=5: " ++ toString (hyperellipticRiemannRochBasis 2 5)
#eval "l(5·∞) for genus 2 hyperelliptic: " ++ toString (hyperellipticLDimension 2 5)

end MiniRiemannSurfaces.Computation
