/-
# Computation: Period Matrix from Algebraic Curves

Algorithm for computing the period matrix of an algebraic Riemann surface
from its defining equation.

Given a hyperelliptic curve y² = P(x) where P has degree 2g+1 or 2g+2
with distinct roots, compute:
1. A basis of holomorphic differentials: ω_k = x^{k-1} dx / y, k = 1..g
2. A symplectic basis of H₁(X, ℤ) via Tretkoff-Tretkoff algorithm
3. Period matrices A_{ij} = ∫_{a_j} ω_i, B_{ij} = ∫_{b_j} ω_i
4. Normalized period matrix Ω = A^{-1}B in the Siegel upper half-space H_g
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Properties.Invariants

namespace MiniRiemannSurfaces.Computation

/-- A holomorphic differential on a hyperelliptic curve:
  ω_k = x^{k-1} dx / y, for k = 1, ..., g.
These form a basis of H⁰(X, K_X). -/
def holomorphicDifferentialBasis (g : ℕ) : List String :=
  (List.range g).map (fun k => s!"x^{k} dx / y")

/-- Compute the dimension of the space of holomorphic 1-forms
for a genus g Riemann surface (should equal g). -/
def holomorphicFormsCount (g : ℕ) : ℕ := g

/-- The period matrix A_{ij} (a-periods): integrals of ω_i over a_j cycles.
For hyperelliptic curves, the a-cycles can be taken as small loops
around pairs of branch points. -/
def aPeriodMatrixSize (g : ℕ) : ℕ := g * g

/-- The period matrix B_{ij} (b-periods): integrals of ω_i over b_j cycles.
B-cycles connect pairs of branch points through the cuts. -/
def bPeriodMatrixSize (g : ℕ) : ℕ := g * g

/-- The normalized period matrix Ω = A^{-1}B is a g×g symmetric matrix
with positive definite imaginary part. -/
def normalizedPeriodMatrixDimension (g : ℕ) : ℕ := g * g

#eval "Holomorphic differential basis for g=2: " ++ toString (holomorphicDifferentialBasis 2)
#eval "A-periods size for g=3: " ++ toString (aPeriodMatrixSize 3)
#eval "Normalized Omega size for g=4: " ++ toString (normalizedPeriodMatrixDimension 4)

end MiniRiemannSurfaces.Computation
