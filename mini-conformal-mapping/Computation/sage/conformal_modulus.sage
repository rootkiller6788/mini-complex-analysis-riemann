# SageMath script: Conformal modulus computation
# Compute conformal modulus and extremal length for annuli

def conformal_modulus(r1, r2):
    """
    Conformal modulus of annulus A(r1, r2).
    mu = (1/(2*pi)) * log(r2/r1)
    """
    return log(r2/r1) / (2*pi)

def annuli_equivalent(r1, r2, s1, s2):
    """
    Two annuli A(r1,r2) and A(s1,s2) are conformally equivalent
    iff r2/r1 == s2/s1.
    """
    return abs(r2/r1 - s2/s1) < 1e-10

# Example: A(1,2) and A(2,4) have the same modulus
mu_A = conformal_modulus(1, 2)
mu_B = conformal_modulus(2, 4)

print(f"mu(A(1,2)) = {mu_A:.6f}")
print(f"mu(A(2,4)) = {mu_B:.6f}")
print(f"Equivalent: {annuli_equivalent(1, 2, 2, 4)}")
