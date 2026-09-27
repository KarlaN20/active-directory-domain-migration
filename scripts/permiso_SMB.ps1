$Shares = @(
    "TI",
    "RRHH",
    "Finanzas",
    "Operaciones",
    "Comercial",
    "Gerencia"
)

foreach ($Share in $Shares) {

    Grant-SmbShareAccess -Name $Share `
        -AccountName "Everyone" `
        -AccessRight Full `
        -Force

    Write-Host "SMB configurado: $Share -> Everyone = Full" -ForegroundColor Green
}