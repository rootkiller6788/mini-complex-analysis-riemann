"""
Poisson Integral Computation

Numerical computation of the Poisson integral for the Dirichlet
problem on the unit disc. Implements the Poisson kernel, numerical
quadrature, and compares with exact solutions.

Usage:
    python poisson_integral.py
"""

import math
import numpy as np


def poisson_kernel(r, theta):
    """Poisson kernel P(r, theta) = (1-r^2)/(1-2r cos(theta)+r^2)."""
    if r < 0 or r >= 1:
        return 0.0
    denominator = 1.0 - 2.0 * r * math.cos(theta) + r * r
    if denominator == 0:
        return 0.0
    return (1.0 - r * r) / denominator


def poisson_integral_trapezoidal(boundary, r, theta, N=500):
    """Compute Poisson integral using trapezoidal rule."""
    dt = 2.0 * math.pi / N
    result = 0.0
    for k in range(N):
        t = k * dt
        result += poisson_kernel(r, theta - t) * boundary(t)
    return result * dt / (2.0 * math.pi)


def poisson_integral_simpson(boundary, r, theta, N=500):
    """Compute Poisson integral using Simpson's rule (N must be even)."""
    if N % 2 == 1:
        N += 1
    dt = 2.0 * math.pi / N
    t_values = [k * dt for k in range(N + 1)]
    integrand = [poisson_kernel(r, theta - t) * boundary(t) for t in t_values]

    result = integrand[0] + integrand[-1]
    for k in range(1, N, 2):
        result += 4 * integrand[k]
    for k in range(2, N-1, 2):
        result += 2 * integrand[k]
    return result * dt / (3.0 * 2.0 * math.pi)


def test_constant_boundary():
    """Test: boundary = 1 -> solution = 1 on D."""
    print("=== Test: Constant Boundary f(theta)=1 ===")
    boundary = lambda t: 1.0
    for r in [0.0, 0.25, 0.5, 0.75, 0.9, 0.99]:
        result = poisson_integral_trapezoidal(boundary, r, 0.0, N=1000)
        print(f"  r={r:.3f}: u(r,0) = {result:.8f} (expected: 1.0)")


def test_cosine_boundary():
    """Test: boundary = cos(theta) -> solution = r*cos(theta)."""
    print("=== Test: Cosine Boundary f(theta)=cos(theta) ===")
    boundary = lambda t: math.cos(t)
    for r in [0.0, 0.3, 0.6, 0.9]:
        for theta in [0.0, math.pi/4, math.pi/2]:
            numeric = poisson_integral_trapezoidal(boundary, r, theta, N=500)
            exact = r * math.cos(theta)
            error = abs(numeric - exact)
            print(f"  r={r:.2f}, theta={theta:.2f}: numeric={numeric:.6f}, exact={exact:.6f}, error={error:.2e}")


def test_sine_boundary():
    """Test: boundary = sin(theta) -> solution = r*sin(theta)."""
    print("=== Test: Sine Boundary f(theta)=sin(theta) ===")
    boundary = lambda t: math.sin(t)
    for r in [0.0, 0.3, 0.6, 0.9]:
        for theta in [0.0, math.pi/4, math.pi/2]:
            numeric = poisson_integral_trapezoidal(boundary, r, theta, N=500)
            exact = r * math.sin(theta)
            error = abs(numeric - exact)
            print(f"  r={r:.2f}, theta={theta:.2f}: numeric={numeric:.6f}, exact={exact:.6f}, error={error:.2e}")


def test_convergence():
    """Test convergence of numerical integration."""
    print("=== Test: Convergence of Quadrature ===")
    boundary = lambda t: math.cos(t)
    r, theta = 0.5, 0.0
    exact = r * math.cos(theta)
    for N in [10, 20, 50, 100, 200, 500, 1000]:
        numeric = poisson_integral_trapezoidal(boundary, r, theta, N=N)
        error = abs(numeric - exact)
        print(f"  N={N:4d}: error={error:.2e}")


def test_kernel_properties():
    """Test Poisson kernel properties."""
    print("=== Test: Poisson Kernel Properties ===")
    # P(0, theta) = 1 for all theta
    for theta in [0.0, math.pi/4, math.pi/2, math.pi]:
        val = poisson_kernel(0.0, theta)
        print(f"  P(0, {theta:.2f}) = {val:.6f} (expected: 1.0)")

    # P(r, theta) > 0 for r < 1
    for r in [0.1, 0.5, 0.9]:
        for theta in [0.0, math.pi]:
            val = poisson_kernel(r, theta)
            is_positive = val > 0
            print(f"  P({r}, {theta:.2f}) = {val:.6f}, positive: {is_positive}")

    # Normalization: 1/(2pi) * integral of P(r, theta) dtheta = 1
    for r in [0.0, 0.3, 0.6, 0.9]:
        integral = poisson_integral_trapezoidal(lambda t: 1.0, r, 0.0, N=1000)
        print(f"  Integral P({r}, theta) = {integral:.8f} (expected: 1.0)")


if __name__ == "__main__":
    test_kernel_properties()
    test_constant_boundary()
    test_cosine_boundary()
    test_sine_boundary()
    test_convergence()
    print("\nAll Poisson integral tests complete.")
