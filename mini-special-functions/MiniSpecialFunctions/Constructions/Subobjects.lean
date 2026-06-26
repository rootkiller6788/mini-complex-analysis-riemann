/-
# MiniSpecialFunctions: Subobjects

Hierarchy of special function types:
- `ElementaryFunctions`: exp, trig, log, powers, algebraic
- Special functions hierarchy: Γ, ζ, elliptic, modular
- Subobject relationships between function classes
-/

import MiniSpecialFunctions.Constructions.Quotients

namespace MiniSpecialFunctions

/-! ## Elementary Functions -/

/-- Elementary functions: built from exp, log, trig, algebraic operations -/
inductive ElementaryFunction
  | constant (c : Float)
  | identity
  | exp (f : ElementaryFunction)
  | log (f : ElementaryFunction)
  | sin (f : ElementaryFunction)
  | cos (f : ElementaryFunction)
  | add (f g : ElementaryFunction)
  | mul (f g : ElementaryFunction)
  | inv (f : ElementaryFunction)
  deriving Repr, Inhabited

/-- Evaluate an elementary function at a float point -/
def ElementaryFunction.eval (f : ElementaryFunction) (x : Float) : Float :=
  match f with
  | ElementaryFunction.constant c => c
  | ElementaryFunction.identity => x
  | ElementaryFunction.exp g => Float.exp (g.eval x)
  | ElementaryFunction.log g => Float.log (g.eval x)
  | ElementaryFunction.sin g => Float.sin (g.eval x)
  | ElementaryFunction.cos g => Float.cos (g.eval x)
  | ElementaryFunction.add g h => g.eval x + h.eval x
  | ElementaryFunction.mul g h => g.eval x * h.eval x
  | ElementaryFunction.inv g => 1.0 / (g.eval x)

/-! ## Special Function Hierarchy -/

/-- Special functions extend elementary functions with Γ, ζ, elliptic, modular -/
inductive SpecialFunctionType
  | elementary
  | gamma
  | zeta
  | elliptic
  | theta
  | modular
  deriving Repr, Inhabited, BEq, Ord

/-- The hierarchy order: elementary < gamma < zeta < elliptic < theta < modular -/
def specialFunctionHierarchy : List SpecialFunctionType :=
  [SpecialFunctionType.elementary, SpecialFunctionType.gamma,
   SpecialFunctionType.zeta, SpecialFunctionType.elliptic,
   SpecialFunctionType.theta, SpecialFunctionType.modular]

/-- Subobject relation: whether type A is included in type B -/
def isSubfunctionOf (a b : SpecialFunctionType) : Bool :=
  match a, b with
  | SpecialFunctionType.elementary, _ => true
  | SpecialFunctionType.gamma, SpecialFunctionType.gamma => true
  | SpecialFunctionType.gamma, SpecialFunctionType.zeta => true
  | SpecialFunctionType.gamma, SpecialFunctionType.elliptic => true
  | SpecialFunctionType.gamma, SpecialFunctionType.theta => true
  | SpecialFunctionType.gamma, SpecialFunctionType.modular => true
  | SpecialFunctionType.zeta, SpecialFunctionType.zeta => true
  | SpecialFunctionType.zeta, SpecialFunctionType.elliptic => true
  | SpecialFunctionType.zeta, SpecialFunctionType.theta => true
  | SpecialFunctionType.zeta, SpecialFunctionType.modular => true
  | SpecialFunctionType.elliptic, SpecialFunctionType.elliptic => true
  | SpecialFunctionType.elliptic, SpecialFunctionType.theta => true
  | SpecialFunctionType.elliptic, SpecialFunctionType.modular => true
  | SpecialFunctionType.theta, SpecialFunctionType.theta => true
  | SpecialFunctionType.theta, SpecialFunctionType.modular => true
  | SpecialFunctionType.modular, SpecialFunctionType.modular => true
  | _, _ => false

/-! ## #eval Tests -/

#eval "── Constructions.Subobjects: Eval e^x sin x at x=1 ──"
#eval (ElementaryFunction.mul
        (ElementaryFunction.exp ElementaryFunction.identity)
        (ElementaryFunction.sin ElementaryFunction.identity)).eval 1.0

#eval "── Constructions.Subobjects: Hierarchy ──"
#eval specialFunctionHierarchy

#eval "── Constructions.Subobjects: Is Gamma sub of modular? ──"
#eval isSubfunctionOf SpecialFunctionType.gamma SpecialFunctionType.modular

#eval "── Constructions.Subobjects: Is modular sub of Gamma? ──"
#eval isSubfunctionOf SpecialFunctionType.modular SpecialFunctionType.gamma

end MiniSpecialFunctions
