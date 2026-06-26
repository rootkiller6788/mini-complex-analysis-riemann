# Build script for mini-riemann-surfaces (PowerShell)
param(
    [switch]$Test,
    [switch]$Bench,
    [switch]$All
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PackageDir = Split-Path -Parent $ScriptDir

Set-Location $PackageDir

Write-Host "Building mini-riemann-surfaces..." -ForegroundColor Green
lake build @args
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host ""
Write-Host "Build complete." -ForegroundColor Green

if ($Test -or $All) {
    Write-Host "Running smoke tests..." -ForegroundColor Green
    lake env lean --run Test/Smoke.lean

    Write-Host "Running regression tests..." -ForegroundColor Green
    lake env lean --run Test/Regression.lean
}

if ($Bench -or $All) {
    Write-Host "Running benchmarks..." -ForegroundColor Green
    lake env lean --run Benchmark/FullSuite.lean
}

Write-Host ""
Write-Host "All checks passed." -ForegroundColor Green
