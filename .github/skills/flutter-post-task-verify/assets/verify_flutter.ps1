param(
    [ValidateSet('windows', 'android', 'web')]
    [string]$Target = 'windows',

    [string]$DeviceId = '',

    [int]$SmokeSeconds = 20,

    [switch]$SkipTest,

    [switch]$SkipRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$results = [System.Collections.Generic.List[object]]::new()

function Add-Result {
    param(
        [string]$Step,
        [string]$Status,
        [int]$ExitCode,
        [string[]]$ErrorLines
    )

    $results.Add([pscustomobject]@{
            Step      = $Step
            Status    = $Status
            ExitCode  = $ExitCode
            ErrorText = ($ErrorLines -join "`n")
        }) | Out-Null
}

function Get-ErrorLines {
    param([string[]]$Lines)

    if (-not $Lines) { return @() }

    $patterns = @(
        ' error ',
        'error:',
        'exception',
        'failed',
        'unhandled',
        'E/flutter'
    )

    return $Lines | Where-Object {
        $line = $_.ToLowerInvariant()
        $matched = $false
        foreach ($p in $patterns) {
            if ($line.Contains($p)) {
                $matched = $true
                break
            }
        }
        $matched
    }
}

function Invoke-FlutterStep {
    param(
        [string]$Step,
        [string[]]$FlutterArgs,
        [switch]$ContinueOnFail
    )

    Write-Host "`n=== $Step ===" -ForegroundColor Cyan
    Write-Host "flutter $($FlutterArgs -join ' ')" -ForegroundColor DarkGray

    $output = @()
    $exitCode = 0
    $previousErrorActionPreference = $ErrorActionPreference

    try {
        $ErrorActionPreference = 'Continue'
        $output = @(& flutter @FlutterArgs 2>&1)
        $exitCode = if ($null -eq $LASTEXITCODE) { 0 } else { $LASTEXITCODE }
    }
    finally {
        $ErrorActionPreference = $previousErrorActionPreference
    }

    $output | ForEach-Object { Write-Host $_ }

    if ($exitCode -eq 0) {
        Add-Result -Step $Step -Status 'PASS' -ExitCode 0 -ErrorLines @()
        return
    }

    $errorLines = @(Get-ErrorLines -Lines $output)
    if (-not $errorLines -or $errorLines.Count -eq 0) {
        $errorLines = $output | Select-Object -Last 20
    }

    Add-Result -Step $Step -Status 'FAIL' -ExitCode $exitCode -ErrorLines ($errorLines | Select-Object -First 25)

    if (-not $ContinueOnFail) {
        throw "Step failed: $Step (exit code $exitCode)"
    }
}

function Invoke-SmokeRun {
    param(
        [string]$Target,
        [string]$DeviceId,
        [int]$Seconds
    )

    Write-Host "`n=== run smoke ===" -ForegroundColor Cyan

    $resolvedDevice = if ([string]::IsNullOrWhiteSpace($DeviceId)) {
        switch ($Target) {
            'windows' { 'windows' }
            'android' { 'android' }
            'web' { 'chrome' }
        }
    }
    else {
        $DeviceId
    }

    $flutterArgs = @('run', '-d', $resolvedDevice)

    $stdoutLogPath = Join-Path $env:TEMP ("flutter_smoke_stdout_" + [guid]::NewGuid().ToString('N') + ".log")
    $stderrLogPath = Join-Path $env:TEMP ("flutter_smoke_stderr_" + [guid]::NewGuid().ToString('N') + ".log")

    Write-Host "flutter $($flutterArgs -join ' ')" -ForegroundColor DarkGray
    Write-Host "Smoke duration: $Seconds seconds" -ForegroundColor DarkGray

    $proc = Start-Process -FilePath 'flutter' -ArgumentList $flutterArgs -RedirectStandardOutput $stdoutLogPath -RedirectStandardError $stderrLogPath -PassThru

    Start-Sleep -Seconds $Seconds

    if (-not $proc.HasExited) {
        Stop-Process -Id $proc.Id -Force
    }

    $lines = @()
    if (Test-Path $stdoutLogPath) {
        $lines += Get-Content -Path $stdoutLogPath -ErrorAction SilentlyContinue
        Remove-Item -Path $stdoutLogPath -ErrorAction SilentlyContinue
    }
    if (Test-Path $stderrLogPath) {
        $lines += Get-Content -Path $stderrLogPath -ErrorAction SilentlyContinue
        Remove-Item -Path $stderrLogPath -ErrorAction SilentlyContinue
    }

    $errorLines = @(Get-ErrorLines -Lines $lines)

    if ($errorLines.Count -gt 0) {
        Add-Result -Step 'run smoke' -Status 'FAIL' -ExitCode 1 -ErrorLines ($errorLines | Select-Object -First 25)
        throw 'Smoke run detected runtime errors.'
    }

    Add-Result -Step 'run smoke' -Status 'PASS' -ExitCode 0 -ErrorLines @()
}

function Print-Locations {
    param([string[]]$Lines)

    $locationRegexes = @(
        '(?<file>[A-Za-z]:\\[^:]+\.dart):(?<line>\d+):(?<col>\d+)',
        '(?<file>lib/[A-Za-z0-9_./-]+\.dart):(?<line>\d+):(?<col>\d+)'
    )

    $matchesFound = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($line in $Lines) {
        foreach ($regex in $locationRegexes) {
            $matches = [regex]::Matches($line, $regex)
            foreach ($m in $matches) {
                $value = "$($m.Groups['file'].Value):$($m.Groups['line'].Value):$($m.Groups['col'].Value)"
                if ($matchesFound.Add($value)) {
                    Write-Host "  - $value" -ForegroundColor Yellow
                }
            }
        }
    }

    if ($matchesFound.Count -eq 0) {
        Write-Host '  - (no explicit file:line found in captured error lines)' -ForegroundColor Yellow
    }
}

$overallFailed = $false

try {
    Invoke-FlutterStep -Step 'pub get' -FlutterArgs @('pub', 'get')
    Invoke-FlutterStep -Step 'analyze' -FlutterArgs @('analyze')

    if ($SkipTest) {
        Add-Result -Step 'test' -Status 'SKIPPED' -ExitCode 0 -ErrorLines @('Skipped by parameter: -SkipTest')
    }
    elseif (Test-Path 'test') {
        Invoke-FlutterStep -Step 'test' -FlutterArgs @('test')
    }
    else {
        Add-Result -Step 'test' -Status 'SKIPPED' -ExitCode 0 -ErrorLines @('No test directory found')
    }

    switch ($Target) {
        'windows' { Invoke-FlutterStep -Step 'build' -FlutterArgs @('build', 'windows', '--debug') }
        'android' { Invoke-FlutterStep -Step 'build' -FlutterArgs @('build', 'apk', '--debug') }
        'web' { Invoke-FlutterStep -Step 'build' -FlutterArgs @('build', 'web') }
    }

    if ($SkipRun) {
        Add-Result -Step 'run smoke' -Status 'SKIPPED' -ExitCode 0 -ErrorLines @('Skipped by parameter: -SkipRun')
    }
    else {
        Invoke-SmokeRun -Target $Target -DeviceId $DeviceId -Seconds $SmokeSeconds
    }
}
catch {
    $overallFailed = $true
    Write-Host "`nVerification interrupted: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host "`n==================== SUMMARY ====================" -ForegroundColor Cyan
$results | Format-Table Step, Status, ExitCode -AutoSize

$failedRows = @($results | Where-Object { $_.Status -eq 'FAIL' })
if ($failedRows.Count -gt 0) {
    Write-Host "`nBlocking error details:" -ForegroundColor Red
    foreach ($row in $failedRows) {
        Write-Host "`n[$($row.Step)]" -ForegroundColor Red
        $lines = @($row.ErrorText -split "`n") | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
        $lines | Select-Object -First 15 | ForEach-Object { Write-Host "  $_" }

        Write-Host 'Possible locations:' -ForegroundColor Yellow
        Print-Locations -Lines $lines
    }
}

if ($overallFailed -or $failedRows.Count -gt 0) {
    exit 1
}

Write-Host "`nVerification completed successfully." -ForegroundColor Green
exit 0
