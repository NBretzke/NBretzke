 Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-29-03
    Last Modified   : 2025-29-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175 (V2R8)

.TESTED ON
    Date(s) Tested  : 2025-29-03
    Tested By       : Nicholas Bretzke
    Systems Tested  : VM 
    PowerShell Ver. : 1.0

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000175).ps1 
#>
# Define registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat"

# Ensure the registry path exists
If (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set DisableInventory to 1 (Turn off Inventory Collector)
Set-ItemProperty -Path $RegPath -Name "DisableInventory" -Value 1 -Type DWord

# Force Group Policy update to apply changes
gpupdate /force

# Verify the configuration
Get-ItemProperty -Path $RegPath -Name "DisableInventory"

