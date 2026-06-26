/-
# MiniEntireHarmonic: Generate Examples Script

Script to generate and display examples of entire and harmonic
functions with their key properties.
-/

import MiniEntireHarmonic.Examples.Standard
import MiniEntireHarmonic.Examples.Counterexamples
import MiniEntireHarmonic.Properties.ClassificationData

open MiniEntireHarmonic

def main : IO Unit := do
  IO.println "═══════════════════════════════════════════"
  IO.println "  MINI-ENTIRE-HARMONIC EXAMPLE GENERATOR"
  IO.println "═══════════════════════════════════════════"
  IO.println ""

  -- Entire functions
  IO.println "═══ ENTIRE FUNCTIONS ═══"
  IO.println ""

  IO.println "1. e^z (order 1, type 1, no zeros)"
  IO.println s!"   e^1 = {entireExpZ (ComplexNumbers.of 1.0 0.0)}"
  IO.println s!"   e^{iπ} = {entireExpZ (ComplexNumbers.of 0.0 3.141592653589793)}"
  IO.println s!"   Classification: {classificationByOrder entireExpZ}"

  IO.println ""
  IO.println "2. sin z (order 1, type 1, zeros at nπ)"
  IO.println s!"   sin(π/2) = {entireSinZ (ComplexNumbers.of 1.5707963267948966 0.0)}"
  IO.println s!"   zeros: {sinZeroSet 3}"
  IO.println s!"   Classification: {classificationByOrder entireSinZ}"

  IO.println ""
  IO.println "3. cos πz (order 1, zeros at n+1/2)"
  IO.println s!"   cos(0) = {entireCosZ (ComplexNumbers.of 0.0 0.0)}"
  IO.println s!"   zeros: {cosPiZerosSet 5}"

  IO.println ""
  IO.println "4. e^{e^z} (infinite order)"
  IO.println s!"   e^{e^0} = e^1 ≈ {entireExpExpZ (ComplexNumbers.of 0.0 0.0)}"
  IO.println s!"   Classification: {classificationByOrder entireExpExpZ}"

  -- Harmonic functions
  IO.println ""
  IO.println "═══ HARMONIC FUNCTIONS ═══"
  IO.println ""

  IO.println "1. Re(z) = x (harmonic everywhere)"
  IO.println s!"   Re(3+4i) = {harmonicReZL (ComplexNumbers.of 3.0 4.0)}"

  IO.println "2. Im(z) = y (harmonic everywhere)"
  IO.println s!"   Im(3+4i) = {harmonicImZL (ComplexNumbers.of 3.0 4.0)}"

  IO.println "3. log|z| (harmonic on ℂ\\{0})"
  IO.println s!"   log|2| = {logModulus (ComplexNumbers.of 2.0 0.0)}"
  IO.println s!"   log|1+i| = {logModulus (ComplexNumbers.of 1.0 1.0)}"

  IO.println "4. Re(z²) = x² - y² (harmonic everywhere)"
  IO.println s!"   Re((1+i)²) = {harmonicZ2Real (ComplexNumbers.of 1.0 1.0)}"

  -- Poisson kernel
  IO.println ""
  IO.println "═══ POISSON KERNEL ═══"
  IO.println s!"   P(0, θ) = {poissonKernel 0.0 0.0} (constant 1 for all θ)"
  IO.println s!"   P(0.5, 0) = {poissonKernel 0.5 0.0}"
  IO.println s!"   P(0.5, π/2) = {poissonKernel 0.5 1.5707963267948966}"
  IO.println s!"   P(0.9, 0) = {poissonKernel 0.9 0.0}"

  -- Counterexamples
  IO.println ""
  IO.println "═══ COUNTEREXAMPLES ═══"
  IO.println s!"   {logModulusStatement}"
  IO.println s!"   {picardConstantExample}"

  IO.println ""
  IO.println "═══════════════════════════════════════════"
  IO.println "  EXAMPLE GENERATION COMPLETE"
  IO.println "═══════════════════════════════════════════"

#eval "── scripts/generate_examples.lean ──"
#eval "Example generator script ready"
#eval "Execute via `main` function"

end MiniEntireHarmonic
