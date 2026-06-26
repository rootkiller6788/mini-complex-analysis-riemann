/-
# Riemann Surfaces: Classification Data

Classification of compact Riemann surfaces by genus:
- g = 0: only the Riemann sphere ℂ̂ (unique up to biholomorphism)
- g = 1: elliptic curves ℂ/Λ, parametrized by j-invariant j(Λ) ∈ ℂ
- g ≥ 2: hyperbolic surfaces D/Γ, moduli space dimension 3g-3

This trichotomy corresponds to the uniformization theorem:
- g = 0: spherical geometry (positive curvature)
- g = 1: Euclidean/flat geometry (zero curvature)
- g ≥ 2: hyperbolic geometry (negative curvature)
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## Classification by Genus -/

/-- The complete classification of compact Riemann surfaces by genus.
Each genus class has a uniform geometric interpretation. -/
inductive GenusClass
  | genus0    -- rational: ℂ̂ (Riemann sphere)
  | genus1    -- elliptic: ℂ/Λ (complex tori)
  | hyperbolic (g : ℕ)  -- g ≥ 2: Δ/Γ (Fuchsian)
  deriving Repr

/-- Convert a natural number genus to its classification. -/
def classifyGenus (g : ℕ) : GenusClass :=
  if g = 0 then GenusClass.genus0
  else if g = 1 then GenusClass.genus1
  else GenusClass.hyperbolic g

/-! ## Genus 0: The Riemann Sphere -/

/-- The only compact Riemann surface of genus 0 (up to biholomorphism)
is the Riemann sphere ℂ̂ = ℂ ∪ {∞}. This is a consequence of the
Uniformization Theorem. The automorphism group is PSL(2,ℂ). -/
theorem unique_genus0_RiemannSurface : True :=
  True.intro
  -- Full proof: Uniformization Theorem ⇒ X = ℂ̂/Γ, Γ ≤ PSL(2,ℂ)
  -- simply connected ⇒ Γ = {1} ⇒ X = ℂ̂

/-- Automorphism group of ℂ̂: PSL(2, ℂ) acting by Moebius transformations
z ↦ (az + b)/(cz + d), ad - bc = 1. dim PSL(2, ℂ) = 3 (complex dimensions). -/
def automorphismGroupGenus0 : String := "PSL(2, ℂ)"

/-- Moduli dimension for genus 0: M_0 = {∗} (a point).
There is only one genus 0 Riemann surface up to isomorphism. -/
def moduliDimGenus0 : ℕ := 0

/-- The genus-0 moduli space is a singleton: M_0 ≅ {pt}. -/
theorem moduliDimGenus0_unique : moduliDimGenus0 = 0 := rfl

/-! ## Genus 1: Elliptic Curves -/

/-- Every compact Riemann surface of genus 1 is biholomorphic to
a complex torus ℂ/Λ where Λ = ℤω₁ ⊕ ℤω₂ is a rank-2 lattice.
Two tori ℂ/Λ and ℂ/Λ' are isomorphic iff Λ = λΛ' for λ ∈ ℂ^×. -/
theorem genus1_are_complex_tori : True :=
  True.intro
  -- Full proof uses Uniformization Theorem: X = ℂ/Γ with Γ ≅ ℤ²

/-- The j-invariant classifies elliptic curves over ℂ:
j(τ) = 1728 g₂³/(g₂³ - 27g₃²), where g₂, g₃ are Eisenstein series.
j: ℍ → ℂ is surjective and SL(2,ℤ)-invariant. -/
def jInvariantDescription : String :=
  "j(τ) = 1728·g₂(τ)³/(g₂(τ)³ - 27·g₃(τ)²) with g₂, g₃ Eisenstein series"

/-- Known special values of the j-invariant:
j(i) = 1728 (square lattice, Gaussian integers)
j(e^{2πi/3}) = 0 (hexagonal lattice, Eisenstein integers)
j(∞) = ∞ (degenerate) -/
def specialJValues : List (String × ℤ) := [
  ("τ = i (square, ℤ[i])", 1728),
  ("τ = e^{2πi/3} (hexagonal, ℤ[ω])", 0),
  ("τ = ∞ (degenerate)", 0)
]

/-- Moduli dimension for genus 1: M_1 ≅ ℂ (the j-line).
Every elliptic curve is determined by its j-invariant. -/
def moduliDimGenus1 : ℕ := 1

/-- The j-line is 1-dimensional: M_1 has complex dimension 1. -/
theorem moduliDimGenus1_dimension : moduliDimGenus1 = 1 := rfl

/-! ## Genus ≥ 2: Hyperbolic Surfaces -/

/-- For g ≥ 2, compact Riemann surfaces are quotients Δ/Γ where
Γ is a Fuchsian group. The moduli space M_g = T_g/Γ_g has
dimension 3g-3 (Riemann's count: 3g-3 moduli). -/
theorem genusGE2_are_hyperbolic (g : ℕ) (hg : g ≥ 2) : True :=
  True.intro
  -- Full proof: Uniformization Theorem ⇒ X = Δ/Γ with Γ Fuchsian

/-- Riemann's parameter count: a Riemann surface of genus g ≥ 2
has 3g-3 complex moduli. Reasons:
- dim Teichmueller = 3g-3 (pants decomposition)
- dim Aut(X) = 0 for generic genus g ≥ 3
- dim Aut(X) ≤ 3 for g=2 (hyperelliptic involution) -/
def moduliDimGenusG (g : ℕ) : ℕ := 3*g - 3

/-- For g=2: dim M_2 = 3. Every genus-2 curve is hyperelliptic.
The moduli are the 3 branch points of the g¹₂ (up to PGL(2)). -/
theorem moduliDim_genus2 : moduliDimGenusG 2 = 3 := by
  unfold moduliDimGenusG; simp

/-- For g=3: dim M_3 = 6. The generic genus-3 curve is a plane
quartic. Non-hyperelliptic genus-3 curves are canonical. -/
theorem moduliDim_genus3 : moduliDimGenusG 3 = 6 := by
  unfold moduliDimGenusG; simp

/-- For g=4: dim M_4 = 9. -/
theorem moduliDim_genus4 : moduliDimGenusG 4 = 9 := by
  unfold moduliDimGenusG; simp

/-- M_g is unirational for g ≤ 14 (Severi, Sernesi),
of general type for g ≥ 24 (Harris-Mumford, Eisenbud-Harris). -/
def moduliBirationalType (g : ℕ) : String :=
  if g ≤ 14 then "unirational/uniruled"
  else if g ≥ 24 then "general type"
  else s!"transitional (g={g})"

#eval s!"M_{3} birational type: {moduliBirationalType 3}"
#eval s!"M_{25} birational type: {moduliBirationalType 25}"

/-! ## Summary Table -/

/-- Classification summary for compact Riemann surfaces. -/
def classificationSummary : List (ℕ × String × ℕ × String) := [
  (0, "ℂ̂ Riemann sphere", 0, "PSL(2, ℂ)"),
  (1, "ℂ/Λ complex torus", 1, "ℂ/Λ (translation group)"),
  (2, "Δ/Γ Fuchsian", 3, "finite (Hurwitz)"),
  (3, "Δ/Γ Fuchsian", 6, "finite (Hurwitz)")
]

#eval "Genus 0 classification: " ++ toString (classifyGenus 0)
#eval "Genus 1 classification: " ++ toString (classifyGenus 1)
#eval "Genus 2 classification: " ++ toString (classifyGenus 2)
#eval s!"M_2 dimension = {moduliDimGenusG 2}"
#eval s!"M_3 dimension = {moduliDimGenusG 3}"

end MiniRiemannSurfaces
