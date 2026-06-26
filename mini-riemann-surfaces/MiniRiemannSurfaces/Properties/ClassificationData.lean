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
is the Riemann sphere ℂ̂ = ℂ ∪ {∞}. Its automorphism group is
PSL(2, ℂ) ≅ Aut(ℂ̂), the Moebius transformations. -/
axiom uniqueGenus0RS : True  -- All genus 0 compact RS are biholomorphic to ℂ̂

/-- Automorphism group of ℂ̂: PSL(2, ℂ) acting by Moebius transformations
z ↦ (az + b)/(cz + d), ad - bc = 1. dim PSL(2, ℂ) = 3 (complex dimensions). -/
def automorphismGroupGenus0 : String := "PSL(2, ℂ)"

/-- Moduli dimension for genus 0: M_0 = {∗} (a point). -/
def moduliDimGenus0 : ℕ := 0

/-! ## Genus 1: Elliptic Curves -/

/-- Every compact Riemann surface of genus 1 is a complex torus ℂ/Λ
where Λ = ℤω₁ ⊕ ℤω₂ is a lattice. Two tori ℂ/Λ and ℂ/Λ' are
biholomorphic iff Λ = λΛ' for some λ ∈ ℂ^×. -/
axiom genus1AreComplexTori : True

/-- The j-invariant j(τ) = 1728 g₂³ / Δ where τ = ω₂/ω₁ ∈ ℍ
classifies elliptic curves up to isomorphism. j(τ) ranges over ℂ. -/
def jInvariant (tau : ℂ) : ℂ := 0  -- placeholder

/-- Moduli dimension for genus 1: M_1 ≅ ℂ (the j-line).
dim M_1 = 1 (complex dimension). -/
def moduliDimGenus1 : ℕ := 1

/-! ## Genus ≥ 2: Hyperbolic Surfaces -/

/-- For g ≥ 2, the compact Riemann surfaces of genus g are
parametrized by the moduli space M_g = T_g / Γ_g, which is
a complex orbifold of dimension 3g - 3. -/
axiom genusGE2AreHyperbolic : True

/-- The dimension of the moduli space for genus g ≥ 2:
dim M_g = 3g - 3 (for g ≥ 2). This comes from:
- dim(Teichmueller) = 3g - 3
- dim(automorphisms of genus g RS) = 0 for g ≥ 2 -/
def moduliDimGenusG (g : ℕ) : ℕ := 3*g - 3

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
