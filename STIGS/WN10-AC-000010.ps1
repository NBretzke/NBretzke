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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AC-000010).ps1 
#>
# # Set the account lockout threshold to 3 failed login attempts
secedit /configure /db c:\windows\security\local.sdb /cfg c:\windows\security\new.cfg /areas SECURITYPOLICY /quiet

# Apply the account lockout threshold using Local Security Policy
$badLogonLimit = 3  # STIG requires 3 or fewer
Secedit.exe /export /cfg C:\Windows\Temp\SecPolicy.inf

# Modify the policy file
$filePath = "C:\Windows\Temp\SecPolicy.inf"
(Get-Content $filePath) -replace "LockoutBadCount = \d+", "LockoutBadCount = $badLogonLimit" | Set-Content $filePath

# Reapply the security policy
secedit /configure /db c:\windows\security\local.sdb /cfg C:\Windows\Temp\SecPolicy.inf /areas SECURITYPOLICY /quiet

# Remove temporary file
Remove-Item -Path $filePath -Force

# Force update of Group Policy
gpupdate /force

Write-Output "Bad logon attempts policy has been successfully configured to $badLogonLimit."
