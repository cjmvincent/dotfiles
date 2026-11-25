###############################################################################
# Nerd Fonts                                                                  #
###############################################################################

$fonts   = @('Hack', 'SpaceMono')    # names as listed on nerdfonts.com
$fontDir = Join-Path $env:WINDIR 'Fonts'
$regPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts'

foreach ($font in $fonts) {
    Write-Host "Installing $font Nerd Font..."
    $zip = Join-Path $env:TEMP "$font.zip"
    $out = Join-Path $env:TEMP "nerdfont-$font"
    try {
        Invoke-WebRequest "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.zip" -OutFile $zip
        Expand-Archive $zip -DestinationPath $out -Force

        Get-ChildItem $out -Recurse -Include *.ttf, *.otf | ForEach-Object {
            $dest = Join-Path $fontDir $_.Name
            if (-not (Test-Path $dest)) {
                Copy-Item $_.FullName $dest
                New-ItemProperty -Path $regPath -Name "$($_.BaseName) (TrueType)" `
                    -Value $_.Name -PropertyType String -Force | Out-Null
            }
        }
    }
    catch {
        Write-Warning "  Failed to install ${font}: $($_.Exception.Message)"
    }
    finally {
        Remove-Item $zip, $out -Recurse -Force -ErrorAction SilentlyContinue
    }
}