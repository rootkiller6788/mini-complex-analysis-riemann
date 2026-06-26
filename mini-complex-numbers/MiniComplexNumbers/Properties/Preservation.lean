/-
# MiniComplexNumbers: Properties — Preservation

What various maps preserve: field automorphisms preserve modulus,
conjugation preserves algebraic properties, Möbius transformations
preserve the cross-ratio.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Morphisms.Iso

namespace MiniComplexNumbers

/-! ## Automorphisms Preserve Modulus -/

def automorphismsPreserveModulus (φ : ComplexFieldIso) : Prop :=
  ∀ z, |φ.forward z| = |z|

def conjugationPreservesModulus : Prop :=
  automorphismsPreserveModulus conjugationAutomorphism

/-! ## Conjugation Preserves Algebraic Properties -/

def conjugationPreservesFieldOps : Prop :=
  (∀ z w, complexConjugate (z + w) = complexConjugate z + complexConjugate w) ∧
  (∀ z w, complexConjugate (z * w) = complexConjugate z * complexConjugate w)

def conjugationPreservesModulusProp : Prop :=
  ∀ z, |complexConjugate z| = |z|

def conjugationPreservesArgument (z : ComplexNumbers) : Bool :=
  argument (complexConjugate z) = -argument z

/-! ## Möbius Transformations Preserve Cross-Ratio -/

def complexInv (z : ComplexNumbers) : ComplexNumbers :=
  let den := z.re * z.re + z.im * z.im
  ComplexNumbers.of (z.re / den) (-z.im / den)

def crossRatio (z₁ z₂ z₃ z₄ : ComplexNumbers) : ComplexNumbers :=
  if z₂ = z₃ ∨ z₁ = z₄ then zero
  else (z₁ - z₃) * (z₂ - z₄) * complexInv (z₁ - z₄) * complexInv (z₂ - z₃)

def moebiusTransform (a b c d : ComplexNumbers) (z : ComplexNumbers) : ComplexNumbers :=
  if c * z + d = zero then zero  -- map pole to ∞ (stub)
  else (a * z + b) * complexInv (c * z + d)

def crossRatioPreserving : Prop :=
  True  -- stub: Möbius maps preserve cross-ratio

/-! ## #eval Tests -/

#eval "── Properties.Preservation: Conjugation preserves modulus ──"
#eval |complexConjugate (ComplexNumbers.of 3 4)|
#eval |ComplexNumbers.of 3 4|

#eval "── Properties.Preservation: Conjugation preserves argument ──"
#eval conjugationPreservesArgument (ComplexNumbers.of 1 1)

#eval "── Properties.Preservation: Möbius transform at z=0 ──"
#eval moebiusTransform one one one one zero

end MiniComplexNumbers
