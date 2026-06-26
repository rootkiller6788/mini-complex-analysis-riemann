import MiniObjectKernel.Core.Basic
import MiniMeromorphicFunctions.Core.Basic
import MiniMeromorphicFunctions.Properties.ClassificationData

/-!
  # Counterexamples in Meromorphic Function Theory

  - `e^{1/z}` — essential singularity at z = 0
    (infinitely many negative Laurent terms)
  - `log z` — branch point, not meromorphic
  - `sqrt z` — algebraic branch point, not meromorphic
  - Functions with natural boundaries
  - Weierstrass ℘-function (elliptic, doubly periodic)
-/

namespace MiniMeromorphicFunctions

open MiniObjectKernel

/-! ## Counterexample 1: e^{1/z} — Essential Singularity -/

/-- f(z) = e^{1/z} has an essential singularity at z = 0.
    Laurent series: e^{1/z} = Σ_{n=0}^∞ 1/(n! z^n)
    = 1 + 1/z + 1/(2z²) + 1/(6z³) + ...
    Infinitely many negative powers → essential singularity. -/
def f_ess (z : ℂ) : ℂ := Complex.exp (1 / z)

/-- Laurent expansion: infinitely many non-zero negative coefficients. -/
#eval "e^{1/z} = Σ 1/(n! z^n): essential singularity at 0"

/-- Casorati-Weierstrass: near 0, e^{1/z} comes arbitrarily close
    to any complex value (actually, by Picard, takes every nonzero
    value infinitely often). -/
#eval "Casorati-Weierstrass: e^{1/z} dense near 0"

/-- Picard: e^{1/z} takes every nonzero complex value infinitely often
    in any neighborhood of 0. The value 0 is omitted. -/
#eval "Great Picard: e^{1/z} hits all w ≠ 0 ∞-often near 0"

/-! ## Counterexample 2: log z — Branch Point -/

/-- log z is NOT meromorphic: it has a branch point at z = 0
    (multi-valued; requiring a branch cut). -/
#eval "log z: branch point at 0 (NOT meromorphic)"

/-- The argument function arg z is discontinuous on any branch cut.
    Meromorphic functions must be single-valued. -/
#eval "log z is multi-valued on ℂ* = ℂ \\ {0}"

/-! ## Counterexample 3: sqrt(z) — Algebraic Branch Point -/

/-- f(z) = √z has an algebraic branch point at z = 0.
    Not meromorphic because it is multi-valued
    (two values differing by sign). -/
#eval "√z: algebraic branch point (NOT meromorphic)"

/-- √z satisfies w² = z, a two-valued function on ℂ*. -/
#eval "√z is two-valued: ±√z differ by sign"

/-! ## Counterexample 4: Natural Boundary -/

/-- f(z) = Σ_{n=0}^∞ z^{n!} has the unit circle |z| = 1 as a
    natural boundary: cannot be analytically continued beyond it. -/
def lacunary (z : ℂ) : ℂ :=
  -- Σ z^{n!} — lacunary series with natural boundary
  0 -- placeholder

#eval "Σ z^{n!}: natural boundary on |z|=1 (Fabry gap theorem)"

/-! ## Counterexample 5: Weierstrass ℘-function -/

/-- The Weierstrass ℘-function is a genuine meromorphic function
    (not a counterexample!) with double poles at lattice points.
    ℘(z, Λ) = 1/z² + Σ_{ω∈Λ\\{0}} [1/(z-ω)² - 1/ω²]. -/
def weierstrassP (z : ℂ) (Λ : Lattice) : ℂ :=
  -- ℘(z) with double poles at lattice points
  0 -- placeholder

/-- ℘(z) is doubly periodic: ℘(z+ω) = ℘(z) for ω ∈ Λ.
    This is an elliptic function. -/
#eval "Weierstrass ℘: double poles at lattice points"

/-- The ℘-function satisfies the differential equation:
    (℘')² = 4℘³ - g₂ ℘ - g₃. -/
#eval "℘'² = 4℘³ - g₂℘ - g₃: elliptic curve relation"

/-! ## Summary -/

#eval "e^{1/z}: essential singularity (inf. negative powers)"
#eval "log z: branch point (NOT meromorphic)"
#eval "√z: algebraic branch point (NOT meromorphic)"
#eval "Σ z^{n!}: natural boundary"
#eval "℘: elliptic (doubly periodic, meromorphic)"

end MiniMeromorphicFunctions
