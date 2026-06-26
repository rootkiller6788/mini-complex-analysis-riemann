import MiniMeromorphicFunctions

/-!
  # Run Examples Script

  Demonstrates all the major examples and theorems from the
  MiniMeromorphicFunctions library. Run with:
  `lake exe meromorphic-examples`
-/

open MiniMeromorphicFunctions

/-- Run the example demonstrations. -/
def runExamplesDemonstrations : IO Unit := do
  IO.println "╔════════════════════════════════════════════╗"
  IO.println "║  Mini Meromorphic Functions — Examples     ║"
  IO.println "╚════════════════════════════════════════════╝"
  IO.println ""

  IO.println "─── Core Concepts ───"
  IO.println "Meromorphic functions: holomorphic except at isolated poles"
  IO.println "Poles: points where function → ∞ like 1/(z-z₀)^m"
  IO.println "Zeros: points where function = 0 like (z-z₀)^n"
  IO.println "Essential singularities: infinitely many negative Laurent terms"
  IO.println ""

  IO.println "─── Residue Calculus ───"
  IO.println "Residue of 1/(z²+1) at z=i: 1/(2i) = -i/2"
  IO.println "Residue of cot z at z=0: 1"
  IO.println "Residue of 1/z^n at z=0: 0 for n > 1"
  IO.println "Sum of residues (including ∞) = 0"
  IO.println ""

  IO.println "─── Argument Principle ───"
  IO.println "(1/2πi) ∮ f'(z)/f(z) dz = Z - P"
  IO.println "For f(z) = z^3 on unit circle: Z = 3, P = 0"
  IO.println ""

  IO.println "─── Rouché's Theorem ───"
  IO.println "If |f - g| < |f| on γ, then #zeros(f) = #zeros(g)"
  IO.println "Example: z^3 dominates 2z²+1 on |z| = 1"
  IO.println "Both z^3 and z^3 + 2z² + 1 have 3 zeros in |z| < 1"
  IO.println ""

  IO.println "─── Main Theorems ───"
  IO.println "Mittag-Leffler: prescribed principal parts always possible"
  IO.println "Weierstrass Factorization: prescribed zeros always possible"
  IO.println "Classification: meromorphic on ℂ̂ = rational functions"
  IO.println ""

  IO.println "─── Famous Examples ───"
  IO.println "Gamma function: Γ(z) has poles at 0, -1, -2, ..."
  IO.println "Riemann zeta: ζ(s) has pole at s=1, zeros at -2, -4, ..."
  IO.println "Weierstrass ℘: elliptic, doubly periodic, double poles"
  IO.println ""

  IO.println "─── Counterexamples ───"
  IO.println "e^{1/z}: essential singularity at 0 (∞ negative terms)"
  IO.println "log z: branch point, NOT meromorphic"
  IO.println "√z: algebraic branch point, NOT meromorphic"
  IO.println ""

  IO.println "╔════════════════════════════════════════════╗"
  IO.println "║  End of examples                          ║"
  IO.println "╚════════════════════════════════════════════╝"

/-- Main script entry point. -/
def main : IO Unit :=
  runExamplesDemonstrations

#eval "scripts/run_examples.lean: demonstration script ready"
