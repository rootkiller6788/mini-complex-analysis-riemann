#!/usr/bin/env python3
"""Schwarz-Christoffel numerical mapping.

Computes conformal maps from the upper half-plane to polygons
using the Schwarz-Christoffel integral.
"""

import numpy as np
from scipy import integrate


def schwarz_christoffel_integrand(zeta, prevertices, angles):
    """Schwarz-Christoffel integrand: ∏ (ζ - a_k)^{α_k - 1}."""
    prod = 1.0
    for a, alpha in zip(prevertices, angles):
        prod *= (zeta - a) ** (alpha - 1.0)
    return prod


def schwarz_christoffel_map(z, prevertices, angles, const=1.0):
    """Evaluate the SC map at point z."""
    result, _ = integrate.quad_vec(
        lambda zeta: const * schwarz_christoffel_integrand(
            zeta, prevertices, angles
        ),
        0, z
    )
    return result


if __name__ == "__main__":
    # Example: mapping H to a rectangle
    print("Schwarz-Christoffel mapping module ready.")
    print("Usage: schwarz_christoffel_map(z, prevertices, angles)")
