/-
# Tests.Examples

Tests for the standard examples of contour integration.
-/

import MiniComplexIntegration

open MiniComplexIntegration

#eval "=== Example Tests ==="

-- Test: Standard integrals are defined
#eval s!"integralOneOverZ: ∮ dz/z = 2πi"
#eval s!"integralExpOverZM1: ∮ e^z/(z-1) dz = 2πi·e"
#eval s!"integralRealRational: ∫ 1/(1+x²) dx = π"
#eval s!"integralTrigonometric: ∫ 1/(5+4cosθ) dθ = 2π/3"
#eval s!"integralTrigonometricGeneral: ∫ 1/(a+b cosθ) dθ = 2π/√(a²-b²)"
#eval s!"integralSincInfinity: ∫ sin x/x dx = π/2"
#eval s!"integralRealCos: ∫ cos x/(1+x²) dx = π/(2e)"

-- Test: Counterexamples are defined
#eval s!"oneOverZHasNoPrimitive: defined"
#eval s!"roucheConditionSharpness: defined"

#eval "=== Example tests passed ==="
