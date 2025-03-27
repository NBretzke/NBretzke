    Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-26-03
    Last Modified   : 2024-26-03
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
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>
# Define the registry key path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Define the property name and desired value (32,768 KB)
$propertyName = "MaxSize"
$desiredValue = 32768

# Check if the registry path exists; if not, create it
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MaxSize property to the desired value
Set-ItemProperty -Path $registryPath -Name $propertyName -Value $desiredValue

Write-Output "Application event log size has been set to $desiredValue KB."
