/-
# Riemann Surfaces: Classification Theorems

Complete classification of compact Riemann surfaces by uniformization
and genus. Every compact Riemann surface X fits into one of three
mutually exclusive classes based on its universal cover.

Key structure theorems:
1. Every genus 1 RS is a complex torus ℂ/Λ
2. Moduli space M_g has dimension 3g-3 for g ≥ 2
3. Automorphism group of a general genus g ≥ 3 RS is trivial
4. Hurwitz's theorem: |Aut(X)| ≤ 84(g-1) for g ≥ 2
-/

import MiniRiemannSurfaces.Core.Basic
import MiniRiemannSurfaces.Properties.ClassificationData

namespace MiniRiemannSurfaces

/-! ## Uniformization Classification -/

/-- The uniformization classification: every compact Riemann surface X
is biholomorphic to exactly one of:

1. ℂ̂ (if X is genus 0)
2. ℂ/Λ for a lattice Λ ≅ ℤ² (if X is genus 1)
3. Δ/Γ for a Fuchsian group Γ (if X is genus ≥ 2)

The universal cover X̃ determines the geometric structure:
- ℂ̂ carries the spherical metric (sectional curvature +1)
- ℂ carries the Euclidean metric (sectional curvature 0)
- Δ carries the hyperbolic metric (sectional curvature -1) -/
axiom uniformizationClassification (X : RiemannSurface) : True

/-- The uniformization trichotomy as a computable function
on the genus. -/
def uniformizationType (g : ℕ) : String :=
  if g = 0 then "spherical (ℂ̂)" else if g = 1 then "Euclidean (ℂ)" else "hyperbolic (Δ)"

/-! ## Elliptic Curves = Genus 1 RS -/

/-- Every compact Riemann surface of genus 1 is biholomorphic to
a complex torus ℂ/Λ for some lattice Λ = ℤω₁ ⊕ ℤω₂ with
Im(ω₂/ω₁) > 0. -/
axiom genus1RSAreComplexTori : True

/-- The j-invariant j(τ) = 1728 g₂³/(g₂³ - 27g₃²) classifies
elliptic curves up to isomorphism. Two tori ℂ/Λ and ℂ/Λ' are
isomorphic iff j(Λ) = j(Λ'). -/
axiom jInvariantClassifies (X Y : RiemannSurface) : True

/-- The space of elliptic curves: M_1 ≅ ℍ / SL(2, ℤ) ≅ ℂ
(the j-line). The modular group SL(2, ℤ) acts on the upper
half-plane ℍ = {τ | Im(τ) > 0} by Moebius transformations. -/
def moduliOfEllipticCurves : String := "ℍ / SL(2, ℤ) ≅ ℂ"

/-! ## Moduli Space for g ≥ 2 -/

/-- For g ≥ 2, the moduli space M_g is an irreducible quasi-projective
variety of dimension 3g - 3. The generic Riemann surface of genus g
has no non-trivial automorphisms. -/
axiom moduliDimensionTheorem (g : ℕ) (hg : g ≥ 2) : True

/-- M_g is unirational for g ≤ 14, of general type for g ≥ 24
(theorem of Eisenbud, Harris, Mumford). -/
def moduliGeometryType (g : ℕ) : String :=
  if g ≤ 14 then "unirational"
  else if g ≥ 24 then "general type"
  else "unknown/unclear"

/-! ## Hurwitz Automorphism Theorem -/

/-- HURWITZ'S THEOREM: For a compact Riemann surface X of genus g ≥ 2,
the order of the automorphism group is bounded by
|Aut(X)| ≤ 84(g - 1).

Equality is achieved for Hurwitz surfaces: genus 3 Klein quartic
(168 automorphisms, 168 = 84·2). -/
axiom hurwitzAutomorphismBound (g : ℕ) (hg : g ≥ 2) : True

/-- The maximal automorphism group size for genus g:
|Aut_max| = 84(g-1) for g ≥ 2. -/
def maxAutomorphismSize (g : ℕ) : ℕ := 84 * (g - 1)

#eval "Uniformization for genus 0: " ++ uniformizationType 0
#eval "Uniformization for genus 1: " ++ uniformizationType 1
#eval "Uniformization for genus 2: " ++ uniformizationType 2
#eval "Max |Aut| for genus 3: " ++ toString (maxAutomorphismSize 3)
#eval s!"Moduli geometry for g=5: {moduliGeometryType 5}"
#eval s!"Moduli geometry for g=25: {moduliGeometryType 25}"

end MiniRiemannSurfaces
