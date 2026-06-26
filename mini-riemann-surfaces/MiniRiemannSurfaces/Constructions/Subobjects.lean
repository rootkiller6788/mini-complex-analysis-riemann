/-
# Riemann Surfaces: Subobjects

Subobjects of Riemann surfaces: open Riemann surfaces, compact
Riemann surfaces, and algebraic curves as a special class of
compact Riemann surfaces.

Every compact Riemann surface is algebraic (Riemann existence theorem),
meaning it can be realized as the zero set of polynomial equations
in projective space. This connects the complex-analytic and algebraic
approaches.
-/

import MiniRiemannSurfaces.Core.Basic

namespace MiniRiemannSurfaces

/-! ## Sub-Riemann Surfaces -/

/-- A sub-Riemann surface S ⊆ X is a domain (connected open subset)
of X. It inherits the complex structure by restriction of charts. -/
structure SubRiemannSurface (X : RiemannSurface) where
  carrier : X.carrier → Prop
  connected : True    -- placeholder: S is connected
  open : True         -- placeholder: S is open
  deriving Repr

/-- An open Riemann surface: every point has a neighborhood
biholomorphic to an open set in ℂ. Open RS are non-compact. -/
structure OpenRS where
  toRS : RiemannSurface
  isOpen : True       -- placeholder: non-compact
  deriving Repr

/-- A compact Riemann surface is a Riemann surface whose underlying
topological space is compact. Every compact RS is algebraic. -/
structure CompactRS where
  toRS : RiemannSurface
  compact : True      -- placeholder: underlying space is compact
  deriving Repr

/-! ## Inclusion Maps -/

/-- The inclusion map i: S ↪ X of a sub-Riemann surface.
This is a holomorphic embedding. -/
structure SubRSInclusion (S : SubRiemannSurface X) where
  inclusion : Unit → X.carrier  -- placeholder
  holomorphic : True
  injective : True
  deriving Repr

/-! ## Algebraic Curves -/

/-- An algebraic curve is a compact Riemann surface that can be
realized as the zero set of a homogeneous polynomial F(X,Y,Z) = 0
in ℂℙ². By the Riemann existence theorem, every compact Riemann
surface is an algebraic curve. -/
structure AlgebraicCurve where
  toRS : RiemannSurface
  definingPolynomial : String       -- F(X,Y,Z)
  degree : ℕ
  genus_formula : String := "(d-1)(d-2)/2"   -- for smooth plane curve of degree d
  deriving Repr

/-- The genus of a smooth plane algebraic curve of degree d is
g = (d-1)(d-2)/2. This follows from the adjunction formula. -/
def planeCurveGenus (d : ℕ) : ℕ := (d-1)*(d-2)/2

/-! ## Modular Curves as Subobjects -/

/-- Modular curves arise as compactifications of quotients ℍ/Γ
and are algebraic curves (over ℚ) with rich arithmetic structure. -/
structure ModularCurve (N : ℕ) where
  level : ℕ := N
  toAlgebraicCurve : AlgebraicCurve
  fieldOfDefinition : String := "ℚ"
  deriving Repr

#eval "Genus of smooth plane quartic (d=4): " ++ toString (planeCurveGenus 4)
#eval "Genus of smooth plane quintic (d=5): " ++ toString (planeCurveGenus 5)

end MiniRiemannSurfaces
