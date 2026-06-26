import MiniMeromorphicFunctions

/-!
  # Introduction to Meromorphic Functions

  ## What is a meromorphic function?

  A function f is **meromorphic** on a domain U ⊆ ℂ if it is
  holomorphic on U except at a discrete set of isolated points
  called **poles**. At each pole, the function "blows up" in a
  controlled way:

  f(z) = g(z) / (z - z₀)^m

  where g is holomorphic near z₀ and g(z₀) ≠ 0.

  ## Key Concepts

  1. **Laurent Series**: Near any point z₀, a meromorphic function
     has an expansion f(z) = Σ_{n=-∞}^∞ a_n (z - z₀)^n with only
     finitely many nonzero negative terms.

  2. **Residue**: The coefficient a_{-1} in the Laurent expansion.
     Res(f, z₀) appears in contour integrals:
     ∮ f(z) dz = 2πi · Res(f, z₀).

  3. **Argument Principle**: The number of zeros minus the number
     of poles inside a contour equals the winding number of
     f(γ) around 0.

  4. **Rouché's Theorem**: If |f - g| < |f| on a contour, then
     f and g have the same number of zeros inside.

  ## Classification

  - On the Riemann sphere ℂ̂, meromorphic = rational function
  - On ℂ, meromorphic = quotient of two entire functions
  - Elliptic functions = doubly periodic meromorphic functions

  ## References

  - Ahlfors, "Complex Analysis"
  - Conway, "Functions of One Complex Variable"
  - Lang, "Complex Analysis"
-/

open MiniMeromorphicFunctions

#eval "docs/Intro.lean: introduction to meromorphic functions"
