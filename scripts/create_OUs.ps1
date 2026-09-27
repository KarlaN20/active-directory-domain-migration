# ============================================================
# ANDESDATA - CREACION DE ESTRUCTURA DE OUs
# Dominio: corp.andesdata.local
# ============================================================

Import-Module ActiveDirectory

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " ANDESDATA - ESTRUCTURA DE OUs" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# ============================================================
# 1. INFORMACION DEL DOMINIO
# ============================================================

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName

Write-Host "Dominio: $($Domain.DNSRoot)" -ForegroundColor Green
Write-Host ""

# ============================================================
# 2. OU PRINCIPAL
# ============================================================

$BaseOU = "OU=AndesData,$DomainDN"

if (-not (Get-ADOrganizationalUnit -Identity $BaseOU -ErrorAction SilentlyContinue)) {

    New-ADOrganizationalUnit `
        -Name "AndesData" `
        -Path $DomainDN

    Write-Host "[CREADA] OU=AndesData" -ForegroundColor Green
}
else {
    Write-Host "[EXISTE] OU=AndesData" -ForegroundColor Yellow
}

# ============================================================
# 3. OUs PRINCIPALES
# ============================================================

$MainOUs = @(
    "Groups",
    "Servers",
    "Users"
)

foreach ($OU in $MainOUs) {

    $OUPath = "OU=$OU,$BaseOU"

    if (-not (Get-ADOrganizationalUnit -Identity $OUPath -ErrorAction SilentlyContinue)) {

        New-ADOrganizationalUnit `
            -Name $OU `
            -Path $BaseOU

        Write-Host "[CREADA] OU=$OU" -ForegroundColor Green
    }
    else {
        Write-Host "[EXISTE] OU=$OU" -ForegroundColor Yellow
    }
}

# ============================================================
# 4. SUB-OUs DE GROUPS
# ============================================================

$GroupsOU = "OU=Groups,$BaseOU"

$GroupOUs = @(
    "Global",
    "Resource"
)

foreach ($OU in $GroupOUs) {

    $OUPath = "OU=$OU,$GroupsOU"

    if (-not (Get-ADOrganizationalUnit -Identity $OUPath -ErrorAction SilentlyContinue)) {

        New-ADOrganizationalUnit `
            -Name $OU `
            -Path $GroupsOU

        Write-Host "[CREADA] OU=Groups\$OU" -ForegroundColor Green
    }
    else {
        Write-Host "[EXISTE] OU=Groups\$OU" -ForegroundColor Yellow
    }
}

# ============================================================
# 5. SUB-OUs DE USERS
# ============================================================

$UsersOU = "OU=Users,$BaseOU"

$Departments = @(
    "TI",
    "RRHH",
    "Finanzas",
    "Operaciones",
    "Comercial",
    "Gerencia"
)

foreach ($Department in $Departments) {

    $OUPath = "OU=$Department,$UsersOU"

    if (-not (Get-ADOrganizationalUnit -Identity $OUPath -ErrorAction SilentlyContinue)) {

        New-ADOrganizationalUnit `
            -Name $Department `
            -Path $UsersOU

        Write-Host "[CREADA] OU=Users\$Department" -ForegroundColor Green
    }
    else {
        Write-Host "[EXISTE] OU=Users\$Department" -ForegroundColor Yellow
    }
}

# ============================================================
# 6. RESUMEN
# ============================================================

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " ESTRUCTURA DE OUs COMPLETADA"
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "AndesData" -ForegroundColor Green
Write-Host "├── Groups"
Write-Host "│   ├── Global"
Write-Host "│   └── Resource"
Write-Host "├── Servers"
Write-Host "└── Users"
Write-Host "    ├── TI"
Write-Host "    ├── RRHH"
Write-Host "    ├── Finanzas"
Write-Host "    ├── Operaciones"
Write-Host "    ├── Comercial"
Write-Host "    └── Gerencia"

Write-Host ""
Write-Host "Proceso terminado." -ForegroundColor Green
