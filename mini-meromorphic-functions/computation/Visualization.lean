import MiniMeromorphicFunctions
import MiniMeromorphicFunctions.Computation.Basic

/-!
  # Visualization Utilities

  Utilities for visualizing meromorphic functions: domain coloring data,
  phase plots, modulus plots, and pole/zero location charts.
-/

namespace MiniMeromorphicFunctions

/-! ## Domain Coloring Data -/

/-- HSL color representation for domain coloring. -/
structure HSLColor where
  hue : ℝ        -- 0 to 360
  saturation : ℝ -- 0 to 1
  lightness : ℝ  -- 0 to 1

/-- Convert complex value to HSL for domain coloring:
    hue = arg(f(z)), lightness = |f(z)| (wrapped). -/
def complexToHSL (w : ℂ) : HSLColor where
  hue := (Complex.arg w * 180 / π + 360) % 360
  saturation := 0.8
  lightness := 0.5 + 0.4 * Real.atan (Complex.abs w / 10) / (π / 2)

/-! ## Phase Plot Data -/

/-- Generate phase data for f on a grid.
    Returns matrix of phase values (radians). -/
def phasePlot (f : ℂ → ℂ) (x_min x_max y_min y_max : ℝ) (nx ny : ℕ) : List (List ℝ) :=
  let grid := generateGrid x_min x_max y_min y_max nx ny
  let phases : List ℝ := grid.map λ z ↦ Complex.arg (f z)
  -- Reshape into rows
  List.range ny |>.map λ j ↦
    phases.drop (j * nx) |>.take nx

/-! ## Modulus Plot Data -/

/-- Generate modulus data for f on a grid.
    Returns matrix of log |f(z)| values for contour plotting. -/
def modulusPlot (f : ℂ → ℂ) (x_min x_max y_min y_max : ℝ) (nx ny : ℕ) : List (List ℝ) :=
  let grid := generateGrid x_min x_max y_min y_max nx ny
  let mods : List ℝ := grid.map λ z ↦ Real.log (Complex.abs (f z))
  List.range ny |>.map λ j ↦
    mods.drop (j * nx) |>.take nx

/-! ## Pole/Zero Visualization -/

/-- Locate and display zeros of f in a region. -/
def locateZeros (f : ℂ → ℂ) (x_min x_max y_min y_max : ℝ) (threshold : ℝ := 0.001) : List ℂ :=
  let grid := generateGrid x_min x_max y_min y_max 200 200
  grid.filter λ z ↦ Complex.abs (f z) < threshold

/-- Locate and display poles of f in a region. -/
def locatePoles (f : ℂ → ℂ) (x_min x_max y_min y_max : ℝ) (threshold : ℝ := 1e6) : List ℂ :=
  let grid := generateGrid x_min x_max y_min y_max 200 200
  grid.filter λ z ↦ Complex.abs (f z) > threshold

/-! ## Riemann Sphere Projection -/

/-- Stereographic projection data for visualizing f: ℂ̂ → ℂ̂.
    Project points on S² back to ℂ for visualization. -/
def stereographicProjection (x y z : ℝ) : ℂ :=
  -- Point (x,y,z) on unit sphere → point in ℂ plane
  -- (x + iy) / (1 - z) from north pole
  if z = 1 then 0 else Complex.ofReal (x / (1 - z)) + Complex.ofReal (y / (1 - z)) * I

#eval "Visualization: domain coloring, phase plot, modulus plot, pole/zero location"
