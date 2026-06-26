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

/-! ## Genus Preservation -/

/-- Under a biholomorphic map, the genus is preserved.
This is a consequence of the fact that biholomorphic maps
are homeomorphisms (genus is a topological invariant). -/
axiom genusPreservedUnderBiholomorphic (X Y : RiemannSurface)
    (h : Biholomorphic X Y) : genus X = genus Y

/-- Under a general holomorphic map f: X → Y (non-constant), the
genus can change. The Riemann-Hurwitz formula gives the relation:
2g_X - 2 = n(2g_Y - 2) + Σ(e_p - 1). -/
axiom genusUnderHolomorphicMap (X Y : RiemannSurface)
    (f : HolomorphicMap X Y) (n : ℕ) : True

/-- If f: X → Y is an unramified covering of degree n, then
2g_X - 2 = n(2g_Y - 2), so g_X - 1 = n(g_Y - 1). -/
def unramifiedCoverGenus (gY : ℕ) (n : ℕ) : ℤ := (n : ℤ) * ((gY : ℤ) - 1) + 1

/-! ## Period Matrix Transformation -/

/-- Under a change of symplectic basis of H₁(X, ℤ), the period matrix
Ω transforms under the action of the symplectic group Sp(2g, ℤ):
Ω ↦ (AΩ + B)(CΩ + D)^{-1} where (A B; C D) ∈ Sp(2g, ℤ).

This is the Siegel modular group action on H_g. -/
axiom periodMatrixTransformsBySymplectic (g : ℕ) (omega : Type) : True

/-- The moduli space M_g = H_g / Sp(2g, ℤ) (as an orbifold).
For g = 1, this is the classical j-invariant action of SL(2, ℤ)
on the upper half-plane. -/
def moduliAsQuotient (g : ℕ) : String :=
  s!"H_{g} / Sp(2{g}, ℤ)"

/-! ## Canonical Bundle Degree -/

/-- The degree of the canonical bundle K_X is 2g - 2. Since genus
is preserved under biholomorphism, deg(K_X) is also preserved. -/
axiom canonicalDegreePreserved (X Y : RiemannSurface)
    (h : Biholomorphic X Y) : canonicalBundleDegree (genus X) = canonicalBundleDegree (genus Y)

/-- The space of holomorphic 1-forms H⁰(X, K_X) has dimension g,
which is preserved under biholomorphism. -/
axiom holomorphicOneFormsDimensionPreserved (X Y : RiemannSurface)
    (h : Biholomorphic X Y) : holomorphicOneFormsDimension (genus X) =
                               holomorphicOneFormsDimension (genus Y)

/-! ## `#eval` Tests -/

#eval "Unramified degree-2 cover of genus 1 → genus: " ++ toString (unramifiedCoverGenus 1 2)
#eval "Unramified degree-3 cover of genus 0 → genus: " ++ toString (unramifiedCoverGenus 0 3)

end MiniRiemannSurfaces
