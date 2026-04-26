param(
    [int]$port = 8080
)

$ErrorActionPreference = "Stop"

$projectDir = Join-Path $PSScriptRoot "colossus"

Write-Host "Starting Colossus Engine on port $port..."

$lockFile = Join-Path $projectDir "colossus.pid"

if (Test-Path $lockFile) {
    $existingPid = Get-Content $lockFile -ErrorAction SilentlyContinue
    if ($existingPid) {
        $existingProc = Get-Process -Id $existingPid -ErrorAction SilentlyContinue
        if ($existingProc) {
            Write-Host "Colossus Engine is already running (PID: $existingPid)"
            return
        }
    }
    Remove-Item $lockFile -Force
}

$mvnw = Join-Path $projectDir "mvnw.cmd"

$proc = Start-Process -FilePath $mvnw `
    -ArgumentList "spring-boot:run" `
    -WorkingDirectory $projectDir `
    -PassThru `
    -NoNewWindow `
    -RedirectStandardOutput "colossus.stdout.log" `
    -RedirectStandardError "colossus.stderr.log"

$proc.Id | Set-Content $lockFile

Write-Host "Process started with PID: $($proc.Id)"
Write-Host "Waiting for application to be ready..."

$maxAttempts = 30
$attempt = 0

while ($attempt -lt $maxAttempts) {
    $attempt++
    try {
        $response = Invoke-WebRequest -Uri $appUrl/api/health -TimeoutSec 2 -ErrorAction SilentlyContinue
        if ($response.StatusCode -eq 200) {
            Write-Host "Application is ready at $appUrl"
            Write-Host "Health check: $($response.StatusCode)"
            return
        }
    } catch {
        Start-Sleep -Seconds 1
    }
}

Write-Host "Warning: Application may not be fully ready. Check logs."