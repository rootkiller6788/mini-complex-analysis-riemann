import MiniMeromorphicFunctions

/-!
  # Documentation: Worked Examples

  ## Example 1: Rational Function

  f(z) = 1 / (z² + 1)

  - Poles: z = i, z = -i (both simple, order 1)
  - Residue at z = i:
    lim_{z→i} (z-i)/(z²+1) = 1/(2i) = -i/2
  - Residue at z = -i:
    lim_{z→-i} (z+i)/(z²+1) = 1/(-2i) = i/2
  - Laurent expansion at z = i:
    f(z) = (-i/2)·(z-i)^{-1} + (1/4) - (i/8)(z-i) + ...

  ## Example 2: Trigonometric

  tan z = sin z / cos z

  - Poles at z = π/2 + nπ (simple, order 1)
  - Residue at each pole: lim (z - π/2 - nπ) tan z = -1
  - Period: π (tan(z+π) = tan z)
  - Mittag-Leffler expansion:
    tan z = Σ_{n=-∞}^∞ 1/(nπ + π/2 - z)

  ## Example 3: Gamma Function

  Γ(z) = ∫₀^∞ t^{z-1} e^{-t} dt

  - Simple poles at z = 0, -1, -2, ...
  - Residue at z = -n: (-1)^n / n!
  - Functional equation: Γ(z+1) = z Γ(z)
  - Weierstrass product:
    1/Γ(z) = z e^{γz} ∏_{n=1}^∞ (1 + z/n) e^{-z/n}

  ## Example 4: Riemann Zeta

  ζ(s) = Σ_{n=1}^∞ 1/n^s (Re(s) > 1), continued meromorphically

  - Simple pole at s = 1 with residue 1
  - Trivial zeros at s = -2, -4, -6, ...
  - Nontrivial zeros in the critical strip 0 < Re(s) < 1
  - Functional equation:
    ζ(s) = 2^s π^{s-1} sin(πs/2) Γ(1-s) ζ(1-s)

  ## Example 5: Essential Singularity

  f(z) = e^{1/z}

  - Essential singularity at z = 0
  - Laurent expansion: Σ_{n=0}^∞ 1/(n! z^n)
    (infinitely many non-zero negative terms)
  - In any neighborhood of 0, e^{1/z} takes every nonzero
    complex value infinitely often (Great Picard Theorem)
  - Casorati-Weierstrass: image is dense in ℂ
-/

open MiniMeromorphicFunctions

#eval "docs/Examples.lean: worked examples with full detail"
