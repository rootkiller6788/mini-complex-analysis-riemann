"""
MiniSpecialFunctions: Python reference implementations.

Provides reference implementations of special functions
for cross-validating Lean 4 computations.
"""

import math
from typing import List, Tuple


# ── Complex Exponential ──────────────────────────────────────────

def complex_exp(re: float, im: float) -> Tuple[float, float]:
    """e^{re + i*im}"""
    exp_re = math.exp(re)
    return (exp_re * math.cos(im), exp_re * math.sin(im))


# ── Complex Trig ──────────────────────────────────────────────────

def complex_sin(re: float, im: float) -> Tuple[float, float]:
    """sin(re + i*im) = sin(re)cosh(im) + i cos(re)sinh(im)"""
    return (math.sin(re) * math.cosh(im),
            math.cos(re) * math.sinh(im))


def complex_cos(re: float, im: float) -> Tuple[float, float]:
    """cos(re + i*im) = cos(re)cosh(im) - i sin(re)sinh(im)"""
    return (math.cos(re) * math.cosh(im),
            -math.sin(re) * math.sinh(im))


# ── Complex Logarithm (principal branch) ──────────────────────────

def complex_log(re: float, im: float) -> Tuple[float, float]:
    """Principal branch: log|z| + i arg(z), arg in (-pi, pi]"""
    r = math.hypot(re, im)
    theta = math.atan2(im, re)
    return (math.log(r), theta)


# ── Gamma Function ────────────────────────────────────────────────

def gamma_approx(x: float) -> float:
    """Gamma via functional equation recursion."""
    if x <= 0:
        return float('nan')
    if x < 2.0:
        return _gamma_lanczos(x)
    else:
        return (x - 1.0) * gamma_approx(x - 1.0)


def _gamma_lanczos(z: float) -> float:
    """Lanczos approximation for 0 < z < 2."""
    p = [676.5203681218851, -1259.1392167224028, 771.32342877765313,
         -176.61502916214059, 12.507343278686905, -0.13857109526572012,
         9.9843695780195716e-6, 1.5056327351493116e-7]
    z -= 1.0
    x = 0.99999999999980993
    for i, pi in enumerate(p):
        x += pi / (z + i + 1)
    t = z + 7.5
    return math.sqrt(2.0 * math.pi) * (t ** (z + 0.5)) * math.exp(-t) * x


def gamma_half() -> float:
    """Gamma(1/2) = sqrt(pi)."""
    return math.sqrt(math.pi)


# ── Riemann Zeta ──────────────────────────────────────────────────

def zeta_partial_sum(s: float, N: int) -> float:
    """Partial sum: Sum_{n=1}^N 1/n^s."""
    if s <= 1.0:
        return float('nan')
    return sum(1.0 / (n ** s) for n in range(1, N + 1))


def zeta_two() -> float:
    """zeta(2) = pi^2/6."""
    return math.pi * math.pi / 6.0


def zeta_neg_one() -> float:
    """zeta(-1) = -1/12."""
    return -1.0 / 12.0


# ── Weierstrass Elliptic ──────────────────────────────────────────

def weierstrass_g2(omega1: float, omega2: float) -> float:
    """Weierstrass invariant g2 (simplified)."""
    tau = omega2 / omega1
    factor = 60.0 * (math.pi / omega1) ** 4
    return factor * (1.0 / 12.0)  # leading term


def weierstrass_g3(omega1: float, omega2: float) -> float:
    """Weierstrass invariant g3 (simplified)."""
    tau = omega2 / omega1
    factor = 140.0 * (math.pi / omega1) ** 6
    return factor * (1.0 / 216.0)  # leading term


# ── Arithmetic-Geometric Mean ─────────────────────────────────────

def agm(a: float, b: float, iterations: int = 10) -> float:
    """Arithmetic-Geometric Mean."""
    for _ in range(iterations):
        a, b = (a + b) / 2.0, math.sqrt(a * b)
    return a


# ── Test ──────────────────────────────────────────────────────────

if __name__ == "__main__":
    print("═══ MiniSpecialFunctions Python Reference ═══")
    print(f"exp(0)       = {complex_exp(0, 0)}")
    print(f"exp(i*pi)    = {complex_exp(0, math.pi)}")
    print(f"sin(0)       = {complex_sin(0, 0)}")
    print(f"cos(0)       = {complex_cos(0, 0)}")
    print(f"log(-1)      = {complex_log(-1, 0)}")
    print(f"Gamma(1)     = {gamma_approx(1)}")
    print(f"Gamma(5)     = {gamma_approx(5)}")
    print(f"Gamma(1/2)   = {gamma_half()}")
    print(f"zeta(2)      = {zeta_two()}")
    print(f"zeta(-1)     = {zeta_neg_one()}")
    print(f"g2(1,i)       = {weierstrass_g2(1, 1)}")
    print(f"AGM(1, 1/sqrt(2)) = {agm(1, 1/math.sqrt(2))}")
