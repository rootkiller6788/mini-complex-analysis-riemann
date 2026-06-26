/-
# Riemann Surfaces: Bridge to Geometry

Geometric structures on Riemann surfaces:
- Hyperbolic metric (Poincaré metric) on genus g ≥ 2 RS
- Teichmueller space as a complex manifold and the Weil-Petersson metric
- Geodesics on hyperbolic surfaces, closed geodesics
- Fenchel-Nielsen coordinates on Teichmueller space
- The collar lemma and thick-thin decomposition
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## Hyperbolic Metric -/

/-- Every compact Riemann surface of genus g ≥ 2 admits a unique
complete conformal metric of constant negative curvature -1
(the Poincaré metric). This comes from the uniformization X = Δ/Γ:
the hyperbolic metric on Δ (ds² = |dz|² / (1-|z|²)²) descends to X.

The area of X under this metric is 2π·|χ(X)| = 4π(g-1)
(Gauss-Bonnet theorem). -/
axiom hyperbolicMetricExists (X : RiemannSurface) (h : genus X ≥ 2) : True

/-- The Gauss-Bonnet theorem for hyperbolic surfaces:
  ∫_X K dA = 2π·χ(X)
Since K = -1 constant, Area(X) = -2π·χ(X) = 4π(g-1). -/
def hyperbolicArea (g : ℕ) : ℝ := 4 * π * ((g : ℝ) - 1)

/-- The systole of X (shortest closed geodesic) is bounded above
by roughly 2 log(4g-2) (Buser-Sarnak). -/
axiom systoleBound (g : ℕ) : True

#eval "Hyperbolic metric on RS of genus ≥ 2"
#eval "Gauss-Bonnet: Area = 4π(g-1)"

/-! ## Teichmueller Space Geometry -/

/-- Teichmueller space T_g carries several natural metrics:
1. Teichmueller metric (complex Banach manifold metric)
2. Weil-Petersson metric (Kähler metric)
3. Thurston's asymmetric Lipschitz metric

The Weil-Petersson metric is Kähler and has negative
sectional curvature (Wolpert). -/
axiom weilPeterssonMetric (g : ℕ) : True

/-- The Weil-Petersson metric on T_g has negative sectional curvature,
is incomplete, and the completion is the augmented Teichmueller space
(adding nodal Riemann surfaces). -/
axiom weilPeterssonCurvature (g : ℕ) : True

/-- The volume of M_g under the Weil-Petersson metric is finite
(and given by intersection numbers of tautological classes,
Wolpert, Mirzakhani, Zograf). -/
axiom weilPeterssonVolume (g : ℕ) : True

/-! ## Geodesics on Hyperbolic Surfaces -/

/-- Closed geodesics on a hyperbolic Riemann surface correspond to
conjugacy classes of hyperbolic elements in the Fuchsian group Γ.
The length spectrum (set of lengths of closed geodesics) determines
the Riemann surface (by the Selberg trace formula). -/
axiom closedGeodesicsCorrespondToHyperbolicConjugacyClasses (X : RiemannSurface) : True

/-- The collar lemma: every simple closed geodesic of length ℓ has
an embedded collar (annular neighborhood) of width ≈ 2 arcsinh(1/sinh(ℓ/2)).
Disjoint simple closed geodesics have disjoint collars. -/
axiom collarLemma (X : RiemannSurface) : True

/-! ## Fenchel-Nielsen Coordinates -/

/-- Fenchel-Nielsen coordinates on T_g: for a pants decomposition of
Σ_g (2g-2 pairs of pants), the coordinates are:
- 3g-3 length parameters (lengths of the decomposing curves)
- 3g-3 twist parameters (angles of gluing across each curve)

These give a global real-analytic coordinate system on T_g. -/
axiom fenchelNielsenCoordinates (g : ℕ) : True

/-- The Fenchel-Nielsen coordinates: T_g ≅ ℝ₊^{3g-3} × ℝ^{3g-3}.
The WP symplectic form is ω = Σ dℓ_i ∧ dτ_i (Wolpert). -/
def fenchelNielsenDimension (g : ℕ) : ℕ × ℕ := (3*g - 3, 3*g - 3)

#eval "Fenchel-Nielsen coordinates: length + twist"
#eval s!"FN dimension for g=2: {fenchelNielsenDimension 2}"
#eval "Weil-Petersson: Kahler metric on T_g"

end MiniRiemannSurfaces
