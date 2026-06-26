/-
# Riemann Surfaces: Standard Examples

Concrete examples of Riemann surfaces:
1. ℂ̂ = Riemann sphere (genus 0) — the unique compact RS of genus 0
2. ℂ/ℤ[i] = square torus (genus 1) — complex torus with square lattice
3. y² = x³ - x (genus 1) — an elliptic curve in Weierstrass form
4. y² = x⁵ - 1 (genus 2) — a hyperelliptic curve of genus 2
5. Klein quartic x³y + y³z + z³x = 0 (genus 3) — Hurwitz surface
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## Example 1: The Riemann Sphere ℂ̂ -/

/-- The Riemann sphere ℂ̂ = ℂ ∪ {∞} is the unique compact Riemann
surface of genus 0. Its charts are:
- φ₀: ℂ̂ \\ {∞} → ℂ, φ₀(z) = z (standard chart)
- φ₁: ℂ̂ \\ {0} → ℂ, φ₁(z) = 1/z (chart at infinity)
The transition map is z ↦ 1/z, which is holomorphic on ℂ^*.

Genus = 0, Euler characteristic χ = 2. -/
def riemannSphereExample : RiemannSurface := RiemannSphere

/-- The genus of the Riemann sphere is 0. -/
def riemannSphereGenus : ℕ := 0

/-- Euler characteristic of ℂ̂: χ = 2 = 2 - 2·0. -/
def riemannSphereEuler : ℤ := eulerCharacteristic 0

#eval "ℂ̂ Riemann sphere genus = " ++ toString riemannSphereGenus
#eval "ℂ̂ Euler characteristic = " ++ toString riemannSphereEuler

/-! ## Example 2: Complex Torus ℂ/ℤ[i] -/

/-- The square torus ℂ/ℤ[i] (the Gaussian integer lattice).
Λ = ℤ·1 ⊕ ℤ·i, g₂(Λ) ≠ 0, g₃(Λ) = 0.
This is an elliptic curve with j-invariant j(i) = 1728.
Genus = 1, Euler characteristic χ = 0. -/
def squareTorus : RiemannSurface := ComplexTorus

/-- The j-invariant of the square torus is 1728.
This corresponds to τ = i in the upper half-plane. -/
def squareTorusJInvariant : ℕ := 1728

#eval "ℂ/ℤ[i] square torus genus = 1"
#eval "j(ℂ/ℤ[i]) = " ++ toString squareTorusJInvariant

/-! ## Example 3: Elliptic Curve y² = x³ - x -/

/-- The elliptic curve y² = x³ - x in Weierstrass form.
This is a genus 1 compact Riemann surface (a 1-dimensional cubic
in ℂℙ² with a single point at infinity).

Its period lattice is the square lattice ℤ[i] (j = 1728).
The curve has good reduction at all odd primes p ≡ 1 mod 4. -/
def ellipticCurveX3minusX : RiemannSurface := HyperellipticCurve

/-- The discriminant Δ = -64 for y² = x³ - x.
Non-zero discriminant ensures a smooth curve. -/
def ellipticCurveDiscriminant : ℤ := -64

/-- Number of points over finite fields:
#E(𝔽₅) = 8, #E(𝔽₁₃) = 16 (for y² = x³ - x). -/
def ellipticCurvePointsF5 : ℕ := 8

#eval "y² = x³ - x: elliptic curve (genus 1)"
#eval "Discriminant = " ++ toString ellipticCurveDiscriminant
#eval "#E(F_5) = " ++ toString ellipticCurvePointsF5

/-! ## Example 4: Hyperelliptic Curve y² = x⁵ - 1 -/

/-- The hyperelliptic curve y² = x⁵ - 1 is a genus 2 compact
Riemann surface. The polynomial x⁵ - 1 has five distinct roots
(the 5th roots of unity), so the curve is a degree-2 branched
cover of ℂ̂ ramified at the 5 roots and at ∞.
Genus = (2g+2) with g=2 → 6 branch points → g = 2. -/
def hyperellipticCurveX5minus1 : RiemannSurface := HyperellipticCurve

/-- Genus of y² = x⁵ - 1 is 2. -/
def hyperellipticGenus : ℕ := 2

/-- Number of branch points: B = 6 (5 finite + ∞). -/
def hyperellipticBranchPoints : ℕ := 6

#eval "y² = x⁵ - 1: hyperelliptic curve genus = " ++ toString hyperellipticGenus
#eval "Branch points = " ++ toString hyperellipticBranchPoints

/-! ## Example 5: Klein Quartic (Genus 3) -/

/-- The Klein quartic: x³y + y³z + z³x = 0 in ℂℙ².
This is a smooth plane quartic curve, hence genus g = (4-1)(4-2)/2 = 3.
It has automorphism group PSL(2, 7) of order 168 = 84·(3-1),
achieving the Hurwitz bound 84(g-1). -/
def kleinQuarticGenus : ℕ := 3

/-- The automorphism group of the Klein quartic is PSL(2, 7)
(also isomorphic to GL(3, 2)), the simple group of order 168. -/
def kleinQuarticAutomorphismGroupOrder : ℕ := 168

/-- The Hurwitz bound for genus 3: 84(g-1) = 84·2 = 168.
The Klein quartic achieves this bound. -/
def hurwitzBoundGenus3 : ℕ := 84 * 2

#eval "Klein quartic genus = " ++ toString kleinQuarticGenus
#eval "Aut group order = " ++ toString kleinQuarticAutomorphismGroupOrder
#eval "Hurwitz bound for g=3 = " ++ toString hurwitzBoundGenus3
#eval "Klein quartic achieves maximal symmetry: " ++
  toString (kleinQuarticAutomorphismGroupOrder == hurwitzBoundGenus3)

end MiniRiemannSurfaces
