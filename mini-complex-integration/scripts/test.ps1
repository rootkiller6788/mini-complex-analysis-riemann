# Test script for mini-complex-integration
# Runs all test suites and benchmarks

$ErrorActionPreference = "Stop"

Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  MiniComplexIntegration Test Suite" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan

$testDir = "Test"
$benchDir = "Benchmark"
$compDir = "Computation"

# Run all test files
$tests = @(
    "$testDir/Smoke.lean",
    "$testDir/Examples.lean",
    "$testDir/Regression.lean"
)

foreach ($test in $tests) {
    Write-Host "`nRunning $test..." -ForegroundColor Yellow
    $result = lake env lean --run $test 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "FAILED: $test" -ForegroundColor Red
        Write-Host $result
        exit 1
    }
    Write-Host "PASSED: $test" -ForegroundColor Green
}

# Run benchmarks
$benchmarks = @(
    "$benchDir/ContourBench.lean",
    "$benchDir/CauchyBench.lean",
    "$benchDir/ResidueBench.lean",
    "$benchDir/WindingBench.lean",
    "$benchDir/MLInequalityBench.lean",
    "$benchDir/FullSuite.lean"
)

foreach ($bench in $benchmarks) {
    Write-Host "`nRunning benchmark $bench..." -ForegroundColor Yellow
    $result = lake env lean --run $bench 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "FAILED: $bench" -ForegroundColor Red
        Write-Host $result
        exit 1
    }
    Write-Host "PASSED: $bench" -ForegroundColor Green
}

Write-Host "`n═══════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  ALL TESTS AND BENCHMARKS PASSED" -ForegroundColor Green
Write-Host "═══════════════════════════════════════" -ForegroundColor Cyan
