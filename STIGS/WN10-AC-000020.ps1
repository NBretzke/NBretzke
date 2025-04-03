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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000020).ps1 
#>
# Define the required password history count
$passwordHistoryLimit = 24  

# Apply the password history policy
secedit /export /cfg C:\Windows\Temp\SecPolicy.inf

# Modify the policy file to set PasswordHistorySize
$filePath = "C:\Windows\Temp\SecPolicy.inf"
(Get-Content $filePath) -replace "PasswordHistorySize = \d+", "PasswordHistorySize = $passwordHistoryLimit" | Set-Content $filePath

# Reapply the security policy
secedit /configure /db c:\windows\security\local.sdb /cfg C:\Windows\Temp\SecPolicy.inf /areas SECURITYPOLICY /quiet

# Remove temporary file
Remove-Item -Path $filePath -Force

# Force update of Group Policy
gpupdate /force

Write-Output "Password history policy has been successfully configured to remember the last $passwordHistoryLimit passwords."

