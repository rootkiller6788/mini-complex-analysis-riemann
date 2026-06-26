#!/usr/bin/env bash
# Build script for mini-riemann-surfaces
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PACKAGE_DIR"

echo "Building mini-riemann-surfaces..."
lake build "$@"

echo ""
echo "Build complete. Running smoke tests..."
lake env lean --run Test/Smoke.lean

echo ""
echo "Running regression tests..."
lake env lean --run Test/Regression.lean

echo ""
echo "All checks passed."
