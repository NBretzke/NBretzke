    Author          : Nicholas Bretzke
    LinkedIn        : linkedin.com/in/nicholas-bretzke-931735164/
    GitHub          : github.com/NBretzke
    Date Created    : 2025-29-03
    Last Modified   : 2024-29-03
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
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000030).ps1 
    
    # Check if audit policy subcategories are enabled
    
$auditStatus = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -ErrorAction SilentlyContinue

if ($auditStatus.SCENoApplyLegacyAuditPolicy -ne 1) {
    Write-Output "Audit policy using subcategories is NOT enabled. Enabling now..."

    # Enable audit policy subcategories
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "SCENoApplyLegacyAuditPolicy" -Value 1

    Write-Output "Audit policy using subcategories has been ENABLED."
} else {
    Write-Output "Audit policy using subcategories is already ENABLED."
}
