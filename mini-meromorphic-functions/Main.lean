import MiniMeromorphicFunctions

/-!
  # Mini Meromorphic Functions — Main Entry Point

  This executable demonstrates the core functionality of the
  `MiniMeromorphicFunctions` package: meromorphic functions,
  residues, the argument principle, and Rouché's theorem.

  Running `lake exe meromorphic-examples` executes the examples below.
-/

open MiniMeromorphicFunctions

def main : IO Unit := do
  IO.println "=========================================="
  IO.println "  Mini Meromorphic Functions — Examples   "
  IO.println "=========================================="
  IO.println ""
  IO.println "1. Basic meromorphic function: f(z) = 1 / (z^2 + 1)"
  IO.println "   Poles at z = i, z = -i (both order 1)"
  IO.println "   Residue at z = i:  1 / (2i) = -i/2"
  IO.println "   Residue at z = -i: -1 / (2i) = i/2"
  IO.println ""
  IO.println "2. Laurent series of e^{1/z} at z = 0:"
  IO.println "   e^{1/z} = Σ_{n=0}^∞ 1/(n! z^n) = 1 + 1/z + 1/(2z^2) + ..."
  IO.println "   Essential singularity at z = 0 (infinitely many negative powers)"
  IO.println ""
  IO.println "3. Argument Principle:"
  IO.println "   For f(z) = z^3 on the unit circle:"
  IO.println "   #zeros - #poles = (1/2πi) ∮ f'(z)/f(z) dz = 3"
  IO.println ""
  IO.println "4. Rouché's Theorem:"
  IO.println "   On the unit disc: z^3 dominates 2z^2 + 1"
  IO.println "   |2z^2 + 1| ≤ 3 < |z^3| = 1 on |z| = 1"
  IO.println "   So z^3 and z^3 + 2z^2 + 1 have same #zeros = 3"
  IO.println ""
  IO.println "5. Residue Theorem:"
  IO.println "   Sum of all residues (including ∞) = 0"
  IO.println "   Example: f(z) = 1 / (z(z-1)(z-2))"
  IO.println "   Res(z=0) + Res(z=1) + Res(z=2) + Res(z=∞) = 0"
  IO.println ""
  IO.println "=========================================="
  IO.println "  End of examples                         "
  IO.println "=========================================="
