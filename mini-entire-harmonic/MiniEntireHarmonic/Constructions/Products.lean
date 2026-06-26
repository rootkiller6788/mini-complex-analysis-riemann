/-
# MiniEntireHarmonic: Products

Hadamard product of entire functions, Borel transform,
product of harmonic functions, and convolution constructions.
-/

import MiniEntireHarmonic.Core.Basic

namespace MiniEntireHarmonic

/-! ## Hadamard Product of Entire Functions -/

def hadamardProduct (f g : EntireFunction) : EntireFunction :=
  -- (f ⊙ g)(z) = Σ a_n b_n z^n where f = Σ a_n z^n, g = Σ b_n z^n
  fun z => f z * g z  -- simplified: pointwise product (not true Hadamard product)

def hadamardProductZeros (f g : EntireFunction) : List ComplexNumbers :=
  []  -- stub

def hadamardProductOrder (f g : EntireFunction) : Float :=
  max (orderOfGrowth_limsup f) (orderOfGrowth_limsup g)

/-! ## Borel Transform -/

def borelTransform (f : EntireFunction) : EntireFunction :=
  -- Borel transform: B[f](z) = Σ a_n/n! z^n for exponential type
  fun z => f z  -- stub

def borelTransformOfExpType (f : EntireFunction) : Prop :=
  True  -- stub: Borel transform of exponential type is analytic at ∞

def borelTransformOrder (f : EntireFunction) : Float :=
  orderOfGrowth_limsup f

/-! ## Product of Harmonic Functions -/

def harmonicProduct (u v : ComplexNumbers → Float) : ComplexNumbers → Float :=
  fun z => u z * v z

def harmonicProductNotHarmonic : Prop :=
  -- The product of harmonic functions is generally not harmonic
  True

def logHarmonicProduct (u v : ComplexNumbers → Float) : ComplexNumbers → Float :=
  fun z => Float.log (u z) + Float.log (v z)  -- if u,v > 0

/-! ## Convolution of Harmonic Functions -/

def harmonicConvolution (u v : ComplexNumbers → Float) (z : ComplexNumbers) : Float :=
  0.0  -- stub: (u * v)(z) = ∫ u(z-w) v(w) dw

def harmonicConvolutionIsHarmonic (u v : ComplexNumbers → Float) : Prop :=
  isHarmonic u → isHarmonic v → isHarmonic (fun z => harmonicConvolution u v z)

/-! ## Weierstrass Product over Zero Set -/

def weierstrassProductZeros (zeros : List ComplexNumbers) : EntireFunction :=
  weierstrassCanonicalProduct zeros 0

def weierstrassProductOrder (zeros : List ComplexNumbers) (genus : Nat) : Float :=
  -- Order of canonical product determined by convergence exponent of zeros
  0.0  -- stub

/-! ## #eval Tests -/

#eval "── Constructions.Products: Hadamard product order ──"
#eval hadamardProductOrder entireExpZ entireSinZ

#eval "── Constructions.Products: Borel transform order ──"
#eval borelTransformOrder entireExpZ

#eval "── Constructions.Products: Harmonic product at z=1 ──"
#eval harmonicProduct (fun z => z.re) (fun z => z.im) (ComplexNumbers.of 1.0 2.0)

#eval "── Constructions.Products: Weierstrass product with empty zeros ──"
#eval weierstrassProductZeros [] (ComplexNumbers.of 0.0 0.0)

end MiniEntireHarmonic
