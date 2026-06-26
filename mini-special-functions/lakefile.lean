import Lake
open Lake DSL

package «mini-special-functions» where

@[default_target]
lean_lib «MiniSpecialFunctions» where
  roots := #[`MiniSpecialFunctions]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-complex-numbers» from "../mini-complex-numbers"
require «mini-holomorphic-functions» from "../mini-holomorphic-functions"
require «mini-complex-integration» from "../mini-complex-integration"
