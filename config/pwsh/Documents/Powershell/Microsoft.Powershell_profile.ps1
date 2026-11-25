$ProfileDir = Split-Path -Parent $PROFILE
$FragmentDir = Join-Path $ProfileDir 'profile.d'

if (Test-Path $FragmentDir) {
    Get-ChildItem -Path $FragmentDir -Filter '*.ps1' | Sort-Object Name | ForEach-Object {
        . $_.FullName
    }
}

$LocalProfile = Join-Path $HOME '.pwsh.local.ps1'
if (Test-Path $LocalProfile) { . $LocalProfile }

