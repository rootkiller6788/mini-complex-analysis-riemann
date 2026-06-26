import Lake
open Lake DSL

package «mini-holomorphic-functions» where

@[default_target]
lean_lib «MiniHolomorphicFunctions» where
  moreLeanArgs := #["-DmaxHeartbeats=400000"]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-complex-numbers» from "../mini-complex-numbers"
