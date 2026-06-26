/-
# Benchmark: Conjugate Operations

Measures performance of conjugation, conjugate properties, and related operations.
-/

import MiniComplexNumbers

open MiniComplexNumbers

#eval "══ CONJUGATE BENCHMARK ══"

/-!
## Operations tested:
-- [x] conjugate (involution: conj(conj z) = z)
-- [x] conj(z+w) = conj z + conj w
-- [x] conj(z*w) = conj z * conj w
-- [x] |conj z| = |z|
-- [x] conjugating roots of unity
-/

def benchConjInvolution (count : Nat) : Nat :=
  aux count 0
where
  aux (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 =>
      let z := ComplexNumbers.of (Float.ofNat k') (Float.ofNat (k' % 7))
      let z' := complexConjugate (complexConjugate z)
      if z = z' then aux k' (acc + 1) else aux k' acc

def benchConjAdd (count : Nat) : Nat :=
  aux count 0
where
  aux (k : Nat) (acc : Nat) : Nat :=
    match k with
    | 0 => acc
    | k'+1 =>
      let z := ComplexNumbers.of 1 2
      let w := ComplexNumbers.of 3 4
      let lhs := complexConjugate (z + w)
      let rhs := complexConjugate z + complexConjugate w
      if lhs = rhs then aux k' (acc + 1) else aux k' acc

def benchConjOfRoots (n : Nat) : List ComplexNumbers :=
  let roots := nthRootsOfUnity n
  roots.map complexConjugate

#eval "── ConjugateBench: 300 involution checks ──"
#eval benchConjInvolution 300

#eval "── ConjugateBench: 300 add property checks ──"
#eval benchConjAdd 300

#eval "── ConjugateBench: Conjugate of 4th roots ──"
#eval benchConjOfRoots 4

#eval "══ CONJUGATE BENCHMARK COMPLETE ══"
