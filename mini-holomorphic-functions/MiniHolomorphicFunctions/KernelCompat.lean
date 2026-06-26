/-
# MiniHolomorphicFunctions.KernelCompat

Compatibility layer bridging the holomorphic functions module API
(`Axiom.mk` / `AxiomSystem.addAxioms` / `Formula.pred`) with the
actual mini-kernel API (`Axiom.described` / `AxiomSet.addAll` / `Formula.atom`).

All compatibility types are placed in the `MiniObjectKernel` namespace
so they are automatically available via `open MiniObjectKernel`
(which every file already uses).
-/

import MiniObjectKernel.Core.Basic
import MiniAxiomKernel.Core.Basic
import MiniLogicKernel.Core.Basic

namespace MiniObjectKernel

/-! ## Type Aliases -/

abbrev Axiom := MiniAxiomKernel.Axiom
abbrev AxiomSystem := MiniAxiomKernel.AxiomSet
abbrev Formula := MiniLogicKernel.Formula

/-! ## Axiom Constructors -/

/-- Compatibility: Axiom.mk name statement description. -/
def Axiom.mk (name : String) (statement : Formula) (description : String) : Axiom :=
  MiniAxiomKernel.Axiom.described name statement description

/-! ## AxiomSystem Operations -/

/-- Empty axiom system. -/
def AxiomSystem.empty : AxiomSystem :=
  MiniAxiomKernel.AxiomSet.empty

/-- Add axioms to a system. -/
def AxiomSystem.addAxioms (s : AxiomSystem) (axs : List Axiom) : AxiomSystem :=
  MiniAxiomKernel.AxiomSet.addAll s axs

/-! ## Formula Constructors -/

/-- Compatibility: Formula.pred n args (predicate application). -/
def Formula.pred (n : Nat) (args : List Nat) : Formula :=
  MiniLogicKernel.Formula.atom n

end MiniObjectKernel
