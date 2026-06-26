/-
# Riemann Surfaces: Preservation Properties

How properties of Riemann surfaces are preserved (or not) under
various morphisms and constructions.

Key preservation results:
- Genus is preserved under biholomorphism (Torelli theorem)
- Genus is NOT preserved under general holomorphic maps
- Period matrix transforms under the symplectic group Sp(2g, ℤ)
- Canonical bundle degree 2g-2 is preserved (since g is invariant)
- The Riemann-Hurwitz formula governs genus change under branched covers
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Morphisms.Hom
import MiniRiemannSurfaces.Morphisms.Iso

namespace MiniRiemannSurfaces

/-! ## Genus Preservation (L4)

Under a biholomorphic map, the genus is preserved. This is because
biholomorphic maps are homeomorphisms, and genus is a topological
invariant (determined by the Euler characteristic χ = 2 - 2g). -/

/-- Biholomorphic implies same Euler characteristic (since χ is
a topological invariant). Therefore same genus since
g = (2 - χ)/2 uniquely determines g. -/
theorem genus_preserved_under_biholomorphic (gX gY : ℕ)
    (hχ : eulerCharacteristic gX = eulerCharacteristic gY) : gX = gY := by
  unfold eulerCharacteristic at hχ
  push_cast at hχ
  omega

/-- If two Riemann surfaces have the same genus, their Euler
characteristics are equal. -/
theorem genus_equal_implies_euler_equal (gX gY : ℕ) (h : gX = gY) :
    eulerCharacteristic gX = eulerCharacteristic gY := by
  subst h; rfl

/-- The genus changes under a non-constant holomorphic map according
to the Riemann-Hurwitz formula. We provide a computable check. -/
def genusChangeUnderCover (gX gY : ℕ) (degree : ℕ) (ramSum : ℤ) : Bool :=
  riemannHurwitzHolds gX gY degree ramSum

/-- Unramified cover: g_X = n(g_Y - 1) + 1.
For n=2, g_Y=1: g_X = 2(0) + 1 = 1. Tori covering tori. -/
def unramifiedCoverGenus (gY : ℕ) (n : ℕ) : ℤ := (n : ℤ) * ((gY : ℤ) - 1) + 1

/-- For an unramified cover of genus 1 (torus) by degree n:
g_X = n(1-1) + 1 = 1. Always genus 1. -/
theorem unramifiedCover_genus1 (n : ℕ) : unramifiedCoverGenus 1 n = 1 := by
  unfold unramifiedCoverGenus; omega

/-- For an unramified cover of genus 0: g_X = n(-1) + 1 = 1 - n.
Only possible for n = 0 or n = 1 (since g_X ≥ 0). -/
theorem unramifiedCover_genus0 (n : ℕ) : unramifiedCoverGenus 0 n = 1 - (n : ℤ) := by
  unfold unramifiedCoverGenus; omega

/-- For genus ≥ 2: g_X - 1 = n(g_Y - 1).
If n ≥ 2, then g_X grows roughly as n·g_Y. -/
theorem unramifiedCover_genusGE2 (gY n : ℕ) (hgY : gY ≥ 2) :
    unramifiedCoverGenus gY n ≥ gY := by
  unfold unramifiedCoverGenus
  have h : (gY : ℤ) - 1 ≥ 1 := by omega
  push_cast
  omega

/-! ## Period Matrix Transformation (L3, L4)

Under change of symplectic basis, the period matrix Ω transforms
by Sp(2g, ℤ). This action defines the moduli space M_g = H_g/Sp(2g,ℤ). -/

/-- The symplectic group action on the period matrix:
Ω ↦ (AΩ + B)(CΩ + D)^{-1} for (A B; C D) ∈ Sp(2g, ℤ).
This is a holomorphic action of Sp(2g, ℤ) on the Siegel upper
half-space H_g. -/
def symplecticActionFormula : String := "Ω ↦ (AΩ + B)(CΩ + D)^{-1}, (A B; C D) ∈ Sp(2g, ℤ)"

/-- The moduli space M_g as an orbifold quotient:
M_g = H_g / Sp(2g, ℤ). For g=1, this gives the j-line
H₁/SL(2,ℤ) ≅ ℂ. -/
def moduliAsQuotient (g : ℕ) : String :=
  s!"H_{g} / Sp(2{g}, ℤ)"

/-- For g=1: H₁ = upper half-plane ℍ, Sp(2,ℤ) = SL(2,ℤ).
The quotient M₁ = ℍ/SL(2,ℤ) ≅ ℂ (the j-line). -/
def moduliAsQuotientGenus1 : String := "ℍ / SL(2, ℤ) ≅ ℂ (j-line)"

/-- For g≥2: the quotient H_g/Sp(2g,ℤ) is an orbifold of
dimension 3g-3 (the moduli space M_g). -/
def moduliAsQuotientGenusGE2 (g : ℕ) : String :=
  s!"H_{g} / Sp(2{g}, ℤ) — complex orbifold of dimension {3*g-3}"

#eval "═══ Moduli as Quotients ═══"
#eval s!"g=1: {moduliAsQuotientGenus1}"
#eval s!"g=2: {moduliAsQuotientGenusGE2 2}"
#eval s!"g=3: {moduliAsQuotientGenusGE2 3}"

/-! ## Canonical Bundle Preservation (L4)

The canonical bundle degree deg(K_X) = 2g - 2 depends only on
the genus. Since genus is preserved under biholomorphism,
deg(K_X) is also preserved. -/

/-- If two surfaces have the same genus, their canonical bundles
have the same degree. -/
theorem canonicalDegree_preserved_by_genus (gX gY : ℕ) (h : gX = gY) :
    canonicalBundleDegree gX = canonicalBundleDegree gY := by
  subst h; rfl

/-- The dimension of holomorphic 1-forms is preserved because
it equals the genus: dim H⁰(X, K_X) = g. -/
theorem holomorphicFormsDim_preserved_by_genus (gX gY : ℕ) (h : gX = gY) :
    holomorphicOneFormsDimension gX = holomorphicOneFormsDimension gY := by
  subst h; rfl

/-- Explicit computation: for a genus 2 surface, the canonical
bundle degree is 2. -/
theorem canonicalDegree_genus2 : canonicalBundleDegree 2 = 2 := by
  unfold canonicalBundleDegree; simp

/-- Explicit computation: for a genus 3 surface, there are 3
holomorphic 1-forms. -/
theorem holomorphicFormsDim_genus3 : holomorphicOneFormsDimension 3 = 3 := by
  unfold holomorphicOneFormsDimension; rfl

/-! ## `#eval` Tests (L6) -/

#eval "═══ Preservation Properties ═══"
#eval s!"Unramified degree-2 of genus 1: g_X = {unramifiedCoverGenus 1 2}"
#eval s!"Unramified degree-3 of genus 0: g_X = {unramifiedCoverGenus 0 3} (impossible → negative)"
#eval s!"Unramified degree-2 of genus 2: g_X = {unramifiedCoverGenus 2 2}"
#eval s!"Canonical deg g=2: {canonicalDegree_genus2}"
#eval s!"Holomorphic forms g=3: {holomorphicFormsDim_genus3}"
#eval s!"Genus preserved check: g=2 vs g=2 → {genus_preserved_under_biholomorphic 2 2 (by rfl : eulerCharacteristic 2 = eulerCharacteristic 2)}"

end MiniRiemannSurfaces
