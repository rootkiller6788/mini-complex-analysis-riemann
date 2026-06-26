import Lake
open Lake DSL

package «mini-complex-numbers» where

@[default_target]
lean_lib «MiniComplexNumbers» where
  roots := #[`MiniComplexNumbers]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
