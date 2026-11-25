###############################################################################
# Windows Features                                                            #
###############################################################################

Write-Host "Installing Windows Features..."

# RSAT tools to install (comment out any you don't want)
$capabilities = @(
    "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
    "Rsat.DHCP.Tools~~~~0.0.1.0"
    "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0"
    "Rsat.Dns.Tools~~~~0.0.1.0"
    "Rsat.LLDP.Tools~~~~0.0.1.0"
    # "Rsat.BitLocker.Recovery.Tools~~~~0.0.1.0"
    # "Rsat.CertificateServices.Tools~~~~0.0.1.0"
    # "Rsat.FailoverCluster.Management.Tools~~~~0.0.1.0"
    # "Rsat.FileServices.Tools~~~~0.0.1.0"
    # "Rsat.IPAM.Client.Tools~~~~0.0.1.0"
    # "Rsat.NetworkController.Tools~~~~0.0.1.0"
    # "Rsat.NetworkLoadBalancing.Tools~~~~0.0.1.0"
    # "Rsat.RemoteAccess.Management.Tools~~~~0.0.1.0"
    # "Rsat.ServerManager.Tools~~~~0.0.1.0"
    # "Rsat.Shielded.VM.Tools~~~~0.0.1.0"
    # "Rsat.StorageMigrationService.Management.Tools~~~~0.0.1.0"
    # "Rsat.StorageReplica.Tools~~~~0.0.1.0"
    # "Rsat.SystemInsights.Management.Tools~~~~0.0.1.0"
    # "Rsat.VolumeActivation.Tools~~~~0.0.1.0"
    # "Rsat.WSUS.Tools~~~~0.0.1.0"
)

foreach ($cap in $capabilities) {
    try {
        $state = (Get-WindowsCapability -Online -Name $cap -ErrorAction Stop).State
        if ($state -eq 'Installed') {
            Write-Host "  $cap already installed"
            continue
        }
        Write-Host "  Installing $cap..."
        Add-WindowsCapability -Online -Name $cap -ErrorAction Stop | Out-Null
    }
    catch {
        Write-Warning "  Failed to install ${cap}: $($_.Exception.Message)"
    }
}

##############################################################################
###												WINDOWS SUBSYSTEMS FOR LINUX										 ###
##############################################################################
if (!(Get-Command wsl -CommandType Application -ErrorAction Ignore)) {
	Write-Verbose -Message "Installing Windows SubSystems for Linux..."
	Start-Process -FilePath "PowerShell" -ArgumentList "wsl", "--install" -Verb RunAs -Wait -WindowStyle Hidden
}