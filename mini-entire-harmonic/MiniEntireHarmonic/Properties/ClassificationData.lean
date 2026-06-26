/-
# MiniEntireHarmonic: Classification Data

Classification by order: ρ < 1 (genus 0), ρ = 0 (genus 0),
finite order: Hadamard factorization available, infinite order
(e.g. e^{e^z}), and intermediate growth classifications.
-/

import MiniEntireHarmonic.Core.Basic
import MiniEntireHarmonic.Properties.Invariants

namespace MiniEntireHarmonic

/-! ## Classification by Order -/

def classificationByOrder (f : EntireFunction) : String :=
  let ρ := orderInvariant f
  if ρ == 0 then "Genus 0: order 0 entire functions (polynomials, or grow slower than any exp(z^ε))"
  else if ρ < 1 then "Genus 0: order < 1 → Hadamard factorization with p=0"
  else if ρ == 1 then "Genus ≤ 1: order 1 (exponential type)"
  else if ρ < Float.infinity then s!"Genus ≤ floor(ρ): finite order {ρ}"
  else "Infinite order: no finite Hadamard factorization"

/-! ## Genus 0 Entire Functions (ρ < 1) -/

def genus0EntireFunctions : Set EntireFunction :=
  fun f => orderInvariant f < 1.0

def genus0Factorization (f : EntireFunction) : String :=
  -- f(z) = z^m e^{a+bz} ∏ (1 - z/a_n) for ρ < 1
  "z^m * exp(a+bz) * ∏ (1 - z/a_n)"

def isGenus0 (f : EntireFunction) : Bool :=
  orderInvariant f < 1.0

/-! ## Finite Order: Hadamard Factorization Available -/

def finiteOrderEntire : Set EntireFunction :=
  fun f => orderInvariant f < 1000.0  -- practical bound

def hadamardFactorizationExists (f : EntireFunction) : Bool :=
  finiteOrderEntire f

def hadamardForm (f : EntireFunction) : String :=
  -- f(z) = z^m e^{P(z)} ∏ E_p(z/a_n) where p = floor(ρ)
  let ρ := orderInvariant f
  s!"z^m * exp(P_{≤floor({ρ})}(z)) * ∏ E_p(z/a_n)"

/-! ## Infinite Order Entire Functions -/

def infiniteOrderEntire : Set EntireFunction :=
  fun f => orderInvariant f >= 1000.0

def doubleExpGrowth : EntireFunction :=
  entireExpExpZ  -- e^{e^z} has infinite order

def doubleExpOrder : Float :=
  orderInvariant entireExpExpZ

def infiniteOrderExample (f : EntireFunction) : String :=
  s!"Infinite order: No Hadamard product representation (e.g., e^{e^z}, e^{e^{e^z}})"

/-! ## Intermediate Growth Classification -/

def intermediateGrowth (f : EntireFunction) (ρ₁ ρ₂ : Float) : Bool :=
  orderInvariant f > ρ₁ ∧ orderInvariant f < ρ₂

def order0MaximalType (f : EntireFunction) : Bool :=
  orderInvariant f == 0.0 ∧ typeInvariant f == Float.infinity

def order0MinimalType (f : EntireFunction) : Bool :=
  orderInvariant f == 0.0 ∧ typeInvariant f == 0.0

/-! ## #eval Tests -/

#eval "── Properties.ClassificationData: Classify exp ──"
#eval classificationByOrder entireExpZ

#eval "── Properties.ClassificationData: Classify exp(exp(z)) ──"
#eval classificationByOrder entireExpExpZ

#eval "── Properties.ClassificationData: Is exp genus 0? ──"
#eval isGenus0 entireExpZ

#eval "── Properties.ClassificationData: Hadamard form for order 1 ──"
#eval hadamardForm entireExpZ

#eval "── Properties.ClassificationData: Double exponential classification ──"
#eval infiniteOrderExample entireExpExpZ

end MiniEntireHarmonic
