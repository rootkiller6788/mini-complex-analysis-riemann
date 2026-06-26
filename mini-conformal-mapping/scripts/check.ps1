# Smoke check script for mini-conformal-mapping
Write-Output "mini-conformal-mapping check..."
lake build 2>&1
if ($LASTEXITCODE -eq 0) { Write-Output "BUILD OK" } else { Write-Output "BUILD FAILED" }
