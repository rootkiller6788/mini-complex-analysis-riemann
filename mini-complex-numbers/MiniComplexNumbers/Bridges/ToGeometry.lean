/-
# MiniComplexNumbers: Bridges — ToGeometry

ℂ as a conformal model for the Euclidean plane, cross-ratio,
inversive geometry, and connections to hyperbolic geometry.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Morphisms.Hom
import MiniComplexNumbers.Constructions.Subobjects

namespace MiniComplexNumbers

/-! ## ℂ as Euclidean Plane -/

def euclideanDistance (z w : ComplexNumbers) : Float :=
  complexDist z w

def euclideanAngle (z₁ z₀ z₂ : ComplexNumbers) : Float :=
  argument ((z₁ - z₀) * complexConjugate (z₂ - z₀))

/-! ## Cross-Ratio -/

def crossRatioGeom (z₁ z₂ z₃ z₄ : ComplexNumbers) : ComplexNumbers :=
  if z₁ = z₄ ∨ z₂ = z₃ then zero
  else
    let num := (z₁ - z₃) * (z₂ - z₄)
    let den := (z₁ - z₄) * (z₂ - z₃)
    -- stub: use complex division
    num -- placeholder

def crossRatioReal (z₁ z₂ z₃ z₄ : ComplexNumbers) : Prop :=
  z₁.im = 0 ∧ z₂.im = 0 ∧ z₃.im = 0 ∧ z₄.im = 0  -- stub: zᵢ ∈ ℝ

def pointsConcyclic (z₁ z₂ z₃ z₄ : ComplexNumbers) : Prop :=
  isReal (crossRatioGeom z₁ z₂ z₃ z₄)  -- classical: cross-ratio is real iff points concyclic/collinear

/-! ## Inversive Geometry -/

def inversion (z : ComplexNumbers) (r : Float) : ComplexNumbers :=
  if z = zero then zero  -- map 0 to ∞ in extended plane
  else
    let scl := r * r / (z.re * z.re + z.im * z.im)
    ComplexNumbers.of (scl * z.re) (scl * z.im)

def reflection (z : ComplexNumbers) : ComplexNumbers :=
  complexConjugate z  -- reflection across real axis

/-! ## Möbius Transformations as Conformal Maps of S² -/

def moebiusGeom (a b c d : ComplexNumbers) : ComplexNumbers → ComplexNumbers :=
  fun z =>
    let inv (w : ComplexNumbers) : ComplexNumbers :=
      let den := w.re * w.re + w.im * w.im
      ComplexNumbers.of (w.re / den) (-w.im / den)
    if c * z + d = zero then zero
    else (a * z + b) * inv (c * z + d)

def moebiusDecomposition : Prop :=
  True  -- stub: every Möbius map is a composition of translations, dilations, and inversions

/-! ## #eval Tests -/

#eval "── Bridges.ToGeometry: Euclidean distance ──"
#eval euclideanDistance (ComplexNumbers.of 0 0) (ComplexNumbers.of 3 4)

#eval "── Bridges.ToGeometry: Inversion of z=2 ──"
#eval inversion (ComplexNumbers.of 2 0) 1

#eval "── Bridges.ToGeometry: Reflection across real axis ──"
#eval reflection (ComplexNumbers.of 3 4)

#eval "── Bridges.ToGeometry: Cross-ratio of 0,1,2,3 ──"
#eval crossRatioGeom (ComplexNumbers.of 0 0) (ComplexNumbers.of 1 0)
                     (ComplexNumbers.of 2 0) (ComplexNumbers.of 3 0)

end MiniComplexNumbers
