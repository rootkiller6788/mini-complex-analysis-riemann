/-
# Step-by-Step Examples — MiniConformalMapping

Building conformal maps, Möbius transformations, and exploring
the conformal mapping framework.
-/

import MiniConformalMapping

open MiniConformalMapping

#eval "══ BUILDING CONFORMAL MAPS: FROM OBJECTS TO CLASSIFICATION ══"

/-! ### Step 1: Define a complex plane domain -/
#eval describe (⟨⟩ : ComplexPlane)

/-! ### Step 2: Create a Möbius transformation -/
#eval "Möbius transformation: z ↦ (z+i)/(z-i) (Cayley map)"

/-! ### Step 3: Check conformal modulus of an annulus -/
#eval conformalModulus standardAnnulus

/-! ### Step 4: Explore conformal equivalence classes -/
#eval "Conformal equivalence types: simplyConnected, doublyConnected, ..."

/-! ### Step 5: State Riemann mapping for a proper simply connected domain -/
#eval "Every proper simply connected D ≅ unit disc D"

/-! ### Step 6: Schwarz lemma — contraction for disc self-maps fixing 0 -/
#eval "Schwarz: |f(z)| ≤ |z| for f: D → D with f(0)=0"

/-! ### Step 7: Koebe 1/4 theorem — covering radius of normalized univalent maps -/
#eval "Koebe 1/4: D(0,1/4) ⊆ f(D) for f: D → ℂ univalent, f(0)=0, f'(0)=1"

/-! ### Step 8: Schwarz-Christoffel — map H to polygon -/
#eval "SC map: H → polygon with given interior angles"

/-! ### Step 9: Explore automorphism groups -/
#eval "Aut(D) ≅ PSU(1,1), Aut(H) ≅ PSL(2,ℝ)"

/-! ### Step 10: Uniformization — classify simply connected Riemann surfaces -/
#eval "Simply connected RS ≅ D, ℂ, or ℂ̂ (= S²)"

#eval "══ CONFORMAL MAPPING EXPLORATION COMPLETE ══"
