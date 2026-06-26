"""
Numerical complex differentiation and holomorphic function utilities.

Provides finite difference approximation, complex step derivative,
and Taylor series coefficient computation for verification against
the Lean formalization.
"""

import cmath
import math


def complex_derivative_fd(f, z0, h=1e-8):
    """Finite difference approximation of complex derivative."""
    return (f(z0 + h) - f(z0 - h)) / (2 * h)


def complex_step_derivative(f, x, h=1e-20):
    """Complex step derivative for real-valued functions."""
    return f(x + 1j * h).imag / h


def taylor_coefficient_cauchy(f, z0, r, n, N=1000):
    """Approximate nth Taylor coefficient via Cauchy integral formula."""
    total = 0j
    for k in range(N):
        theta = 2 * math.pi * k / N
        z = z0 + r * cmath.exp(1j * theta)
        total += f(z) / ((z - z0) ** (n + 1)) * cmath.exp(1j * theta)
    return total * r / (2 * math.pi * N) * math.factorial(n)


def horners_method(coeffs, z):
    """Evaluate polynomial Σ a_k z^k using Horner's method."""
    result = 0j
    for a in reversed(coeffs):
        result = result * z + a
    return result


# Verification examples
if __name__ == "__main__":
    # f(z) = z^3, derivative at z=1 should be 3
    f_cube = lambda z: z ** 3
    df_dz = complex_derivative_fd(f_cube, 1.0)
    print(f"f(z)=z^3 at z=1: numerical derivative = {df_dz:.6f}, expected = 3+0j")

    # Taylor coefficient a_3 for exp(z) at z=0
    f_exp = lambda z: cmath.exp(z)
    a3 = taylor_coefficient_cauchy(f_exp, 0, 1.0, 3)
    print(f"exp(z) a_3 at z=0: numerical = {a3:.6f}, expected = 1/6 = {1/6:.6f}")

    print("mini-holomorphic-functions Python bridge ready")
