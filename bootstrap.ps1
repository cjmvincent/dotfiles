$ErrorActionPreference = 'Stop'
$ProgressPreference    = 'SilentlyContinue'   # progress bars make downloads very slow

# Windows PowerShell may default to old TLS versions that GitHub and the PowerShell Gallery reject
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

$DotfilesPath = $PSScriptRoot
$SetupPath    = Join-Path $DotfilesPath 'setup\windows'
$ScriptPath   = $MyInvocation.MyCommand.Path

### Elevate if needed (relaunch with the same PowerShell that is running now)
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Not running as Administrator, relaunching elevated..."
    $exe = (Get-Process -Id $PID).Path
    Start-Process -FilePath $exe -Verb RunAs `
        -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$ScriptPath`""
    exit
}

[Environment]::SetEnvironmentVariable('DOTFILES', $DotfilesPath, 'User')
$env:DOTFILES = $DotfilesPath

Clear-Host
Write-Host "========================================"
Write-Host "Windows Configuration Script Started"
Write-Host "========================================"
Write-Host "Dotfiles repo: $DotfilesPath"

### Check for and install winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not currently installed. Will attempt to install now..." -ForegroundColor Red
    Install-PackageProvider -Name NuGet -Force
    Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery
    Repair-WinGetPackageManager -AllUsers
}

### Install winget packages
$PackagesPath = Join-Path $DotfilesPath 'requirements\winget-packages.json'
if (-not (Test-Path $PackagesPath)) {
    Write-Host "winget package list not found at $PackagesPath" -ForegroundColor Red
    exit 1
}

$Packages = (Get-Content -Raw $PackagesPath | ConvertFrom-Json).packages
$AlreadyInstalled = -1978335189

foreach ($pkg in $Packages) {
    Write-Host "winget install $pkg"
    winget install --id $pkg --exact --source winget --silent `
        --accept-source-agreements --accept-package-agreements
    if ($LASTEXITCODE -ne 0 -and $LASTEXITCODE -ne $AlreadyInstalled) {
        Write-Warning "  winget exited $LASTEXITCODE for $pkg (continuing)"
    }
}

# Function to run setup scripts; if it fails, warn and keep going instead of aborting
function Invoke-Step {
    param([string]$Title, [string]$Script)
    Write-Host ""
    Write-Host "$Title" -ForegroundColor Cyan
    $path = Join-Path $SetupPath $Script
    if (-not (Test-Path $path)) {
        Write-Warning "  $Script not found, skipping"
        return
    }
    try {
        & $path
    }
    catch {
        Write-Warning "  $Script failed: $($_.Exception.Message)"
    }
}

### Setup scripts
Invoke-Step 'Applying Windows settings'      'Configure-WindowsSettings.ps1'
Invoke-Step 'Removing bloatware'             'Remove-Bloat.ps1'
Invoke-Step 'Installing Windows features'    'Install-WindowsFeatures.ps1'
Invoke-Step 'Configuring PowerShell'         'Configure-PowerShell.ps1'

### Install/Symlink dotfiles
$DotfilesInstallPath = Join-Path $DotfilesPath 'install.ps1'
if (-not (Test-Path $DotfilesInstallPath)) {
    Write-Host "Dotfiles install script not found at $DotfilesInstallPath" -ForegroundColor Red
    exit 1
}

### Windows Update (needs PSWindowsUpdate, installed by Configure-PowerShell.ps1)
Write-Host ""
Write-Host "Running Windows Update" -ForegroundColor Cyan
try {
    Import-Module PSWindowsUpdate
    Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
}
catch {
    Write-Warning "  Windows Update failed: $($_.Exception.Message)"
}

Write-Host ""
Write-Host "========================================"
Write-Host "Configuration complete."
Write-Host "IMPORTANT: Many changes require a system restart to take effect."
Write-Host ""

# Nudge user to authenticate with GitHub if gh is installed but not signed in.
# (gh was just installed, so refresh PATH from the registry first)
$env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
            [Environment]::GetEnvironmentVariable('Path', 'User')
if (Get-Command gh -ErrorAction SilentlyContinue) {
    # In 5.1, redirecting a program's error output while ErrorActionPreference
    # is Stop turns that output into a script-stopping error, so relax it here
    $ErrorActionPreference = 'Continue'
    & gh auth status *> $null
    $ErrorActionPreference = 'Stop'
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Next: run 'gh auth login' to set up GitHub SSH + credential helper"
    }
}

$restart = Read-Host "Would you like to restart now? (Y/N)"
if ($restart -match '^[Yy]') {
    Write-Host "Restarting in 10 seconds... Press Ctrl+C to cancel."
    Start-Sleep -Seconds 10
    Restart-Computer -Force
}
else {
    Write-Host "Please restart your computer manually when convenient."
    Read-Host "Press Enter to exit"
}