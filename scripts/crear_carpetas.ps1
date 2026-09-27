New-Item -Path "E:\Shares" -ItemType Directory -Force

$Folders = @(
    "TI",
    "RRHH",
    "Finanzas",
    "Operaciones",
    "Comercial",
    "Gerencia",
    "Public"
)

foreach ($Folder in $Folders) {
    New-Item -Path "E:\Shares\$Folder" -ItemType Directory -Force
}