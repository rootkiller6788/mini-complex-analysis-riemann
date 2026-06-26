import Lake
open Lake DSL

package `«mini-riemann-surfaces»` where

@[default_target]
lean_lib `«MiniRiemannSurfaces»` where
  roots := #["MiniRiemannSurfaces"]
  moreLeanArgs := #["-DmaxHeartbeats=400000"]

require `«mini-object-kernel»` from "../../0. mini-math-kernel/mini-object-kernel"
require `«mini-complex-numbers»` from "../mini-complex-numbers"
require `«mini-holomorphic-functions»` from "../mini-holomorphic-functions"
require `«mini-conformal-mapping»` from "../mini-conformal-mapping"
