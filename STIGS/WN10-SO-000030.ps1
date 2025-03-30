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
