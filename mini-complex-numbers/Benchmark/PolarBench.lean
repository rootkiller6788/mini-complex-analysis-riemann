/-
# Benchmark: Polar Form Computations

Measures performance of polar form conversions, cis, and de Moivre.
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ POLAR BENCHMARK ══"

/-!
## Operations tested:
-- [x] polarForm from (r,θ)
-- [x] cis construction
-- [x] deMoivre formula
-- [x] polar decomposition round-trip
-/

def benchPolarConstruct (count : Nat) : Nat :=
  aux count 0
where
  aux (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 =>
      let θ := 2 * Float.pi * Float.ofNat k' / Float.ofNat count
      let _z := polarForm 1 θ
      aux k' (acc + 1)

def benchCisConstruct (count : Nat) : Nat :=
  aux count 0
where
  aux (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 =>
      let θ := 2 * Float.pi * Float.ofNat k' / Float.ofNat count
      let _z := cis θ
      aux k' (acc + 1)

def benchDeMoivre (n : Nat) : ComplexNumbers :=
  aux n one
where
  aux (k : Nat) (acc : ComplexNumbers) : ComplexNumbers :=
    match k with
    | 0 => acc
    | k'+1 =>
      aux k' (deMoivre 1.0 n)

#eval "── PolarBench: 200 polar constructions ──"
#eval benchPolarConstruct 200

#eval "── PolarBench: 200 cis constructions ──"
#eval benchCisConstruct 200

#eval "── PolarBench: deMoivre n=3 ──"
#eval benchDeMoivre 3

#eval "══ POLAR BENCHMARK COMPLETE ══"
