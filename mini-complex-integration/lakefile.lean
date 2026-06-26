import Lake
open Lake DSL

package «mini-complex-integration» where

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-complex-numbers» from "../mini-complex-numbers"
require «mini-holomorphic-functions» from "../mini-holomorphic-functions"

@[default_target]
lean_lib «MiniComplexIntegration» where
  moreLeanArgs := #["-DmaxHeartbeats=400000"]
