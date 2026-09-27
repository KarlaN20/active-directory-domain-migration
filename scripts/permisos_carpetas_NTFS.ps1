$Permissions = @{
    "RRHH"        = "DL-FS-RRHH-RW"
    "Finanzas"    = "DL-FS-FINANZAS-RW"
    "Operaciones" = "DL-FS-OPERACIONES-RW"
    "Comercial"   = "DL-FS-COMERCIAL-RW"
    "Gerencia"    = "DL-FS-GERENCIA-RW"
}

foreach ($Folder in $Permissions.Keys) {

    $Path = "E:\Shares\$Folder"
    $Group = "ANDESCORP\$($Permissions[$Folder])"

    icacls $Path /inheritance:r
    icacls $Path /grant:r "BUILTIN\Administrators:(OI)(CI)(F)"
    icacls $Path /grant:r "NT AUTHORITY\SYSTEM:(OI)(CI)(F)"
    icacls $Path /grant:r "${Group}:(OI)(CI)(M)"

    Write-Host "Permisos configurados: $Folder -> $Group" -ForegroundColor Green
}