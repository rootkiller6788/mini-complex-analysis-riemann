# MiniSpecialFunctions Clean Script
# Removes all build artifacts

$BaseDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjDir = Split-Path -Parent $BaseDir

Set-Location $ProjDir

Write-Host "Cleaning MiniSpecialFunctions..." -ForegroundColor Yellow

$dirsToClean = @(".lake", "build")
foreach ($dir in $dirsToClean) {
    $path = Join-Path $ProjDir $dir
    if (Test-Path $path) {
        Write-Host "  Removing $path..." -ForegroundColor Gray
        Remove-Item -Recurse -Force $path -ErrorAction SilentlyContinue
    }
}

Write-Host "Clean complete." -ForegroundColor Green
Write-Host "Run 'scripts/build.ps1' to rebuild." -ForegroundColor Green
