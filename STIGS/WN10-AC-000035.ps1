    Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-02-04
    Last Modified   : 2025-02-04
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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000035).ps1 
#>
# Define the required minimum password length
$minPasswordLength = 14  

# Apply the password length policy
secedit /export /cfg C:\Windows\Temp\SecPolicy.inf

# Modify the policy file to set MinimumPasswordLength
$filePath = "C:\Windows\Temp\SecPolicy.inf"
(Get-Content $filePath) -replace "MinimumPasswordLength = \d+", "MinimumPasswordLength = $minPasswordLength" | Set-Content $filePath

# Reapply the security policy
secedit /configure /db c:\windows\security\local.sdb /cfg C:\Windows\Temp\SecPolicy.inf /areas SECURITYPOLICY /quiet

# Remove temporary file
Remove-Item -Path $filePath -Force

# Force update of Group Policy
gpupdate /force

Write-Output "Password minimum length policy has been successfully configured to $minPasswordLength characters."

