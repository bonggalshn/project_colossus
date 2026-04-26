$ErrorActionPreference = "Stop"

$projectDir = Join-Path $PSScriptRoot "colossus"

Write-Host "Stopping Colossus Engine..."

$lockFile = Join-Path $projectDir "colossus.pid"

if (Test-Path $lockFile) {
    $savedPid = Get-Content $lockFile -ErrorAction SilentlyContinue
    if ($savedPid) {
        $proc = Get-Process -Id $savedPid -ErrorAction SilentlyContinue
        if ($proc) {
            Write-Host "Stopping process $savedPid..."
            Stop-Process -Id $savedPid -Force -ErrorAction SilentlyContinue
            Write-Host "Colossus Engine stopped."
        }
    }
    Remove-Item $lockFile -Force
} else {
    Write-Host "No lock file found. Is the app running?"
}

$stdoutFile = Join-Path $projectDir "colossus.stdout.log"
$stderrFile = Join-Path $projectDir "colossus.stderr.log"

if (Test-Path $stdoutFile) { Remove-Item $stdoutFile -Force }
if (Test-Path $stderrFile) { Remove-Item $stderrFile -Force }

Write-Host "Done."