import Lake
open Lake DSL

package «mini-conformal-mapping» where

@[default_target]
lean_lib «MiniConformalMapping» where

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-complex-numbers» from "../mini-complex-numbers"
require «mini-holomorphic-functions» from "../mini-holomorphic-functions"
