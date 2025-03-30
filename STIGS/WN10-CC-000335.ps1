    Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-30-03
    Last Modified   : 2025-30-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000335).ps1 
#>
# Registry path for WinRM client settings
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Ensure the registry path exists
if (-Not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the value to disable unencrypted traffic (0 = Disabled, 1 = Enabled)
Set-ItemProperty -Path $regPath -Name "AllowUnencryptedTraffic" -Value 0 -Type DWord

Write-Output "WinRM client has been configured to disallow unencrypted traffic."

