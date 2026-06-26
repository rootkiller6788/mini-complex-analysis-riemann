# mini-conformal-mapping -- Dependency Graph

## Internal Dependencies

```
Core/Basic.lean              (MiniObjectKernel.Core.Basic)
Core/Objects.lean            → Core/Basic
Core/Laws.lean               → Core/Basic, Core/Objects

Morphisms/Hom.lean           → Core/Basic, Core/Objects
Morphisms/Iso.lean           → Core/Basic, Core/Objects
Morphisms/Equiv.lean         → Core/Basic, Core/Objects, Morphisms/Iso

Constructions/Subobjects.lean → Core/Basic
Constructions/Quotients.lean  → Core/Basic, Core/Objects
Constructions/Products.lean   → Core/Basic, Morphisms/Hom
Constructions/Universal.lean  → Core/Basic, Core/Objects, Morphisms/Iso

Properties/Invariants.lean       → Core/Basic, Constructions/Subobjects
Properties/Preservation.lean     → Core/Basic, Properties/Invariants
Properties/ClassificationData.lean → Core/Basic, Constructions/Subobjects

Theorems/Basic.lean               → Core/Basic, Core/Objects, Morphisms/Iso
Theorems/Classification.lean      → Core/Basic, Constructions/Subobjects, Properties/ClassificationData, Morphisms/Equiv
Theorems/Main.lean                → Theorems/Basic, Theorems/Classification, Properties/Preservation
Theorems/UniversalProperties.lean → Theorems/Basic, Constructions/Universal

Examples/Standard.lean        → Core/Basic, Morphisms/Hom
Examples/Counterexamples.lean → Core/Basic, Morphisms/Iso, Constructions/Subobjects

Bridges/ToAlgebra.lean        → Core/Basic, Core/Objects
Bridges/ToTopology.lean       → Core/Basic, Morphisms/Iso, Constructions/Universal
Bridges/ToGeometry.lean       → Core/Basic, Core/Objects
Bridges/ToComputation.lean    → Core/Basic, Morphisms/Hom
```

## External Dependencies

- `mini-object-kernel` (Object typeclass, TheoryName)
- `mini-complex-numbers` (Complex number type)
- `mini-holomorphic-functions` (Holomorphic function type)
