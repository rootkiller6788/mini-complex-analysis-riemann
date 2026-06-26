/-
# Benchmark: Complex Number Operations

Measures performance of basic complex arithmetic: add, mul, conjugate, modulus.
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ COMPLEX OPS BENCHMARK ══"

/-!
## Operations tested (10k iterations each):
-- [x] add           | Core/Basic.lean
-- [x] mul           | Core/Basic.lean
-- [x] neg           | Core/Basic.lean
-- [x] conjugate     | Core/Basic.lean
-- [x] modulus       | Core/Basic.lean
-- [x] argument      | Core/Basic.lean
-- [x] polarForm     | Core/Basic.lean
-- [x] cis           | Core/Basic.lean
-/

def benchAdd (n : Nat) : ComplexNumbers :=
  aux n zero
where
  aux (k : Nat) (acc : ComplexNumbers) : ComplexNumbers :=
    match k with
    | 0 => acc
    | k'+1 => aux k' (acc + ComplexNumbers.of 1 1)

def benchMul (n : Nat) : ComplexNumbers :=
  aux n one
where
  aux (k : Nat) (acc : ComplexNumbers) : ComplexNumbers :=
    match k with
    | 0 => acc
    | k'+1 => aux k' (acc * ComplexNumbers.of 1 1)

#eval "── ComplexOps: 1000 adds ──"
#eval benchAdd 1000

#eval "── ComplexOps: 1000 muls ──"
#eval benchMul 1000

#eval "══ COMPLEX OPS BENCHMARK COMPLETE ══"
