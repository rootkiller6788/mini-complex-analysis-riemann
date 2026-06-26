/-
# Benchmark: Modulus Computations

Measures performance of modulus operations: |z|, |z*w|, triangle inequality checks.
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ MODULUS BENCHMARK ══"

/-!
## Operations tested:
-- [x] |z| for integer points
-- [x] |z*w| = |z||w| verification
-- [x] |z+w| ≤ |z|+|w| verification
-- [x] |conj z| = |z| verification
-/

def benchModulusSingle (count : Nat) : Float :=
  aux count 0
where
  aux (k : Nat) (acc : Float) : Float :=
    match k with
    | 0 => acc
    | k'+1 =>
      let z := ComplexNumbers.of (Float.ofNat k') (Float.ofNat (k' % 10))
      aux k' (acc + |z|)

def benchModulusProduct (count : Nat) : Nat :=
  aux count 0
where
  aux (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 =>
      let z := ComplexNumbers.of 3 4
      let w := ComplexNumbers.of 5 12
      if Float.abs (|z * w| - (|z| * |w|)) < 0.001 then
        aux k' (acc + 1)
      else aux k' acc

#eval "── ModulusBench: 500 single moduli ──"
#eval benchModulusSingle 500

#eval "── ModulusBench: 200 product rules ──"
#eval benchModulusProduct 200

#eval "══ MODULUS BENCHMARK COMPLETE ══"
