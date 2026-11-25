###############################################################################
# Windows Programs with Rainbow Progress Bar & Spinner                        #
###############################################################################

$apps = @(
    "angryziber.AngryIPScanner"
    "Google.Chrome"
    "Microsoft.Office"
    "VideoLAN.VLC"
    "Discord.Discord"
    "Notepad++.Notepad++"
    "7zip.7zip"
    "Microsoft.PowerToys"
    "WinSCP.WinSCP"
    "Microsoft.WindowsTerminal"
    "Microsoft.VisualStudioCode"
    "Termius.Termius"
    "QMK.QMKToolbox"
    "Olivia.VIA"
    "Postman.Postman"
    "PuTTY.PuTTY"
    "Rufus.Rufus"
    "SlackTechnologies.Slack"
    "WiresharkFoundation.Wireshark"
    "ViviCoporation.Vivi"
    "VMware.WorkstationPlayer"
    "VMware.WorkstationPro"
    "Zoom.Zoom"
    "Teamviewer.Teamviewer"
)

# Function to draw a custom rainbow progress bar
function Show-ProgressBar {
    param(
        [int]$Current,
        [int]$Total,
        [string]$AppName
    )
    
    $percent = [math]::Round(($Current / $Total) * 100)
    $barLength = 50
    $filledLength = [math]::Round(($percent / 100) * $barLength)
    $emptyLength = $barLength - $filledLength
    
    # Rainbow colors for PowerShell
    $colors = @("Red", "DarkYellow", "Yellow", "Green", "Cyan", "Blue", "Magenta")
    
    Write-Host "`r[" -NoNewline
    
    # Draw filled portion with rainbow colors
    for ($i = 0; $i -lt $filledLength; $i++) {
        $colorIndex = [math]::Floor(($i / $barLength) * $colors.Count)
        if ($colorIndex -ge $colors.Count) { $colorIndex = $colors.Count - 1 }
        Write-Host "█" -NoNewline -ForegroundColor $colors[$colorIndex]
    }
    
    # Draw empty portion
    Write-Host ("░" * $emptyLength) -NoNewline -ForegroundColor DarkGray
    
    Write-Host "] " -NoNewline
    Write-Host "$percent% " -NoNewline -ForegroundColor Yellow
    Write-Host "($Current/$Total) " -NoNewline -ForegroundColor Gray
    Write-Host "Installing: " -NoNewline -ForegroundColor White
    Write-Host $AppName -ForegroundColor Green
}

### Check for winget, and install it if it's not already present
Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
    Install-Script -Name winget-install -Force
    Write-Host -ForegroundColor Green "Finished installing winget..."
}
else {
    Write-Host -ForegroundColor Green "WinGet is already installed. Skipping..."
}

### Loop through installing all of the apps listed above
$currentApp = 0

Foreach ($app in $apps) {
    $currentApp++
    
    # Extract friendly name from package ID
    $friendlyName = $app.Split('.')[-1]
    
    # Show overall progress bar
    Show-ProgressBar -Current $currentApp -Total $apps.Count -AppName $friendlyName
    
    # Install app (suppress winget's output)
    winget install --exact --silent --scope machine --accept-source-agreements --accept-package-agreements --disable-interactivity --id $app 2>&1 | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  ✓ " -NoNewline -ForegroundColor Green
        Write-Host "$friendlyName installed successfully" -ForegroundColor Gray
    }
    else {
        Write-Host "  ✗ " -NoNewline -ForegroundColor Red
        Write-Host "$friendlyName failed to install" -ForegroundColor Gray
    }
    Write-Host ""
}
