# MiniComplexNumbers Theory Guide

## The Complex Numbers

Complex numbers are numbers of the form z = a + bi where a, b are real numbers
and i is the imaginary unit satisfying i² = −1. They form an algebraically closed
field that extends the real numbers.

### Algebraic Structure

- ℂ is a field under addition and multiplication
- ℂ is the unique (up to isomorphism) algebraically closed field of characteristic 0
  with transcendence degree continuum over ℚ
- ℂ ≅ ℝ[x]/(x²+1), the splitting field of x²+1 over ℝ
- Gal(ℂ/ℝ) ≅ ℤ/2, with the non-trivial automorphism being complex conjugation

### Geometric Representation

- The complex plane is isometric to ℝ² with the Euclidean metric
- Multiplication by a complex number corresponds to rotation and scaling
- Complex conjugation corresponds to reflection across the real axis

### Polar Form

Every non-zero complex number can be written as z = r·cis(θ) where:
- r = |z| is the modulus (distance from origin)
- θ = arg(z) is the argument (angle from positive real axis)
- cis(θ) = cos θ + i sin θ

### De Moivre's Theorem

(cis θ)^n = cis(nθ) for any integer n.

This gives the n-th roots of unity: cis(2πk/n) for k = 0, 1, ..., n-1.

## Complex Analysis (Theorems)

The package includes statements (with `sorry` proofs) of:

1. **Fundamental Theorem of Algebra**: Every non-constant polynomial over ℂ has a root
2. **Liouville's Theorem**: Every bounded entire function is constant
3. **Maximum Modulus Principle**: The maximum of |f| on a domain occurs on the boundary
4. **Open Mapping Theorem**: Non-constant analytic functions map open sets to open sets
5. **Identity Theorem**: If two analytic functions agree on a set with a limit point, they are identical

## Topology of ℂ

- ℂ is connected, locally connected, and path-connected
- ℂ\{0} is connected but not simply-connected (winding number detects this)
- ℂ̂ = ℂ∪{∞} (Riemann sphere) is compact and simply-connected

## Classification of Subfields

- ℝ is the unique maximal real-closed subfield of ℂ
- ℚ̅ (algebraic numbers) is the algebraic closure of ℚ in ℂ
- There are uncountably many subfields between ℚ and ℂ

## Continuous Automorphisms

- The only continuous field automorphisms of ℂ are the identity and complex conjugation
- Assuming the Axiom of Choice, there are 2^(2^ℵ₀) wild automorphisms

## Connections

- **Algebra**: Galois theory, field extensions, algebraic number theory
- **Topology**: Riemann sphere, stereographic projection, chordal metric
- **Geometry**: Conformal mappings, Möbius transformations, cross-ratio
- **Computation**: Floating-point arithmetic, branch cuts, numerical root finding
