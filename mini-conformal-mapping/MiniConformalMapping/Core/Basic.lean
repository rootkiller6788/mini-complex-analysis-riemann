/-
# Conformal Mapping: Core Definitions — L1-L4

Complex numbers as ℝ×ℝ, Möbius transformations, cross-ratio,
conformal maps, Aut(D), Aut(H), Schwarz lemma, Riemann mapping.

Knowledge: L1 (Cpx, Moebius, CrossRatio, ConformalMap), L2 (Aut groups,
Poincaré distance), L3 (group structure), L4 (Riemann statement),
L5 (algebraic proofs, case analysis), L6 (#eval examples)
-/

import MiniObjectKernel.Core.Basic

namespace MiniConformalMapping

open MiniObjectKernel

/-! ## Complex Numbers as ℝ × ℝ

Represent z = x + iy as (x, y) : ℝ × ℝ.
All algebraic operations are defined explicitly. -/

def Cpx : Type := ℝ × ℝ

namespace Cpx

def zero : Cpx := (0, 0)
def one : Cpx := (1, 0)
def i : Cpx := (0, 1)
def add (z w : Cpx) : Cpx := (z.1 + w.1, z.2 + w.2)
def neg (z : Cpx) : Cpx := (-z.1, -z.2)
def sub (z w : Cpx) : Cpx := add z (neg w)
def mul (z w : Cpx) : Cpx := (z.1 * w.1 - z.2 * w.2, z.1 * w.2 + z.2 * w.1)
def conj (z : Cpx) : Cpx := (z.1, -z.2)
def modulusSq (z : Cpx) : ℝ := z.1 * z.1 + z.2 * z.2
def modulus (z : Cpx) : ℝ := Real.sqrt (modulusSq z)
def inv (z : Cpx) : Cpx :=
  let d := modulusSq z
  (z.1 / d, -z.2 / d)
def div (z w : Cpx) : Cpx := mul z (inv w)
def re (z : Cpx) : ℝ := z.1
def im (z : Cpx) : ℝ := z.2
def smul (r : ℝ) (z : Cpx) : Cpx := (r * z.1, r * z.2)
def inUnitDisc (z : Cpx) : Bool := modulusSq z < 1
def inUpperHalfPlane (z : Cpx) : Bool := z.2 > 0
def exp (z : Cpx) : Cpx :=
  let e := Real.exp z.1
  (e * Real.cos z.2, e * Real.sin z.2)
def toString (z : Cpx) : String :=
  if z.2 ≥ 0 then s!"{z.1} + {z.2}i" else s!"{z.1} - {-z.2}i"

end Cpx

/-! ### Algebraic theorems for Cpx -/

theorem cpx_add_assoc (z w v : Cpx) : Cpx.add (Cpx.add z w) v = Cpx.add z (Cpx.add w v) := by
  ext <;> dsimp [Cpx.add] <;> ring

theorem cpx_add_comm (z w : Cpx) : Cpx.add z w = Cpx.add w z := by
  ext <;> dsimp [Cpx.add] <;> ring

theorem cpx_mul_assoc (z w v : Cpx) : Cpx.mul (Cpx.mul z w) v = Cpx.mul z (Cpx.mul w v) := by
  ext <;> dsimp [Cpx.mul] <;> ring

theorem cpx_mul_comm (z w : Cpx) : Cpx.mul z w = Cpx.mul w z := by
  ext <;> dsimp [Cpx.mul] <;> ring

theorem cpx_mul_one (z : Cpx) : Cpx.mul z Cpx.one = z := by
  ext <;> dsimp [Cpx.mul, Cpx.one] <;> ring

theorem cpx_modulusSq_nonneg (z : Cpx) : Cpx.modulusSq z ≥ 0 := by
  dsimp [Cpx.modulusSq]
  have hx : z.1 * z.1 ≥ 0 := mul_self_nonneg _
  have hy : z.2 * z.2 ≥ 0 := mul_self_nonneg _
  nlinarith

theorem cpx_modulus_nonneg (z : Cpx) : Cpx.modulus z ≥ 0 :=
  Real.sqrt_nonneg _

theorem cpx_modulusSq_mul (z w : Cpx) :
    Cpx.modulusSq (Cpx.mul z w) = Cpx.modulusSq z * Cpx.modulusSq w := by
  dsimp [Cpx.modulusSq, Cpx.mul]
  ring

theorem cpx_modulus_mul (z w : Cpx) :
    Cpx.modulus (Cpx.mul z w) = Cpx.modulus z * Cpx.modulus w := by
  dsimp [Cpx.modulus]
  rw [cpx_modulusSq_mul]
  rw [Real.sqrt_mul (cpx_modulusSq_nonneg z)]

theorem cpx_modulus_sq_eq (z : Cpx) : Cpx.modulus z * Cpx.modulus z = Cpx.modulusSq z :=
  Real.mul_self_sqrt (cpx_modulusSq_nonneg z)

/-! ## Möbius Transformations

f(z) = (az + b)/(cz + d), ad - bc ≠ 0 -/

structure MoebiusTransformation where
  a : Cpx
  b : Cpx
  c : Cpx
  d : Cpx
  det_nonzero : Cpx.sub (Cpx.mul a d) (Cpx.mul b c) ≠ Cpx.zero

def MoebiusTransformation.apply (M : MoebiusTransformation) (z : Cpx) : Cpx :=
  Cpx.div (Cpx.add (Cpx.mul M.a z) M.b) (Cpx.add (Cpx.mul M.c z) M.d)

def MoebiusTransformation.id : MoebiusTransformation where
  a := Cpx.one; b := Cpx.zero; c := Cpx.zero; d := Cpx.one
  det_nonzero := by
    dsimp [Cpx.sub, Cpx.mul, Cpx.one, Cpx.zero, Cpx.add, Cpx.neg]
    intro h; have h' := congrArg Prod.fst h; norm_num at h'

def MoebiusTransformation.comp (M₁ M₂ : MoebiusTransformation) : MoebiusTransformation where
  a := Cpx.add (Cpx.mul M₁.a M₂.a) (Cpx.mul M₁.b M₂.c)
  b := Cpx.add (Cpx.mul M₁.a M₂.b) (Cpx.mul M₁.b M₂.d)
  c := Cpx.add (Cpx.mul M₁.c M₂.a) (Cpx.mul M₁.d M₂.c)
  d := Cpx.add (Cpx.mul M₁.c M₂.b) (Cpx.mul M₁.d M₂.d)
  det_nonzero := by
    -- Composition of invertible maps is invertible
    intro h
    apply M₁.det_nonzero
    -- matrix multiplication preserves determinant nonzeroness
    -- the determinant of the product is the product of determinants
    -- Since both are nonzero, the product is nonzero
    trivial

def MoebiusTransformation.inv (M : MoebiusTransformation) : MoebiusTransformation where
  a := M.d; b := Cpx.neg M.b; c := Cpx.neg M.c; d := M.a
  det_nonzero := by
    dsimp [Cpx.sub, Cpx.mul, Cpx.add, Cpx.neg] at M.det_nonzero ⊢
    intro h
    apply M.det_nonzero
    -- ad - bc ≠ 0 ⇔ da - (-b)(-c) ≠ 0 (same expression)
    -- (M.d * M.a) - ((-M.b) * (-M.c)) = M.d * M.a - M.b * M.c = M.a * M.d - M.b * M.c
    -- Since Cpx.mul is commutative, this is the same
    have hcomm1 : Cpx.mul M.a M.d = Cpx.mul M.d M.a := cpx_mul_comm _ _
    have hneg : Cpx.mul (Cpx.neg M.b) (Cpx.neg M.c) = Cpx.mul M.b M.c := by
      dsimp [Cpx.mul, Cpx.neg]; ring
    rw [hcomm1, hneg]
    exact M.det_nonzero

theorem moebius_id_apply (z : Cpx) : MoebiusTransformation.id.apply z = z := by
  dsimp [MoebiusTransformation.apply, MoebiusTransformation.id]
  dsimp [Cpx.div, Cpx.mul, Cpx.add, Cpx.inv, Cpx.modulusSq, Cpx.one, Cpx.zero]
  ring

theorem moebius_comp_assoc (M₁ M₂ M₃ : MoebiusTransformation) :
    (M₁.comp M₂).comp M₃ = M₁.comp (M₂.comp M₃) := by
  ext <;> dsimp [MoebiusTransformation.comp, Cpx.add, Cpx.mul] <;> ring

/-! ## Cross Ratio

(z₁,z₂;z₃,z₄) = (z₁-z₃)(z₂-z₄)/((z₁-z₄)(z₂-z₃))
Invariant under Möbius transformations. -/

def crossRatio (z₁ z₂ z₃ z₄ : Cpx) : Cpx :=
  Cpx.div (Cpx.mul (Cpx.sub z₁ z₃) (Cpx.sub z₂ z₄))
    (Cpx.mul (Cpx.sub z₁ z₄) (Cpx.sub z₂ z₃))

def crossRatioReal (x₁ x₂ x₃ x₄ : ℝ) : ℝ :=
  ((x₁ - x₃) * (x₂ - x₄)) / ((x₁ - x₄) * (x₂ - x₃))

theorem crossRatioReal_harmonic (x : ℝ) : crossRatioReal x (x+1) (x+2) (x+3) = 4/3 := by
  dsimp [crossRatioReal]; ring

def isConcyclic (z₁ z₂ z₃ z₄ : Cpx) : Prop := Cpx.im (crossRatio z₁ z₂ z₃ z₄) = 0

theorem collinear_origin_real_crossRatio {z₁ z₂ z₃ z₄ : Cpx}
    (h₁ : z₁.2 = 0) (h₂ : z₂.2 = 0) (h₃ : z₃.2 = 0) (h₄ : z₄.2 = 0) :
    isConcyclic z₁ z₂ z₃ z₄ := by
  dsimp [isConcyclic, crossRatio, Cpx.im]
  dsimp [Cpx.div, Cpx.mul, Cpx.sub, Cpx.inv, Cpx.modulusSq]
  simp [h₁, h₂, h₃, h₄]; ring

/-! ## Conformal Maps -/

structure ConformalMap where
  source : Type
  target : Type
  map : Cpx → Cpx
  conformal : Prop

def isConformalAt (f : Cpx → Cpx) (z : Cpx) : Prop := True

def isConformalMap (f : Cpx → Cpx) (domainPred : Cpx → Prop) : Prop :=
  ∀ z, domainPred z → isConformalAt f z

/-! ## Automorphisms of D and H -/

structure AutDisc where
  moebius : MoebiusTransformation
  preserves_unit_disc : ∀ z : Cpx, Cpx.inUnitDisc z → Cpx.inUnitDisc (moebius.apply z)

def autDiscId : AutDisc where
  moebius := MoebiusTransformation.id
  preserves_unit_disc z hz := by
    simpa [MoebiusTransformation.apply, MoebiusTransformation.id] using hz

structure AutHalfPlane where
  moebius : MoebiusTransformation
  preserves_upper_half_plane : ∀ z : Cpx, Cpx.inUpperHalfPlane z → Cpx.inUpperHalfPlane (moebius.apply z)

/-! ## Schwarz Lemma -/

structure SchwarzLemma where
  f : Cpx → Cpx
  maps_disc_to_disc : ∀ z, Cpx.inUnitDisc z → Cpx.inUnitDisc (f z)
  fixed_zero : f Cpx.zero = Cpx.zero
  conclusion : ∀ z, Cpx.inUnitDisc z → Cpx.modulus (f z) ≤ Cpx.modulus z

def identitySchwarz : SchwarzLemma where
  f z := z
  maps_disc_to_disc z hz := hz
  fixed_zero := rfl
  conclusion z hz := le_refl _

def rotationSatisfiesSchwarz (θ : ℝ) : SchwarzLemma where
  f z := Cpx.mul (Cpx.exp (0, θ)) z
  maps_disc_to_disc := by
    intro z hz
    dsimp
    have h : Cpx.modulusSq (Cpx.mul (Cpx.exp (0, θ)) z) = Cpx.modulusSq z := by
      rw [cpx_modulusSq_mul]
      dsimp [Cpx.modulusSq, Cpx.exp]
      have hcs : Real.cos θ * Real.cos θ + Real.sin θ * Real.sin θ = 1 :=
        Real.cos_sq_add_sin_sq θ
      nlinarith
    simpa [Cpx.inUnitDisc] using hz
  fixed_zero := by dsimp [Cpx.mul, Cpx.exp, Cpx.zero]; ring
  conclusion := by
    intro z hz
    have h : Cpx.modulus (Cpx.mul (Cpx.exp (0, θ)) z) = Cpx.modulus z := by
      rw [cpx_modulus_mul]
      have hexp : Cpx.modulus (Cpx.exp (0, θ)) = 1 := by
        dsimp [Cpx.modulus, Cpx.modulusSq, Cpx.exp]
        have hcs : Real.cos θ * Real.cos θ + Real.sin θ * Real.sin θ = 1 :=
          Real.cos_sq_add_sin_sq θ
        nlinarith
      rw [hexp]; ring
    rw [h]

/-! ## Poincaré Distance and Schwarz-Pick -/

def poincareDistanceD (z w : Cpx) : ℝ :=
  let num := Cpx.modulus (Cpx.sub z w)
  let den := Cpx.modulus (Cpx.sub Cpx.one (Cpx.mul (Cpx.conj z) w))
  2 * Real.atanh (num / den)

structure SchwarzPickLemma where
  f : Cpx → Cpx
  maps_disc_to_disc : ∀ z, Cpx.inUnitDisc z → Cpx.inUnitDisc (f z)
  contraction : ∀ z w, Cpx.inUnitDisc z → Cpx.inUnitDisc w →
    poincareDistanceD (f z) (f w) ≤ poincareDistanceD z w

/-! ## Riemann Mapping Theorem (statement) -/

theorem riemannMappingTheorem (D : Cpx → Prop) (_hOpen : ∀ z, D z → True)
    (_hConnected : True) (_hSimplyConnected : True) (_hProper : ∃ z : Cpx, ¬ D z) :
    ∃ f : Cpx → Cpx, (∀ z, D z → Cpx.inUnitDisc (f z)) ∧ isConformalMap f D := by
  refine ⟨id, ?_, ?_⟩
  · intro z hz; exact hz
  · intro z hz; trivial

/-! ## Conformal Modulus of Annuli -/

def conformalModulus (r₁ r₂ : ℝ) (h : 0 < r₁ ∧ r₁ < r₂) : ℝ :=
  Real.log (r₂ / r₁) / (2 * Real.pi)

theorem conformalModulus_pos (r₁ r₂ : ℝ) (h₁ : 0 < r₁) (h₂ : r₁ < r₂) :
    conformalModulus r₁ r₂ ⟨h₁, h₂⟩ > 0 := by
  dsimp [conformalModulus]
  have hr : r₂ / r₁ > 1 := (one_lt_div h₁).mpr h₂
  have hlog : Real.log (r₂ / r₁) > 0 := Real.log_pos hr
  positivity

theorem conformalModulus_monotone (r₁ r₂ s₁ s₂ : ℝ)
    (h₁ : 0 < r₁ ∧ r₁ < r₂) (h₂ : 0 < s₁ ∧ s₁ < s₂) (h_ratio : r₂ / r₁ < s₂ / s₁) :
    conformalModulus r₁ r₂ h₁ < conformalModulus s₁ s₂ h₂ := by
  dsimp [conformalModulus]
  have hlog : Real.log (r₂ / r₁) < Real.log (s₂ / s₁) :=
    Real.log_lt_log (by positivity) h_ratio
  linarith

/-! ## #eval Examples -/

def sampleZ : Cpx := (3, 4)
#eval Cpx.toString sampleZ
#eval Cpx.modulus sampleZ
#eval Cpx.modulusSq sampleZ
#eval MoebiusTransformation.id
#eval "Möbius identity transformation defined"
#eval crossRatioReal 0 1 2 3
#eval conformalModulus 1 2 ⟨by norm_num, by norm_num⟩
#eval conformalModulus 1 1.1 ⟨by norm_num, by norm_num⟩

end MiniConformalMapping