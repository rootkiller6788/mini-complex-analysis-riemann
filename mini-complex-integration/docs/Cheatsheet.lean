/-
# Cheatsheet — Complex Integration Formulas

Quick reference of all major formulas and theorems.
-/

import MiniComplexIntegration

open MiniComplexIntegration

/-!
## Fundamental Formulas

### Cauchy-Goursat Theorem
∮_γ f(z) dz = 0  (f holomorphic on simply connected domain, γ closed)

### Cauchy Integral Formula
f(z₀) = (1/2πi) ∮_γ f(z)/(z - z₀) dz

### Cauchy Derivative Formula
f⁽ⁿ⁾(z₀) = (n!/2πi) ∮_γ f(z)/(z - z₀)^(n+1) dz

### Residue Theorem
∮_γ f(z) dz = 2πi Σ_{k} Res(f, a_k)

### Argument Principle
(1/2πi) ∮_γ f'(z)/f(z) dz = Z - P  (zeros minus poles)

### Rouché Theorem
If |f(z) - g(z)| < |f(z)| on γ, then Z_f = Z_g inside γ

### ML Inequality
|∫_γ f(z) dz| ≤ M·L  where M = sup|f|, L = length(γ)

### Morera Theorem
If f continuous and ∮ f = 0 on all closed contours, then f holomorphic

### Liouville Theorem
Bounded entire function ⇒ constant

### Fundamental Theorem of Algebra
Every non-constant polynomial P(z) has a root in ℂ

## Common Integrals

### Standard contour integrals
- ∮_{|z|=1} dz/z = 2πi
- ∮_{|z-a|=r} dz/(z-a)^n = 0 (n ≠ 1)
- ∮_{|z-a|=r} dz/(z-a) = 2πi

### Real integrals via residues
- ∫_{-∞}^∞ dx/(1+x²) = π
- ∫_0^{2π} dθ/(a+b cosθ) = 2π/√(a²-b²)  (a > |b|)
- ∫_0^∞ sin x / x dx = π/2
- ∫_0^∞ cos x / (1+x²) dx = π/(2e)

### Residue formulas
- Simple pole: Res(f, a) = lim_{z→a} (z-a)f(z)
- Pole of order m: Res(f, a) = 1/(m-1)! lim_{z→a} d^{m-1}/dz^{m-1} [(z-a)^m f(z)]
- Essential singularity: Res(f, a) = a_{-1} in Laurent expansion

## Winding Number
- n(γ, z₀) = (1/2πi) ∮_γ dz/(z - z₀) ∈ ℤ
- Homotopy invariant in ℂ \\ {z₀}
- Counts net number of counterclockwise loops around z₀
-/

#eval "Cheatsheet: All complex integration formulas catalogued"
