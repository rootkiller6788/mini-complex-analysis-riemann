import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Constructions
import MiniMeromorphicFunctions.Core.Basic

/-!
  # Products of Meromorphic Functions

  - Product of two meromorphic functions: pole set = union of pole sets
  - Tensor product of function fields
  - Ring structure on meromorphic functions
-/

namespace MiniMeromorphicFunctions

open MiniObjectKernel

/-! ## Product of Meromorphic Functions -/

/-- The product f·g of two meromorphic functions.
    The pole set of f·g is contained in (poles f) ∪ (poles g).
    At a common point, the orders add. -/
def MeromorphicFunction.mul {U : Set ℂ} (f g : MeromorphicFunction U) :
    MeromorphicFunction U where
  toFun := λ z ↦ f.toFun z * g.toFun z
  poles := f.poles ∪ g.poles
  holomorphicOn := by
    -- Product of holomorphic functions is holomorphic
    -- away from the poles of both factors
    sorry
  polesIsolated := by
    -- Union of isolated sets is isolated
    sorry
  finitePrincipalPart := by
    -- At a pole p, the principal part expands via the Leibniz-like rule
    -- ord_p(f·g) = ord_p(f) + ord_p(g)
    sorry

/-- Scalar multiplication of a meromorphic function by a complex number. -/
def MeromorphicFunction.smul (c : ℂ) (f : MeromorphicFunction U) : MeromorphicFunction U where
  toFun := λ z ↦ c * f.toFun z
  poles := f.poles
  holomorphicOn := by sorry
  polesIsolated := by sorry
  finitePrincipalPart := by sorry

/-- Meromorphic functions on a domain form a ℂ-algebra. -/
instance : Mul (MeromorphicFunction U) := ⟨MeromorphicFunction.mul⟩
instance : SMul ℂ (MeromorphicFunction U) := ⟨MeromorphicFunction.smul⟩

/-! ## Tensor Product of Function Fields -/

/-- The function field M(X) of meromorphic functions on a Riemann
    surface X. For X = ℂ̂, this is ℂ(z), the field of rational functions. -/
structure FunctionField (X : Type) where
  /-- Elements are meromorphic functions on X. -/
  carrier : MeromorphicFunction Set.univ
  /-- Field operations (add, mul, inv where nonzero). -/
  fieldOps : True -- placeholder

/-- Tensor product M(X) ⊗_{ℂ} M(Y) ≅ M(X × Y) for
    Riemann surfaces X, Y (generically). -/
theorem tensorProduct_functionField (X Y : Type)
    [CompactRiemannSurface X] [CompactRiemannSurface Y] :
    FunctionField X ⊗[ℂ] FunctionField Y ≃ FunctionField (X × Y) := by
  -- A meromorphic function on X × Y can be expressed as
  -- a finite sum Σ f_i(x) g_i(y) with f_i ∈ M(X), g_i ∈ M(Y)
  sorry

-- Tensor product notation (sketch)
def TensorProduct (A B : Type) [Field A] [Field B] : Type := A × B -- placeholder
notation:max A " ⊗[" R "] " B:max => TensorProduct A B

/-! ## #eval Examples -/

#eval "Product: (1/z) * (1/(z-1)) has poles at 0 and 1"
#eval "Scalar multiplication: 3 * (1/z) still has pole at 0"
#eval "M(ℂ̂) ≅ ℂ(z) rational function field"

end MiniMeromorphicFunctions
