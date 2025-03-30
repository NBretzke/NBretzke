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
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000082).ps1 
#>
# Define the audit category and subcategory
$auditCategory = "Object Access"
$auditSubcategory = "File Share"

# Get the current audit settings for File Share
$auditSetting = AuditPol /get /subcategory:"$auditSubcategory"

# Check if success auditing is already enabled
if ($auditSetting -match "Success") {
    Write-Output "Audit policy for '$auditSubcategory' (Success) is already enabled."
} else {
    Write-Output "Enabling audit policy for '$auditSubcategory' (Success)..."

    # Enable success auditing for File Share
    AuditPol /set /subcategory:"$auditSubcategory" /success:enable

    Write-Output "Audit policy for '$auditSubcategory' (Success) has been enabled."
}
