/-
# MiniHolomorphicFunctions.Properties.ClassificationData

Classification of isolated singularities:
Riemann removable singularity, Casorati-Weierstrass,
Picard theorems.
-/

import MiniHolomorphicFunctions.Properties.Preservation
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Classification of Isolated Singularities -/

/-- Classification theorem: every isolated singularity is removable, a pole, or essential. -/
def singularityClassification : Axiom :=
  Axiom.mk "singularityClassification" (Formula.pred 0 [])
    "Every isolated singularity is exactly one of: removable, pole (of some order n âˆ?â„?, or essential"

/-- Removable singularity characterization: f is bounded near zâ‚€. -/
def removableSingularityCharacterization : Axiom :=
  Axiom.mk "removableSingularityCharacterization" (Formula.pred 0 [])
    "An isolated singularity at zâ‚€ is removable iff f is bounded in a punctured neighborhood of zâ‚€"

/-- Pole characterization: |f(z)| â†?âˆ?as z â†?zâ‚€. -/
def poleCharacterization : Axiom :=
  Axiom.mk "poleCharacterization" (Formula.pred 0 [])
    "An isolated singularity at zâ‚€ is a pole iff lim_{zâ†’zâ‚€} |f(z)| = âˆ?

/-- Essential singularity characterization (by exclusion). -/
def essentialSingularityCharacterization : Axiom :=
  Axiom.mk "essentialSingularityCharacterization" (Formula.pred 0 [])
    "An isolated singularity is essential iff it is neither removable nor a pole"

/-! ## Riemann Removable Singularity Theorem -/

/-- Riemann's removable singularity theorem. -/
def riemannRemovableSingularityTheorem : Axiom :=
  Axiom.mk "riemannRemovableSingularity" (Formula.pred 0 [])
    "If f is holomorphic on a punctured disk and bounded, the singularity at the center is removable"

/-- Corollary: a bounded entire function is constant (Liouville). -/
def liouvilleFromRiemannRemovable : Axiom :=
  Axiom.mk "liouvilleFromRiemannRemovable" (Formula.pred 0 [])
    "Liouville's theorem follows from Riemann's removable singularity theorem applied to f(1/z) at 0"

/-! ## Casorati-Weierstrass Theorem -/

/-- Casorati-Weierstrass: near an essential singularity, the image is dense in â„? -/
def casoratiWeierstrassTheorem : Axiom :=
  Axiom.mk "casoratiWeierstrass" (Formula.pred 0 [])
    "If f has an essential singularity at zâ‚€, then for any punctured neighborhood U of zâ‚€, f(U) is dense in â„?

/-- Consequence: exp(1/z) has an essential singularity at 0, with dense image in â„‚\{0}. -/
def expOneOverzEssentialSingularity : Axiom :=
  Axiom.mk "expOneOverzEssentialSingularity" (Formula.pred 0 [])
    "f(z) = exp(1/z) has an essential singularity at 0; its image in any punctured neighborhood of 0 is â„‚\{0}"

/-! ## Picard Theorems -/

/-- Little Picard: a non-constant entire function misses at most one value. -/
def picardLittleTheorem : Axiom :=
  Axiom.mk "picardLittleTheorem" (Formula.pred 0 [])
    "If f is a non-constant entire function, then f(â„? is either â„?or â„‚\{a} for a single omitted value a"

/-- Great Picard: near an essential singularity, f attains every value (except one) infinitely often. -/
def picardGreatTheorem : Axiom :=
  Axiom.mk "picardGreatTheorem" (Formula.pred 0 [])
    "In any punctured neighborhood of an essential singularity, f attains every complex value infinitely often with at most one exception"

/-- Example: e^z omits only 0, confirming Picard's little theorem. -/
def exponentialExamplePicard : Axiom :=
  Axiom.mk "exponentialExamplePicard" (Formula.pred 0 [])
    "The exponential function e^z is entire and omits only the value 0"

/-! ## Classification Axiom System -/

def singularityClassificationAxioms : AxiomSystem :=
  AxiomSystem.empty.addAxioms #[
    singularityClassification,
    removableSingularityCharacterization,
    poleCharacterization,
    essentialSingularityCharacterization,
    riemannRemovableSingularityTheorem,
    casoratiWeierstrassTheorem,
    picardLittleTheorem,
    picardGreatTheorem
  ]

/-! ## #eval Tests -/

#eval "Properties.ClassificationData: singularity classification (removable, pole, essential)"
#eval s!"Singularity axioms: {singularityClassificationAxioms.axioms.length} (expected: 8)"
#eval "Properties.ClassificationData: Riemann, Casorati-Weierstrass, Picard (Little and Great)"

end MiniHolomorphicFunctions
