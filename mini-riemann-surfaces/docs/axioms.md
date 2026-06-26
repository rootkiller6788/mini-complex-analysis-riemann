# Axiomatic Foundation of MiniRiemannSurfaces

The package treats the deepest theorems of Riemann surface theory
as axioms (`axiom` or `sorry`), providing a vocabulary-first
formalization rather than a proof-first one.

## Core Axioms (from Core/Laws.lean)

1. **Transition maps are holomorphic** — the defining property of a
   Riemann surface atlas.
2. **Genus is a topological invariant** — homeomorphic surfaces have
   equal genus.
3. **Riemann-Hurwitz formula** — relates genera in a branched cover.
4. **Divisor degree is well-defined** — independent of presentation.
5. **Principal divisors have degree 0** — fundamental fact about
   meromorphic functions.

## Theorem Axioms (from Theorems/Basic.lean)

6. **Riemann-Roch** — l(D) - l(K-D) = deg(D) - g + 1
7. **Abel's theorem** — divisor of a meromorphic function has degree 0
   and maps to 0 under Abel-Jacobi.
8. **Jacobi Inversion** — Sym^g X → Jac(X) is surjective.
9. **Riemann-Hurwitz** — branched cover genus formula.
10. **Uniformization** — simply connected RS ≅ ℂ̂, ℂ, or Δ.

## Classification Theorems (from Theorems/Main.lean)

11. **Riemann existence** — every compact RS is algebraic.
12. **Chow's theorem** — analytic subvariety of ℂℙ^n is algebraic.
13. **GAGA principle** — analytic ↔ algebraic on projective varieties.
14. **Equivalence: compact RS ≅ smooth projective curves over ℂ.**

## Universal Properties (from Theorems/UniversalProperties.lean)

15. **Jacobian universal property** — Alb(X) = Jac(X) is universal.
16. **Period mapping** — T_g → H_g classifies complex structures.
17. **Teichmueller universal property** — universal family over T_g.

## Bridge Axioms

18. **Exponential exact sequence** → Pic(X) structure.
19. **Fundamental group presentation** → π₁(Σ_g) ≅ ⟨a_i,b_i | Π[a_i,b_i]⟩.
20. **Hyperbolic metric existence** → conformal metric on g ≥ 2 RS.
21. **Dehn twists generate** → generating set of Γ_g.

## Design Philosophy

All axioms are stated with `axiom` keyword and have `True` as conclusion,
providing vocabulary and type-checked structure. In a full development,
these would be replaced by genuine proofs.
