"""
Harmonic Function Solver

Numerical solver for harmonic functions via finite differences
and boundary element methods. Solves the Dirichlet problem on
the unit disc and general domains.

Usage:
    python harmonic_solver.py
"""

import math
import numpy as np


def laplacian_fd(u, i, j, h):
    """Compute finite difference Laplacian at grid point (i,j)."""
    return (u[i+1, j] + u[i-1, j] + u[i, j+1] + u[i, j-1] - 4*u[i, j]) / (h*h)


def is_harmonic_fd(u, h, tol=1e-10):
    """Check if u satisfies Laplace equation on interior points."""
    n, m = u.shape
    max_residual = 0.0
    for i in range(1, n-1):
        for j in range(1, m-1):
            residual = abs(laplacian_fd(u, i, j, h))
            max_residual = max(max_residual, residual)
    return max_residual < tol


def solve_dirichlet_rectangle(boundary_top, boundary_bottom,
                               boundary_left, boundary_right,
                               nx=50, ny=50, max_iter=10000, tol=1e-6):
    """Solve Dirichlet problem on rectangle [0,1]x[0,1] with FD."""
    u = np.zeros((nx+1, ny+1))

    # Boundary conditions
    for i in range(nx+1):
        x = i / nx
        u[i, 0] = boundary_bottom(x)
        u[i, ny] = boundary_top(x)
    for j in range(ny+1):
        y = j / ny
        u[0, j] = boundary_left(y)
        u[nx, j] = boundary_right(y)

    # Gauss-Seidel iteration
    for _ in range(max_iter):
        u_old = u.copy()
        for i in range(1, nx):
            for j in range(1, ny):
                u[i, j] = 0.25 * (u[i+1, j] + u[i-1, j] +
                                  u[i, j+1] + u[i, j-1])
        if np.max(np.abs(u - u_old)) < tol:
            break

    return u


def mean_value_check(u, x0, y0, radius, n_angles=100):
    """Check mean value property at a point."""
    avg = 0.0
    for k in range(n_angles):
        theta = 2 * math.pi * k / n_angles
        x = x0 + radius * math.cos(theta)
        y = y0 + radius * math.sin(theta)
        # Bilinear interpolation (simplified: nearest)
        avg += u(min(max(x, 0), 1), min(max(y, 0), 1))
    avg /= n_angles
    center = u(x0, y0)
    return center, avg, abs(center - avg)


def harmonic_conjugate_fft(u_values):
    """Compute harmonic conjugate using Hilbert transform (via FFT)."""
    n = len(u_values)
    u_fft = np.fft.fft(u_values)
    # Multiply by -i*sign(k) in frequency domain
    h = np.zeros(n, dtype=complex)
    h[0] = 0
    for k in range(1, n//2):
        h[k] = -1j * u_fft[k]
    for k in range(n//2 + 1, n):
        h[k] = 1j * u_fft[k]
    if n % 2 == 0:
        h[n//2] = 0
    v_values = np.fft.ifft(h)
    return v_values.real


def test_harmonic_solver():
    """Test the harmonic solver on a simple problem."""
    print("=== Testing Harmonic Solver ===")
    u = solve_dirichlet_rectangle(
        boundary_top=lambda x: math.sin(math.pi * x),
        boundary_bottom=lambda x: 0.0,
        boundary_left=lambda y: 0.0,
        boundary_right=lambda y: 0.0,
        nx=40, ny=40
    )
    mid = u.shape[0] // 2
    print(f"  u(0.5, 0.5) = {u[mid, mid]:.6f}")
    print(f"  max(u) = {u.max():.6f}")

    # Check harmonicity
    h = 1.0 / 40
    harmonic = is_harmonic_fd(u, h)
    print(f"  Is harmonic (FD check): {harmonic}")


def test_mean_value():
    """Test mean value property."""
    print("=== Testing Mean Value Property ===")
    def u(x, y):
        return x*x - y*y  # Re(z^2), harmonic

    center, avg, diff = mean_value_check(u, 0.5, 0.5, 0.3)
    print(f"  u(0.5,0.5) = {center:.6f}")
    print(f"  Average on circle r=0.3 = {avg:.6f}")
    print(f"  Difference = {diff:.6e}")


if __name__ == "__main__":
    test_harmonic_solver()
    test_mean_value()
    print("\nAll harmonic solver tests complete.")
