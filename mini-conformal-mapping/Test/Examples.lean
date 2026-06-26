/-
# Step-by-Step Examples — MiniConformalMapping

Building conformal maps, Möbius transformations,
cross-ratios, conformal moduli, and exploring the framework.
-/

import MiniConformalMapping

open MiniConformalMapping

#eval "════ BUILDING CONFORMAL MAPS: FROM OBJECTS TO CLASSIFICATION ════"

/-! ### Step 1: Complex numbers as ℝ × ℝ -/
#eval Cpx.toString (1, 2)
#eval Cpx.modulus (3, 4)
#eval Cpx.modulusSq (3, 4)
#eval Cpx.inUnitDisc (0.5, 0)
#eval Cpx.inUnitDisc (2, 0)
#eval Cpx.inUpperHalfPlane (0, 1)
#eval Cpx.inUpperHalfPlane (0, -1)

/-! ### Step 2: Möbius transformation basics -/
#eval "Möbius: z ↦ (az+b)/(cz+d), ad-bc ≠ 0"
#eval "Identity Möbius: z ↦ z"

/-! ### Step 3: Cross-ratio of four points -/
#eval crossRatioReal 0 1 2 3
#eval crossRatioReal 1 2 3 4
#eval "Cross-ratio invariant under Möbius maps"

/-! ### Step 4: Conformal modulus of annuli -/
#eval annulusModulus standardAnnulus
#eval annulusModulus thinAnnulus
#eval annulusModulus wideAnnulus
#eval "Modulus classifies doubly connected domains"

/-! ### Step 5: Conformal isomorphism D ≅ H via Cayley map -/
#eval "Cayley: C(z) = i(1+z)/(1-z) maps D → H"
#eval "Inverse: C⁻¹(w) = (w-i)/(w+i) maps H → D"

/-! ### Step 6: Automorphism groups -/
#eval "Aut(D) ≅ {e^{iθ}(z-a)/(1-āz) : |a| < 1, θ ∈ ℝ}"
#eval "Aut(H) ≅ PSL(2,ℝ)"

/-! ### Step 7: Uniformization -/
#eval uniformizationTypeFromGenus 0
#eval uniformizationTypeFromGenus 1
#eval uniformizationTypeFromGenus 2
#eval "g=0 → sphere, g=1 → plane, g≥2 → disc"

/-! ### Step 8: Koebe 1/4 theorem and distortion bounds -/
#eval derivativeLowerBound 0.5
#eval derivativeUpperBound 0.5
#eval growthLowerBound 0.5
#eval growthUpperBound 0.5

/-! ### Step 9: Moduli space dimensions -/
#eval moduliDimension 1
#eval moduliDimension 2
#eval moduliDimension 3
#eval moduliDimension 4

/-! ### Step 10: Bridges to other mathematics -/
#eval teichmullerDimension 0
#eval teichmullerDimension 1
#eval teichmullerDimension 2
#eval "Teichmüller space dimensions"
#eval "Hyperbolic geometry: ds² = 4|dz|²/(1-|z|²)²"

#eval "════ CONFORMAL MAPPING EXPLORATION COMPLETE ════"