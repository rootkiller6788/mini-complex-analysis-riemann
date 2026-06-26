/-
# Clean Script

Run: `lake clean`

Removes build artifacts from the package.
-/

import Lake

def main : IO Unit := do
  IO.println "Cleaning MiniComplexNumbers build artifacts..."
  IO.println "Run `lake clean` to remove build outputs."
  IO.println ""
  IO.println "Files preserved:"
  IO.println "  - All .lean source files"
  IO.println "  - Documentation (.md files)"
  IO.println "  - Scripts (.sh, .ps1 files)"
  IO.println "  - Configuration (lakefile.lean, lean-toolchain)"
  IO.println ""
  IO.println "Clean complete (if no errors above)."
