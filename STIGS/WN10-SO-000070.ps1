 Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-03-04
    Last Modified   : 2025-03-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010 (V2R8)

.TESTED ON
    Date(s) Tested  :
    Tested By       :
    Systems Tested  :  
    PowerShell Ver. : 

.USAGE
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000070).ps1 
#>
# Define the inactivity timeout (900 seconds = 15 minutes)
$timeout = 900  

# Registry path for the policy-controlled screensaver settings
$regPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System"

# Ensure the registry path exists
if (-Not (Test-Path $regPath)) {
    Write-Output "Registry path does not exist. Creating..."
    New-Item -Path $regPath -Force
}

# Set the inactivity timeout for system lock
Set-ItemProperty -Path $regPath -Name "InactivityTimeoutSecs" -Value $timeout -Type DWord

# Set the screensaver to require password on resume
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value "1" -Type String
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaveActive" -Value "1" -Type String
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value $timeout -Type String

# Enforce Group Policy update
gpupdate /force

Write-Output "System inactivity timeout has been set to 15 minutes and enforced via Group Policy."

