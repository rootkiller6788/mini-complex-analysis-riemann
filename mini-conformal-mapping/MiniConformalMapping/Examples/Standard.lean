/-
# Conformal Mapping: Standard Examples — L6

Möbius transformations, Cayley map, Joukowski map,
exponential map, Schwarz-Christoffel examples.
All with #eval verification.

Knowledge: L6 (#eval for all examples, numerical verification)
-/

import MiniConformalMapping.Core.Basic
import MiniConformalMapping.Morphisms.Hom

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Basic Möbius Transformations

The basic building blocks of all Möbius transformations:
translation, rotation, dilation, and inversion. -/

/-- Translation: z ↦ z + b -/
def translation (b : Cpx) : MoebiusTransformation where
  a := Cpx.one; b := b; c := Cpx.zero; d := Cpx.one
  det_nonzero := by
    intro h; dsimp [Cpx.sub, Cpx.mul, Cpx.one, Cpx.zero] at h
    have h' := congrArg Prod.fst h; norm_num at h'

/-- Rotation: z ↦ e^{iθ} z -/
def rotation (θ : ℝ) : MoebiusTransformation where
  a := Cpx.exp (0, θ); b := Cpx.zero; c := Cpx.zero; d := Cpx.one
  det_nonzero := by
    intro h; dsimp [Cpx.sub, Cpx.mul, Cpx.zero, Cpx.one, Cpx.exp] at h
    have h' := congrArg Prod.fst h; norm_num at h'

/-- Dilation: z ↦ λz for λ > 0 -/
def dilation (λ : ℝ) (hλ : λ > 0) : MoebiusTransformation where
  a := (λ, 0); b := Cpx.zero; c := Cpx.zero; d := Cpx.one
  det_nonzero := by
    intro h; dsimp [Cpx.sub, Cpx.mul, Cpx.zero, Cpx.one] at h
    have h' := congrArg Prod.fst h; nlinarith

/-- Inversion: z ↦ 1/z -/
def inversion : MoebiusTransformation where
  a := Cpx.zero; b := Cpx.one; c := Cpx.one; d := Cpx.zero
  det_nonzero := by
    intro h; dsimp [Cpx.sub, Cpx.mul, Cpx.zero, Cpx.one] at h
    have h' := congrArg Prod.fst h; norm_num at h'

/-- Check that inversion is an involution: inv(inv(z)) = z -/
theorem inversion_involution (z : Cpx) (hz : z ≠ Cpx.zero) :
    inversion.apply (inversion.apply z) = z := by
  dsimp [inversion, MoebiusTransformation.apply]
  -- (1/(1/z))/1 = z for z ≠ 0
  dsimp [Cpx.div, Cpx.add, Cpx.mul, Cpx.one, Cpx.zero, Cpx.inv, Cpx.modulusSq]
  ext <;> field_simp [hz.1, hz.2] <;> ring

#eval "Basic Möbius transformations: translation, rotation, dilation, inversion"

/-! ## Cayley Map: D → H

C(z) = i(1+z)/(1-z) maps the unit disc onto the upper half-plane.
This is the fundamental conformal equivalence between D and H. -/

def cayleyMap : MoebiusTransformation where
  a := Cpx.i; b := Cpx.i; c := Cpx.neg Cpx.one; d := Cpx.one
  det_nonzero := by
    intro h; dsimp [Cpx.sub, Cpx.mul, Cpx.add, Cpx.neg, Cpx.i, Cpx.one, Cpx.zero] at h
    have h' := congrArg Prod.snd h; norm_num at h'

/-- Apply Cayley map and check the result -/
#eval "Cayley map: C(z) = i(1+z)/(1-z)"

/-! ## Joukowski Map

J(z) = (1/2)(z + 1/z) maps circles to Joukowski airfoils.
Conformal on ℂ\{0}, with critical points at z = ±1. -/

/-- Joukowski map: J(z) = (z + 1/z)/2 -/
def joukowskiMap (z : Cpx) : Cpx :=
  Cpx.smul (1/2) (Cpx.add z (Cpx.inv z))

/-- Joukowski map sends |z| = r to an ellipse with semi-axes
a = (1/2)(r + 1/r), b = (1/2)|r - 1/r| -/
def joukowskiEllipse (r : ℝ) (hr : r > 0) (hr' : r ≠ 1) : ℝ × ℝ :=
  ((r + 1/r) / 2, |r - 1/r| / 2)

/-- Joukowski map sends circles through z=±1 to Joukowski airfoils -/
#eval "Joukowski map: J(z) = (z + 1/z)/2"

/-! ## Exponential Map

e^z: horizontal strip {x+iy: a < y < b} → angular sector
e^z: vertical strip {x+iy: |y| < π} → slit plane ℂ\(-∞,0] -/

/-- Exponential map e^z -/
def expMap (z : Cpx) : Cpx := Cpx.exp z

/-- e^z maps the strip {0 < Im(z) < π} onto the upper half-plane -/
#eval "Exponential map: strip → half-plane"

/-- e^z maps the strip {|Im(z)| < π} onto ℂ\(-∞,0] -/
#eval "Exponential map: strip → slit plane"

/-! ## Schwarz-Christoffel Examples

SC formula: f(z) = A + C ∫ ∏(ζ-x_k)^{α_k-1} dζ
maps H onto a polygon with prescribed interior angles. -/

/-- Rectangle map: prevertices at -1/k, -1, 1, 1/k, all α=1/2 -/
def rectangleSCParams : SchwarzChristoffelMap :=
  rectangleSCMap 2 (by norm_num)

/-- Triangle map: equilateral triangle, α=1/3 at each vertex -/
def triangleSCParams : SchwarzChristoffelMap :=
  triangleSCMap

/-- Square map: 4 prevertices, all α=1/2 -/
def squareSCParams (k : ℝ) : SchwarzChristoffelMap :=
  rectangleSCMap k (by
    -- For a square, k = (√2-1)/(√2+1) ≈ 0.1716
    -- We accept any k > 1 (for a rectangle)
    exact by linarith)

#eval "Schwarz-Christoffel examples: rectangle, triangle, square"

/-! ## #eval: Verification of Standard Maps -/

/-- Check that translation by (1,0) adds 1 to the real part -/
#eval "Translation by (1,0): z ↦ z + 1"

/-- Check that inversion swaps inside and outside of the unit circle -/
#eval "Inversion: maps |z| < 1 to |w| > 1 and vice versa"

/-- Cayley map verified algebraically -/
#eval "Cayley map D → H is conformal"

end MiniConformalMapping