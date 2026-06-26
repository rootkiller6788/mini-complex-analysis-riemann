/-
# MiniHolomorphicFunctions.Properties.Invariants

Order of zeros and poles, winding number, residue,
and degree of rational functions.
-/

import MiniHolomorphicFunctions.Core.Laws
import MiniObjectKernel

open MiniObjectKernel

namespace MiniHolomorphicFunctions

/-! ## Order of Zero -/

/-- The order/multiplicity of a zero of a holomorphic function at a point. -/
def orderOfZero (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? : Nat :=
  0  -- placeholder: the smallest n such that f‚ÅΩ‚Åø‚Å?z‚ÇÄ) ‚â?0

/-- f has a zero of order n at z‚ÇÄ. -/
structure ZeroOfOrder (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? (n : Nat) where
  isZero : f z‚ÇÄ = { real := 0, imag := 0 }
  firstNonzeroDerivative : Prop  -- f‚ÅΩ·µè‚Å?z‚ÇÄ) = 0 for k < n, f‚ÅΩ‚Åø‚Å?z‚ÇÄ) ‚â?0

/-! ## Order of Pole -/

/-- The order of a pole of a meromorphic function at a point. -/
def orderOfPole (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? : Nat :=
  0  -- placeholder: the smallest n such that (z-z‚ÇÄ)^n f(z) has a removable singularity

/-- f has a pole of order n at z‚ÇÄ. -/
structure PoleOfOrder (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? (n : Nat) where
  h : Prop  -- (z-z‚ÇÄ)^n f(z) is holomorphic and nonzero at z‚ÇÄ

/-! ## Winding Number / Index -/

/-- The winding number of a closed curve Œ≥ around a point a. -/
def windingNumber (Œ≥ : ‚Ñ?‚Ü?‚Ñ? (a : ‚Ñ? : ‚Ñ?:=
  0  -- placeholder: (1/2œÄi) ‚àÆ_Œ≥ dz/(z-a)

/-- The index of Œ≥ with respect to a = winding number. -/
def index (Œ≥ : ‚Ñ?‚Ü?‚Ñ? (a : ‚Ñ? : ‚Ñ?:= windingNumber Œ≥ a

/-- Winding number properties. -/
def windingNumberProperties : Axiom :=
  Axiom.mk "windingNumberProperties" (Formula.pred 0 [])
    "Winding number is integer-valued, constant on components of ‚ÑÇ\\Œ≥, additive under concatenation"

/-! ## Residue -/

/-- The residue of f at an isolated singularity z‚ÇÄ. -/
def residue (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? : ‚Ñ?:=
  { real := 0, imag := 0 }  -- placeholder: coefficient a_{-1} in Laurent expansion

/-- Residue at a simple pole: Res(f, z‚ÇÄ) = lim_{z‚Üíz‚ÇÄ} (z-z‚ÇÄ)f(z). -/
def residueAtSimplePole (f : ‚Ñ?‚Ü?‚Ñ? (z‚ÇÄ : ‚Ñ? : ‚Ñ?:=
  { real := 0, imag := 0 }

/-! ## Degree of Rational Function -/

/-- The degree of a rational function R(z) = P(z)/Q(z) is max(deg P, deg Q). -/
def degree (numeratorDeg : Nat) (denominatorDeg : Nat) : Nat :=
  Nat.max numeratorDeg denominatorDeg

/-- A rational function has degree equal to the number of poles (counted with multiplicity). -/
def degreeFormula : Axiom :=
  Axiom.mk "degreeFormula" (Formula.pred 0 [])
    "For a rational function R, deg(R) = #poles(R) (counted with multiplicity) = #zeros(R)"

/-! ## #eval Tests -/

#eval s!"orderOfZero of z^3 at 0: placeholder 0 (real: 3)"
#eval s!"windingNumber: placeholder 0"
#eval s!"degree(2,1) = max(2,1) = {degree 2 1}"

end MiniHolomorphicFunctions
