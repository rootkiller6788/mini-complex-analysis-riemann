# Mini Complex Analysis & Riemann Surfaces

A collection of **from-scratch Lean 4 implementations** of university-level complex analysis, holomorphic functions, and Riemann surfaces. Each sub-package maps to MIT and other top-tier university courses, building the foundations of complex analysis from first principles using the Lean 4 proof assistant and kernel libraries.

## Sub-Packages

| Sub-Package | Topics | Key Courses |
|-------------|--------|-------------|
| [mini-complex-numbers](mini-complex-numbers/) | Complex numbers, polar form, de Moivre, complex plane topology | MIT 18.04, Stanford Math 116 |
| [mini-holomorphic-functions](mini-holomorphic-functions/) | Cauchy-Riemann, analytic functions, power series, Liouville | MIT 18.04, Harvard Math 113 |
| [mini-complex-integration](mini-complex-integration/) | Contour integrals, Cauchy Theorem, residue calculus, argument principle | MIT 18.04, Princeton MAT 325 |
| [mini-conformal-mapping](mini-conformal-mapping/) | Conformal maps, Mobius transformations, Riemann mapping theorem | MIT 18.04, Cambridge Part II |
| [mini-entire-harmonic](mini-entire-harmonic/) | Entire functions, harmonic functions, Poisson formula, Dirichlet problem | MIT 18.112, Berkeley Math 185 |
| [mini-meromorphic-functions](mini-meromorphic-functions/) | Poles, Laurent series, meromorphic functions, Mittag-Leffler | MIT 18.112, Oxford Part B |
| [mini-special-functions](mini-special-functions/) | Gamma, Beta, Zeta functions, elliptic functions, modular forms intro | MIT 18.112, Princeton MAT 330 |
| [mini-riemann-surfaces](mini-riemann-surfaces/) | Riemann surfaces, sheaf cohomology, Riemann-Roch, uniformization | MIT 18.117, Harvard Math 213a |

## Design Philosophy

- **Zero external dependencies** -- pure Lean 4, only kernel + sibling imports
- **Self-contained sub-packages** -- each with `lakefile.lean`, Core/, Morphisms/, Constructions/, Theorems/
- **Theory-to-code mapping** -- inline `#eval` examples and theorem statements throughout

## Building

```bash
cd mini-complex-numbers
lake build
lake env lean --run Test/Smoke.lean
```

Requires **Lean 4** and **Lake**.

## Project Structure

```
7. mini-complex-analysis-riemann/
├── mini-complex-numbers/           # Complex numbers, polar form, topology
├── mini-holomorphic-functions/     # Cauchy-Riemann, analytic functions, power series
├── mini-complex-integration/       # Contour integrals, Cauchy Theorem, residues
├── mini-conformal-mapping/         # Conformal maps, Mobius, Riemann mapping
├── mini-entire-harmonic/           # Entire/harmonic functions, Poisson, Dirichlet
├── mini-meromorphic-functions/     # Poles, Laurent series, Mittag-Leffler
├── mini-special-functions/         # Gamma, Beta, Zeta, elliptic, modular forms
└── mini-riemann-surfaces/          # Riemann surfaces, Riemann-Roch, uniformization
```

## License

MIT
