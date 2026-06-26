"""
Compute Weierstrass Products

Computes Weierstrass canonical products for prescribed zero sets.
Implements primary factors E_k(z), canonical products, and
approximations of transcendental entire functions.

Usage:
    python compute_weierstrass.py
"""

import math
import cmath

def primary_factor(z: complex, k: int) -> complex:
    """Compute the Weierstrass primary factor E_k(z)."""
    if k == 0:
        return 1 - z
    # E_k(z) = (1-z) * exp(z + z^2/2 + ... + z^k/k)
    partial_sum = sum(z**(m) / m for m in range(1, k + 1))
    return (1 - z) * cmath.exp(partial_sum)


def weierstrass_product(zeros: list, genus: int, z: complex, max_terms: int = 100) -> complex:
    """Compute the Weierstrass canonical product with given zeros and genus."""
    result = 1.0 + 0j
    for i, a in enumerate(zeros[:max_terms]):
        if abs(a) < 1e-12:
            result *= z  # zero at origin
        else:
            result *= primary_factor(z / a, genus)
    return result


def sin_pi_zeros(n: int) -> list:
    """Generate zeros of sin(pi*z)/z: ±1, ±2, ..., ±n."""
    zeros = []
    for k in range(1, n + 1):
        zeros.append(complex(k, 0))
        zeros.append(complex(-k, 0))
    return zeros


def exp_zeros() -> list:
    """e^z has no zeros."""
    return []


def test_sine_product():
    """Test Weierstrass product for sin(pi*z)/(pi*z)."""
    print("=== Testing Weierstrass Product for sin(pi*z) ===")
    zeros = sin_pi_zeros(50)
    for z_val in [0.25, 0.5, 0.75]:
        z = complex(z_val, 0)
        product = weierstrass_product(zeros, genus=0, z=z, max_terms=100)
        product_scaled = z * math.pi * product
        exact = cmath.sin(math.pi * z)
        print(f"  z={z_val}: product={product_scaled:.6f}, sin(pi*z)={exact.real:.6f}")


def test_exp_product():
    """e^z has empty zero set, product is 1."""
    print("=== Testing Weierstrass Product for e^z (no zeros) ===")
    for z_val in [0.0, 1.0, 1j]:
        z = complex(z_val) if isinstance(z_val, complex) else complex(z_val, 0)
        product = weierstrass_product([], genus=0, z=z)
        print(f"  z={z_val}: empty product={product:.6f}")


def compute_order_estimate(f, r_values):
    """Estimate the order of growth of an entire function."""
    log_r = []
    log_log_M = []
    for r in r_values:
        # Approximate max modulus on circle
        max_val = 0.0
        for k in range(100):
            theta = 2 * math.pi * k / 100
            z = cmath.rect(r, theta)
            val = abs(f(z))
            if val > max_val:
                max_val = val
        if max_val > math.e:
            log_log_M.append(math.log(math.log(max_val)))
            log_r.append(math.log(r))
    if len(log_log_M) >= 2:
        slope = (log_log_M[-1] - log_log_M[0]) / (log_r[-1] - log_r[0])
        return slope
    return 0.0


def test_order_estimation():
    """Estimate order of e^z."""
    print("=== Testing Order Estimation ===")
    f = cmath.exp
    r_vals = [1.0, 2.0, 5.0, 10.0]
    est = compute_order_estimate(f, r_vals)
    print(f"  Estimated order of exp(z): {est:.4f} (exact: 1.0)")


if __name__ == "__main__":
    test_exp_product()
    test_sine_product()
    test_order_estimation()
    print("\nAll Weierstrass product tests complete.")
