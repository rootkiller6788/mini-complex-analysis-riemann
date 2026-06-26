/-
# MiniComplexNumbers: Bridges — ToTopology

Riemann sphere ℂ̂ = ℂ∪{∞}, stereographic projection, chordal metric,
and topological properties of the extended complex plane.
-/

import MiniComplexNumbers.Core.Basic
import MiniComplexNumbers.Morphisms.Equiv

namespace MiniComplexNumbers

/-! ## Extended Complex Plane (Riemann Sphere) -/

inductive ExtendedComplex where
  | finite : ComplexNumbers → ExtendedComplex
  | infinity : ExtendedComplex
  deriving Repr, Inhabited

notation "ℂ̂" => ExtendedComplex

def ExtendedComplex.ofComplex (z : ComplexNumbers) : ExtendedComplex :=
  ExtendedComplex.finite z

/-! ## Stereographic Projection to S² -/

def riemannSphereProjection (ez : ExtendedComplex) : Float × Float × Float :=
  match ez with
  | .infinity => pointAtInfinity
  | .finite z => stereographicProject z

/-! ## Chordal Metric -/

def chordalMetric (ez ew : ExtendedComplex) : Float :=
  match ez, ew with
  | .infinity, .infinity => 0
  | .infinity, .finite w => 1 / Float.sqrt (1 + w.re*w.re + w.im*w.im)
  | .finite z, .infinity => 1 / Float.sqrt (1 + z.re*z.re + z.im*z.im)
  | .finite z, .finite w =>
    let num := 2 * complexDist z w
    let den := Float.sqrt (1 + z.re*z.re + z.im*z.im) *
               Float.sqrt (1 + w.re*w.re + w.im*w.im)
    num / den

/-! ## Basic Topological Facts -/

def riemannSphereCompact : Prop :=
  True  -- stub: ℂ̂ is compact

def riemannSphereSimplyConnected : Prop :=
  True  -- stub: ℂ̂ is simply connected

def riemannSphereGenus : Nat := 0  -- S² has genus 0

/-! ## Meromorphic Functions -/

def isMeromorphic (f : ComplexNumbers → ExtendedComplex) : Prop :=
  True  -- stub

/-! ## #eval Tests -/

#eval "── Bridges.ToTopology: Extended complex plane ──"
#eval ExtendedComplex.finite (ComplexNumbers.of 3 4)
#eval ExtendedComplex.infinity

#eval "── Bridges.ToTopology: Riemann sphere projection of 1 ──"
#eval riemannSphereProjection (ExtendedComplex.finite (ComplexNumbers.of 1 0))

#eval "── Bridges.ToTopology: Chordal metric (finite to infinity) ──"
#eval chordalMetric (ExtendedComplex.finite (ComplexNumbers.of 1 0)) ExtendedComplex.infinity

end MiniComplexNumbers
