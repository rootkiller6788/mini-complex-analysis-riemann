import Lake
open Lake DSL

package «mini-meromorphic-functions» where
  -- Settings
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩
  ]

require
  «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
  «mini-complex-numbers» from "../mini-complex-numbers"
  «mini-holomorphic-functions» from "../mini-holomorphic-functions"
  «mini-complex-integration» from "../mini-complex-integration"

@[default_target]
lean_lib «MiniMeromorphicFunctions» where
  roots := #[`MiniMeromorphicFunctions]

lean_exe «meromorphic-examples» where
  root := `Main
