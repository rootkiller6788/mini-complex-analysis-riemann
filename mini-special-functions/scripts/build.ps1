# MiniSpecialFunctions Build Script
# Builds the Lake package and runs tests

param(
    [switch]$Run,
    [switch]$Test,
    [switch]$Bench,
    [switch]$Clean
)

$ErrorActionPreference = "Stop"
$BaseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir = Split-Path -Parent $BaseDir

Set-Location $ProjDir

Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  MiniSpecialFunctions Build Script" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan

if ($Clean) {
    Write-Host "[CLEAN] Removing build artifacts..." -ForegroundColor Yellow
    if (Test-Path "$ProjDir\.lake") {
        Remove-Item -Recurse -Force "$ProjDir\.lake"
    }
    Write-Host "[CLEAN] Done." -ForegroundColor Green
}

Write-Host "[BUILD] Running lake build..." -ForegroundColor Yellow
try {
    lake build
    if ($LASTEXITCODE -ne 0) {
        throw "Build failed with exit code $LASTEXITCODE"
    }
    Write-Host "[BUILD] Build successful." -ForegroundColor Green
} catch {
    Write-Host "[BUILD] Build FAILED: $_" -ForegroundColor Red
    exit 1
}

if ($Run) {
    Write-Host "[RUN] Executing Main.lean..." -ForegroundColor Yellow
    lake env lean --run Main.lean
    Write-Host "[RUN] Done." -ForegroundColor Green
}

if ($Test) {
    Write-Host "[TEST] Running basic tests..." -ForegroundColor Yellow
    try {
        lake env lean --run Test/Basic.lean
        if ($LASTEXITCODE -ne 0) {
            throw "Basic tests failed"
        }
        Write-Host "[TEST] Basic tests passed." -ForegroundColor Green
    } catch {
        Write-Host "[TEST] Basic tests FAILED: $_" -ForegroundColor Red
    }

    try {
        lake env lean --run Test/Laws.lean
        if ($LASTEXITCODE -ne 0) {
            throw "Law tests failed"
        }
        Write-Host "[TEST] Law tests passed." -ForegroundColor Green
    } catch {
        Write-Host "[TEST] Law tests FAILED: $_" -ForegroundColor Red
    }

    try {
        lake env lean --run Test/Objects.lean
        if ($LASTEXITCODE -ne 0) {
            throw "Object tests failed"
        }
        Write-Host "[TEST] Object tests passed." -ForegroundColor Green
    } catch {
        Write-Host "[TEST] Object tests FAILED: $_" -ForegroundColor Red
    }
}

if ($Bench) {
    Write-Host "[BENCH] Running full benchmark suite..." -ForegroundColor Yellow
    try {
        lake env lean --run Benchmark/FullSuite.lean
        if ($LASTEXITCODE -ne 0) {
            throw "Benchmark failed"
        }
        Write-Host "[BENCH] Benchmark complete." -ForegroundColor Green
    } catch {
        Write-Host "[BENCH] Benchmark FAILED: $_" -ForegroundColor Red
    }
}

Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Build script complete." -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════" -ForegroundColor Cyan
