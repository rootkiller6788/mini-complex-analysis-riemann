/-
# MiniHolomorphicFunctions.Morphisms.Equiv

Conformal equivalence of domains and classification
of simply connected domains.
-/

import MiniHolomorphicFunctions.Morphisms.Iso
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Conformal Equivalence of Domains -/

/-- Two domains are conformally equivalent if there exists a biholomorphic map between them. -/
structure ConformallyEquivalent (U V : Set ‚Ñ? where
  equivalence : BiholomorphicEquivalence U V
  isConformalEquivalence : ConformalEquivalence U V

/-! ## Classification of Simply Connected Domains -/

/-- Theorem: Every simply connected domain in ‚Ñ?is conformally equivalent
    to either the unit disc ùîª or the whole plane ‚Ñ? -/
def riemannMappingClassification : Axiom :=
  Axiom.mk "riemannMappingClassification" (Formula.pred 0 [])
    "Every simply connected domain D ‚ä?‚Ñ?is conformally equivalent to the unit disc ùîª. If D = ‚Ñ? only equivalent to ‚Ñ?"

/-- The unit disc as the universal model for simply connected domains ‚â?‚Ñ? -/
structure UnitDiscModel where
  disc : Set ‚Ñ?:= {z | ComplexNumbers.modulus z < 1}
  isSimplyConnected : Prop
  isBounded : Prop

/-- The complex plane as the other equivalence class. -/
structure ComplexPlaneModel where
  plane : Set ‚Ñ?:= Set.univ
  isSimplyConnected : Prop
  isUnbounded : Prop

/-- Classification: simply connected domains fall into exactly two
    conformal equivalence classes. -/
def simplyConnectedClassification : Axiom :=
  Axiom.mk "simplyConnectedClassification" (Formula.pred 0 [])
    "There are exactly two conformal equivalence classes of simply connected domains in ‚Ñ? {‚ÑÇÃÇ\{‚àû}} ‚â?‚Ñ?and {domains ‚â?‚ÑÇ} ‚â?ùîª"

/-- The Riemann sphere ‚ÑÇÃ?= ‚Ñ?‚à?{‚àû} is conformally equivalent to S¬≤. -/
def riemannSphereModel : Axiom :=
  Axiom.mk "riemannSphereModel" (Formula.pred 0 [])
    "‚ÑÇÃ?‚â?S¬≤ via stereographic projection"

/-! ## The Group of Conformal Automorphisms -/

/-- The group of all conformal automorphisms of a domain. -/
structure ConformalAutomorphismGroup (U : Set ‚Ñ? where
  group : List (ConformalMap U U)
  hasGroupStructure : Prop
  isTransitive : Prop  -- acts transitively on U

/-! ## #eval Tests -/

#eval "Morphisms.Equiv: ConformallyEquivalent, riemannMappingClassification"
#eval "Morphisms.Equiv: simplyConnectedClassification, riemannSphereModel"
#eval "Morphisms.Equiv: ConformalAutomorphismGroup"

end MiniHolomorphicFunctions
