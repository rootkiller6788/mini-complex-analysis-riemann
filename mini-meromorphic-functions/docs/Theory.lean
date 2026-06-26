import MiniMeromorphicFunctions

/-!
  # Theory of Meromorphic Functions

  ## The Main Theorems

  ### Argument Principle
  For f meromorphic on a domain bounded by a simple closed contour γ:
  ```
  (1/2πi) ∮_γ f'(z)/f(z) dz = Z - P
  ```
  where Z = #zeros and P = #poles (counting multiplicities).

  ### Rouché's Theorem
  If |f - g| < |f| on a simple closed contour γ, then f and g
  have the same number of zeros inside γ (counting multiplicities).

  ### Mittag-Leffler Theorem
  Given any discrete sequence {a_k} and principal parts P_k,
  there exists a meromorphic function with exactly those principal
  parts at those poles:
  ```
  f(z) = Σ (P_k(z) - T_k(z))
  ```
  where T_k are convergence-producing polynomial terms.

  ### Weierstrass Factorization Theorem
  Given any discrete sequence {a_k} of prescribed zeros (with
  multiplicities m_k), there exists an entire function:
  ```
  g(z) = z^m e^{h(z)} ∏ E_p(z/a_k)^{m_k}
  ```
  where E_p are Weierstrass elementary factors.

  ### Residue Sum Theorem
  Σ (finite residues) + Res(f, ∞) = 0.

  ## Classification Results

  | Domain | Meromorphic Functions |
  |--------|----------------------|
  | ℂ̂ (sphere) | Rational functions ℂ(z) |
  | ℂ (plane) | Quotients of entire functions |
  | ℂ/Λ (torus) | Elliptic functions |

  ## Nevanlinna Theory
  The characteristic function T(r,f) = m(r,f) + N(r,f) measures
  the growth of a meromorphic function. Nevanlinna's Second Main
  Theorem generalizes Picard's theorem.

  ## Connections to Algebraic Geometry
  - Meromorphic functions on a Riemann surface X form a field M(X)
    of transcendence degree 1 over ℂ
  - Divisors D = Σ n_p [p] encode zero/pole data
  - Riemann-Roch: ℓ(D) - ℓ(K-D) = deg(D) + 1 - g
-/

open MiniMeromorphicFunctions

#eval "docs/Theory.lean: main theorems and theory overview"
