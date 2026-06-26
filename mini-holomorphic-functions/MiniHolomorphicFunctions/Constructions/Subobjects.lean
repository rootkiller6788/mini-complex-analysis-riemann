/-
# MiniHolomorphicFunctions.Constructions.Subobjects

Spaces of holomorphic functions on a domain:
H(D), H^âˆ?D), A(D), Bergman space.
-/

import MiniHolomorphicFunctions.Core.Objects
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Holomorphic Function Spaces -/

/-- H(D): the space of all holomorphic functions on a domain D. -/
structure HD (D : Set â„? where
  functions : List (HolomorphicFunction D)
  topology : String := "compact-open topology (uniform convergence on compacta)"
  isFrÃ©chetSpace : Prop

/-- H^âˆ?D): bounded holomorphic functions on D. -/
structure HInfinity (D : Set â„? where
  functions : List (HolomorphicFunction D)
  supNorm : â„?  isBounded : âˆ€ f, f âˆ?functions â†?Prop  -- sup|f| < âˆ?  isBanachAlgebra : Prop

/-- The supremum norm on H^âˆ?D). -/
def supNorm (f : HolomorphicFunction D) : â„?:= 0  -- placeholder

/-! ## Disc Algebra -/

/-- A(D): the disc algebra â€?functions holomorphic on the unit disc
    and continuous on its closure. -/
structure DiscAlgebra where
  disc : Set â„?:= {z | ComplexNumbers.modulus z < 1}
  closure : Set â„?:= {z | ComplexNumbers.modulus z â‰?1}
  function : â„?â†?â„?  isHolomorphicOnDisc : Prop
  isContinuousOnClosure : Prop

/-- A(D) as a closed subalgebra of C(âˆ‚ð”?. -/
def discAlgebraAsClosedSubalgebra : Axiom :=
  Axiom.mk "discAlgebraAsClosedSubalgebra" (Formula.pred 0 [])
    "A(ð”») is a closed subalgebra of C(ð•‹) via the boundary values of holomorphic functions"

/-! ## Bergman Space -/

/-- Bergman space AÂ²(D): holomorphic functions square-integrable w.r.t. area measure. -/
structure BergmanSpace (D : Set â„? where
  functions : List (HolomorphicFunction D)
  areaMeasure : â„?â†?â„?  isL2 : Prop  -- âˆ«_D |f|Â² dA < âˆ?  bergmanKernel : â„?â†?â„?â†?â„?
/-- The Bergman kernel K_D(z,w) is the reproducing kernel for AÂ²(D). -/
def bergmanKernel : Axiom :=
  Axiom.mk "bergmanKernel" (Formula.pred 0 [])
    "K_D: DÃ—D â†?â„?is the reproducing kernel for the Bergman space AÂ²(D)"

/-- Bergman metric from the Bergman kernel: dsÂ² = âˆ‚âˆ‚Ì„ log K(z,z). -/
def bergmanMetric : Axiom :=
  Axiom.mk "bergmanMetric" (Formula.pred 0 [])
    "The Bergman metric dsÂ² = âˆ‚Â²log K(z,z)/âˆ‚zâˆ‚zÌ„ dzâŠ—dzÌ„ is a KÃ¤hler metric on D"

/-! ## #eval Tests -/

#eval "Constructions.Subobjects: HD, HInfinity, supNorm, DiscAlgebra"
#eval "Constructions.Subobjects: BergmanSpace, bergmanKernel, bergmanMetric"

end MiniHolomorphicFunctions
