"""
MiniSpecialFunctions: SageMath symbolic and high-precision reference.

Provides symbolic and arbitrary-precision computations of special
functions for validating Lean 4 implementations.
"""

# ── Complex Exponential ──────────────────────────────────────────

def complex_exp_demo():
    """Demonstrate complex exponential identities."""
    print("═══ Complex Exponential ═══")
    print(f"exp(0)     = {exp(0)}")
    print(f"exp(I*pi)  = {exp(I*pi)}")
    print(f"exp(2*pi*I) = {exp(2*pi*I)}")
    print(f"exp(1+I)   = {exp(1+I).n()}")

# ── Complex Trig ──────────────────────────────────────────────────

def complex_trig_demo():
    """Demonstrate complex trigonometric identities."""
    print("═══ Complex Trigonometry ═══")
    z = var('z')
    print(f"sin(0)  = {sin(0)}")
    print(f"cos(0)  = {cos(0)}")
    print(f"sin(pi) = {sin(pi)}")
    print(f"cos(pi) = {cos(pi)}")
    # Euler identity check
    expr = exp(I*z) - (cos(z) + I*sin(z))
    print(f"exp(iz) - (cos(z)+i sin(z)) simplifies to: {expr.simplify_trig()}")

# ── Gamma Function ────────────────────────────────────────────────

def gamma_demo():
    """Demonstrate Gamma function properties."""
    print("═══ Gamma Function ═══")
    print(f"Gamma(1)    = {gamma(1)}")
    print(f"Gamma(5)    = {gamma(5)}")
    print(f"Gamma(1/2)  = {gamma(1/2)}")
    print(f"sqrt(pi)    = {sqrt(pi).n()}")
    # Functional equation check
    print(f"Gamma(6)    = {gamma(6)}")
    print(f"5*Gamma(5)  = {5*gamma(5)}")
    # Reflection formula
    z = 1/3
    print(f"Gamma({z})*Gamma({1-z}) = {gamma(z)*gamma(1-z).n()}")
    print(f"pi/sin(pi*{z})          = {(pi/sin(pi*z)).n()}")

# ── Riemann Zeta ──────────────────────────────────────────────────

def zeta_demo():
    """Demonstrate Riemann zeta function properties."""
    print("═══ Riemann Zeta ═══")
    print(f"zeta(2)  = {zeta(2)}")
    print(f"pi^2/6   = {(pi^2/6).n()}")
    print(f"zeta(4)  = {zeta(4)}")
    print(f"pi^4/90  = {(pi^4/90).n()}")
    print(f"zeta(-1) = {zeta(-1)}")
    print(f"-1/12    = {-1/12}")
    # Euler product verification (symbolic attempt)
    print(f"zeta(2) via euler_product: {euler_product(2)}")

def euler_product(s, num_primes=100):
    """Approximate Euler product for zeta(s)."""
    prod = 1
    for p in primes_first_n(num_primes):
        prod *= 1 / (1 - p^(-s))
    return prod.n()

# ── Weierstrass Elliptic ──────────────────────────────────────────

def weierstrass_demo():
    """Demonstrate Weierstrass elliptic functions."""
    print("═══ Weierstrass Elliptic ═══")
    # Square lattice
    tau = I
    g2_sq = 60 * sum((m + n*tau)^(-4) for m in range(-10, 11)
                     for n in range(-10, 11) if (m, n) != (0, 0))
    print(f"g2(1,i) = {g2_sq.n()}")
    # j-invariant for square lattice
    j_sq = 1728 * g2_sq^3 / (g2_sq^3 - 27*g2_sq^2)
    print(f"j(i) ~ {j_sq.n()} (expected 1728)")

# ── Theta Functions ───────────────────────────────────────────────

def theta_demo():
    """Demonstrate Jacobi theta functions."""
    print("═══ Jacobi Theta Functions ═══")
    q = 0.1
    # theta_3(0; q) = sum q^{n^2}
    theta3 = sum(q^(n^2) for n in range(-20, 21))
    print(f"theta_3(0; 0.1) = {theta3.n()}")

# ── AGM ───────────────────────────────────────────────────────────

def agm_demo():
    """Demonstrate Arithmetic-Geometric Mean."""
    print("═══ AGM ═══")
    a, b = 1.0, 1/sqrt(2).n()
    for i in range(10):
        a, b = (a + b) / 2, sqrt(a * b)
    print(f"AGM(1, 1/sqrt(2)) = {a}")

# ── Run all demos ─────────────────────────────────────────────────

if __name__ == "__main__":
    complex_exp_demo()
    print()
    complex_trig_demo()
    print()
    gamma_demo()
    print()
    zeta_demo()
    print()
    weierstrass_demo()
    print()
    theta_demo()
    print()
    agm_demo()
    print("═══ SageMath Reference Complete ═══")
