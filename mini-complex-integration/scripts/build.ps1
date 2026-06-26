# Build script for mini-complex-integration
# Run from the package root directory

$ErrorActionPreference = "Stop"

Write-Host "Building mini-complex-integration..." -ForegroundColor Cyan

# Step 1: Check Lean toolchain
if (Test-Path "lean-toolchain") {
    $toolchain = Get-Content "lean-toolchain"
    Write-Host "Toolchain: $toolchain" -ForegroundColor Green
} else {
    Write-Host "ERROR: lean-toolchain not found!" -ForegroundColor Red
    exit 1
}

# Step 2: Run lake build
Write-Host "Running lake build..." -ForegroundColor Cyan
$result = lake build 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "BUILD FAILED:" -ForegroundColor Red
    Write-Host $result
    exit 1
}

Write-Host "BUILD SUCCESSFUL" -ForegroundColor Green

# Step 3: Run smoke tests
Write-Host "Running smoke tests..." -ForegroundColor Cyan
$smokeResult = lake env lean --run Test/Smoke.lean 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "SMOKE TESTS FAILED:" -ForegroundColor Red
    Write-Host $smokeResult
    exit 1
}

Write-Host $smokeResult
Write-Host "ALL CHECKS PASSED" -ForegroundColor Green
