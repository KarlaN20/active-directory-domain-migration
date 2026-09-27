$Groups = @(
    "GG-TI",
    "GG-RRHH",
    "GG-FINANZAS",
    "GG-OPERACIONES",
    "GG-COMERCIAL",
    "GG-GERENCIA"
)

foreach ($Group in $Groups) {
    $Count = (Get-ADGroupMember $Group | Measure-Object).Count
    Write-Host "$Group : $Count usuarios"
}

$ResourceGroups = @(
    "DL-FS-TI-RW",
    "DL-FS-RRHH-RW",
    "DL-FS-FINANZAS-RW",
    "DL-FS-OPERACIONES-RW",
    "DL-FS-COMERCIAL-RW",
    "DL-FS-GERENCIA-RW"
)

foreach ($Group in $ResourceGroups) {
    Write-Host "`n$Group" -ForegroundColor Cyan
    Get-ADGroupMember $Group |
        Select-Object Name, SamAccountName, ObjectClass
}

Add-ADGroupMember -Identity "DL-FS-TI-RW" -Members "GG-TI"
Add-ADGroupMember -Identity "DL-FS-RRHH-RW" -Members "GG-RRHH"
Add-ADGroupMember -Identity "DL-FS-FINANZAS-RW" -Members "GG-FINANZAS"
Add-ADGroupMember -Identity "DL-FS-OPERACIONES-RW" -Members "GG-OPERACIONES"
Add-ADGroupMember -Identity "DL-FS-COMERCIAL-RW" -Members "GG-COMERCIAL"
Add-ADGroupMember -Identity "DL-FS-GERENCIA-RW" -Members "GG-GERENCIA"