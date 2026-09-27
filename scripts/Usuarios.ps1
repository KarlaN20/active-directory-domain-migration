# ============================================================
# ANDESDATA - CREACION DE USUARIOS SOURCE AD
# Dominio: corp.andesdata.local
# Total: 90 usuarios
# Password de laboratorio: soporte
# ============================================================

Import-Module ActiveDirectory

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " ANDESDATA - CREACION DE USUARIOS" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

# ============================================================
# 1. INFORMACION DEL DOMINIO
# ============================================================

$Domain = Get-ADDomain
$DomainDN = $Domain.DistinguishedName
$DNSRoot = $Domain.DNSRoot

Write-Host "Dominio: $DNSRoot" -ForegroundColor Green
Write-Host ""

# ============================================================
# 2. RUTAS DE LAS OUs
# ============================================================

$BaseOU = "OU=AndesData,$DomainDN"
$UsersOU = "OU=Users,$BaseOU"

# ============================================================
# 3. LISTA DE USUARIOS
# ============================================================

$Users = @()

# ------------------------------------------------------------
# TI - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="mlopez"; FirstName="Maria"; LastName="Lopez"; Department="TI"; Title="IT Manager"; Group="GG-TI"},
    @{Username="rgarcia"; FirstName="Roberto"; LastName="Garcia"; Department="TI"; Title="Systems Analyst"; Group="GG-TI"},
    @{Username="jramirez"; FirstName="Juan"; LastName="Ramirez"; Department="TI"; Title="Network Administrator"; Group="GG-TI"},
    @{Username="aperez"; FirstName="Andrea"; LastName="Perez"; Department="TI"; Title="Systems Technician"; Group="GG-TI"},
    @{Username="cquispe"; FirstName="Carlos"; LastName="Quispe"; Department="TI"; Title="IT Support Analyst"; Group="GG-TI"},
    @{Username="lrojas"; FirstName="Lucia"; LastName="Rojas"; Department="TI"; Title="Network Technician"; Group="GG-TI"},
    @{Username="dtorres"; FirstName="Diego"; LastName="Torres"; Department="TI"; Title="Systems Administrator"; Group="GG-TI"},
    @{Username="mcastillo"; FirstName="Mariana"; LastName="Castillo"; Department="TI"; Title="Security Analyst"; Group="GG-TI"},
    @{Username="fmedina"; FirstName="Fernando"; LastName="Medina"; Department="TI"; Title="Help Desk Analyst"; Group="GG-TI"},
    @{Username="sgutierrez"; FirstName="Sofia"; LastName="Gutierrez"; Department="TI"; Title="Infrastructure Analyst"; Group="GG-TI"},
    @{Username="jvargas"; FirstName="Jorge"; LastName="Vargas"; Department="TI"; Title="Network Technician"; Group="GG-TI"},
    @{Username="nromero"; FirstName="Natalia"; LastName="Romero"; Department="TI"; Title="IT Support Specialist"; Group="GG-TI"},
    @{Username="hlozano"; FirstName="Hector"; LastName="Lozano"; Department="TI"; Title="Systems Technician"; Group="GG-TI"},
    @{Username="pnavarro"; FirstName="Paola"; LastName="Navarro"; Department="TI"; Title="IT Analyst"; Group="GG-TI"},
    @{Username="evilla"; FirstName="Eduardo"; LastName="Villa"; Department="TI"; Title="Infrastructure Technician"; Group="GG-TI"}
)

# ------------------------------------------------------------
# RRHH - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="jtorres"; FirstName="Jorge"; LastName="Torres"; Department="RRHH"; Title="HR Manager"; Group="GG-RRHH"},
    @{Username="acastro"; FirstName="Ana"; LastName="Castro"; Department="RRHH"; Title="HR Analyst"; Group="GG-RRHH"},
    @{Username="mfernandez"; FirstName="Monica"; LastName="Fernandez"; Department="RRHH"; Title="HR Specialist"; Group="GG-RRHH"},
    @{Username="lramirez"; FirstName="Luis"; LastName="Ramirez"; Department="RRHH"; Title="Recruitment Analyst"; Group="GG-RRHH"},
    @{Username="cortiz"; FirstName="Carla"; LastName="Ortiz"; Department="RRHH"; Title="HR Assistant"; Group="GG-RRHH"},
    @{Username="rnavarro"; FirstName="Rosa"; LastName="Navarro"; Department="RRHH"; Title="Payroll Analyst"; Group="GG-RRHH"},
    @{Username="gfuentes"; FirstName="Gabriela"; LastName="Fuentes"; Department="RRHH"; Title="HR Assistant"; Group="GG-RRHH"},
    @{Username="pquispe"; FirstName="Patricia"; LastName="Quispe"; Department="RRHH"; Title="HR Analyst"; Group="GG-RRHH"},
    @{Username="dparedes"; FirstName="Daniel"; LastName="Paredes"; Department="RRHH"; Title="Recruitment Specialist"; Group="GG-RRHH"},
    @{Username="srojas"; FirstName="Sandra"; LastName="Rojas"; Department="RRHH"; Title="HR Analyst"; Group="GG-RRHH"},
    @{Username="mhuaman"; FirstName="Miguel"; LastName="Huaman"; Department="RRHH"; Title="Payroll Specialist"; Group="GG-RRHH"},
    @{Username="vsalazar"; FirstName="Veronica"; LastName="Salazar"; Department="RRHH"; Title="HR Coordinator"; Group="GG-RRHH"},
    @{Username="apoma"; FirstName="Alberto"; LastName="Poma"; Department="RRHH"; Title="HR Assistant"; Group="GG-RRHH"},
    @{Username="kchavez"; FirstName="Karen"; LastName="Chavez"; Department="RRHH"; Title="Recruitment Analyst"; Group="GG-RRHH"},
    @{Username="eavila"; FirstName="Elena"; LastName="Avila"; Department="RRHH"; Title="HR Specialist"; Group="GG-RRHH"}
)

# ------------------------------------------------------------
# FINANZAS - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="lquispe"; FirstName="Lucia"; LastName="Quispe"; Department="Finanzas"; Title="Finance Manager"; Group="GG-FINANZAS"},
    @{Username="pmendoza"; FirstName="Pedro"; LastName="Mendoza"; Department="Finanzas"; Title="Senior Accountant"; Group="GG-FINANZAS"},
    @{Username="fchavez"; FirstName="Fabian"; LastName="Chavez"; Department="Finanzas"; Title="Financial Analyst"; Group="GG-FINANZAS"},
    @{Username="rparedes"; FirstName="Rocio"; LastName="Paredes"; Department="Finanzas"; Title="Accountant"; Group="GG-FINANZAS"},
    @{Username="jflores"; FirstName="Julio"; LastName="Flores"; Department="Finanzas"; Title="Financial Analyst"; Group="GG-FINANZAS"},
    @{Username="cmendoza"; FirstName="Claudia"; LastName="Mendoza"; Department="Finanzas"; Title="Accountant"; Group="GG-FINANZAS"},
    @{Username="hvaldez"; FirstName="Hugo"; LastName="Valdez"; Department="Finanzas"; Title="Treasury Analyst"; Group="GG-FINANZAS"},
    @{Username="srodriguez"; FirstName="Silvia"; LastName="Rodriguez"; Department="Finanzas"; Title="Accountant"; Group="GG-FINANZAS"},
    @{Username="mzamora"; FirstName="Marco"; LastName="Zamora"; Department="Finanzas"; Title="Financial Analyst"; Group="GG-FINANZAS"},
    @{Username="lcardenas"; FirstName="Laura"; LastName="Cardenas"; Department="Finanzas"; Title="Accountant"; Group="GG-FINANZAS"},
    @{Username="dnavarro"; FirstName="David"; LastName="Navarro"; Department="Finanzas"; Title="Treasury Specialist"; Group="GG-FINANZAS"},
    @{Username="apena"; FirstName="Andrea"; LastName="Pena"; Department="Finanzas"; Title="Finance Assistant"; Group="GG-FINANZAS"},
    @{Username="jcampos"; FirstName="Jose"; LastName="Campos"; Department="Finanzas"; Title="Accountant"; Group="GG-FINANZAS"},
    @{Username="nrios"; FirstName="Natalia"; LastName="Rios"; Department="Finanzas"; Title="Financial Analyst"; Group="GG-FINANZAS"},
    @{Username="vgomez"; FirstName="Victor"; LastName="Gomez"; Department="Finanzas"; Title="Finance Specialist"; Group="GG-FINANZAS"}
)

# ------------------------------------------------------------
# OPERACIONES - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="dhuaman"; FirstName="Daniel"; LastName="Huaman"; Department="Operaciones"; Title="Operations Manager"; Group="GG-OPERACIONES"},
    @{Username="jcondori"; FirstName="Javier"; LastName="Condori"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="mquispe"; FirstName="Manuel"; LastName="Quispe"; Department="Operaciones"; Title="Operations Specialist"; Group="GG-OPERACIONES"},
    @{Username="arojas"; FirstName="Alexandra"; LastName="Rojas"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="cgarcia"; FirstName="Christian"; LastName="Garcia"; Department="Operaciones"; Title="Operations Assistant"; Group="GG-OPERACIONES"},
    @{Username="lmedina"; FirstName="Luis"; LastName="Medina"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="pmorales"; FirstName="Paola"; LastName="Morales"; Department="Operaciones"; Title="Operations Specialist"; Group="GG-OPERACIONES"},
    @{Username="rhuaman"; FirstName="Ruben"; LastName="Huaman"; Department="Operaciones"; Title="Operations Technician"; Group="GG-OPERACIONES"},
    @{Username="fcastro"; FirstName="Fiorella"; LastName="Castro"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="jespinoza"; FirstName="Jose"; LastName="Espinoza"; Department="Operaciones"; Title="Operations Specialist"; Group="GG-OPERACIONES"},
    @{Username="mvelasquez"; FirstName="Maria"; LastName="Velasquez"; Department="Operaciones"; Title="Operations Assistant"; Group="GG-OPERACIONES"},
    @{Username="tlopez"; FirstName="Tania"; LastName="Lopez"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="galarcon"; FirstName="Gustavo"; LastName="Alarcon"; Department="Operaciones"; Title="Operations Technician"; Group="GG-OPERACIONES"},
    @{Username="srojas2"; FirstName="Sergio"; LastName="Rojas"; Department="Operaciones"; Title="Operations Analyst"; Group="GG-OPERACIONES"},
    @{Username="kflores"; FirstName="Karla"; LastName="Flores"; Department="Operaciones"; Title="Operations Specialist"; Group="GG-OPERACIONES"}
)

# ------------------------------------------------------------
# COMERCIAL - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="cparedes"; FirstName="Carlos"; LastName="Paredes"; Department="Comercial"; Title="Sales Manager"; Group="GG-COMERCIAL"},
    @{Username="ssalazar"; FirstName="Sofia"; LastName="Salazar"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="jortiz"; FirstName="Jorge"; LastName="Ortiz"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="mrojas"; FirstName="Melissa"; LastName="Rojas"; Department="Comercial"; Title="Account Executive"; Group="GG-COMERCIAL"},
    @{Username="rfernandez"; FirstName="Raul"; LastName="Fernandez"; Department="Comercial"; Title="Sales Analyst"; Group="GG-COMERCIAL"},
    @{Username="dcastillo"; FirstName="Diego"; LastName="Castillo"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="lgarcia"; FirstName="Laura"; LastName="Garcia"; Department="Comercial"; Title="Account Executive"; Group="GG-COMERCIAL"},
    @{Username="aparedes"; FirstName="Alison"; LastName="Paredes"; Department="Comercial"; Title="Sales Analyst"; Group="GG-COMERCIAL"},
    @{Username="fmendoza"; FirstName="Fabian"; LastName="Mendoza"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="ncastro"; FirstName="Nicole"; LastName="Castro"; Department="Comercial"; Title="Sales Assistant"; Group="GG-COMERCIAL"},
    @{Username="jvargas2"; FirstName="Juan"; LastName="Vargas"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="cmedina"; FirstName="Claudia"; LastName="Medina"; Department="Comercial"; Title="Account Executive"; Group="GG-COMERCIAL"},
    @{Username="hrodriguez"; FirstName="Hernan"; LastName="Rodriguez"; Department="Comercial"; Title="Sales Analyst"; Group="GG-COMERCIAL"},
    @{Username="mfuentes"; FirstName="Mariela"; LastName="Fuentes"; Department="Comercial"; Title="Sales Executive"; Group="GG-COMERCIAL"},
    @{Username="pzamora"; FirstName="Patricia"; LastName="Zamora"; Department="Comercial"; Title="Sales Coordinator"; Group="GG-COMERCIAL"}
)

# ------------------------------------------------------------
# GERENCIA - 15
# ------------------------------------------------------------

$Users += @(
    @{Username="vgomez2"; FirstName="Victor"; LastName="Gomez"; Department="Gerencia"; Title="General Manager"; Group="GG-GERENCIA"},
    @{Username="mrios"; FirstName="Mariana"; LastName="Rios"; Department="Gerencia"; Title="Executive Assistant"; Group="GG-GERENCIA"},
    @{Username="jvaldez"; FirstName="Jorge"; LastName="Valdez"; Department="Gerencia"; Title="Operations Director"; Group="GG-GERENCIA"},
    @{Username="lcastro"; FirstName="Luciana"; LastName="Castro"; Department="Gerencia"; Title="Commercial Director"; Group="GG-GERENCIA"},
    @{Username="fnavarro"; FirstName="Fernando"; LastName="Navarro"; Department="Gerencia"; Title="Finance Director"; Group="GG-GERENCIA"},
    @{Username="acarhuas"; FirstName="Ana"; LastName="Carhuas"; Department="Gerencia"; Title="Executive Assistant"; Group="GG-GERENCIA"},
    @{Username="dtorres2"; FirstName="Daniel"; LastName="Torres"; Department="Gerencia"; Title="Strategy Manager"; Group="GG-GERENCIA"},
    @{Username="slozano"; FirstName="Silvia"; LastName="Lozano"; Department="Gerencia"; Title="Executive Coordinator"; Group="GG-GERENCIA"},
    @{Username="rmedina"; FirstName="Ricardo"; LastName="Medina"; Department="Gerencia"; Title="Business Manager"; Group="GG-GERENCIA"},
    @{Username="pcastillo"; FirstName="Patricia"; LastName="Castillo"; Department="Gerencia"; Title="Executive Assistant"; Group="GG-GERENCIA"},
    @{Username="hgarcia"; FirstName="Hugo"; LastName="Garcia"; Department="Gerencia"; Title="Business Analyst"; Group="GG-GERENCIA"},
    @{Username="cvaldez"; FirstName="Claudia"; LastName="Valdez"; Department="Gerencia"; Title="Executive Coordinator"; Group="GG-GERENCIA"},
    @{Username="mrodriguez"; FirstName="Miguel"; LastName="Rodriguez"; Department="Gerencia"; Title="Strategy Analyst"; Group="GG-GERENCIA"},
    @{Username="equispe"; FirstName="Elisa"; LastName="Quispe"; Department="Gerencia"; Title="Executive Assistant"; Group="GG-GERENCIA"},
    @{Username="rlopez"; FirstName="Rafael"; LastName="Lopez"; Department="Gerencia"; Title="Business Analyst"; Group="GG-GERENCIA"}
)


# ============================================================
# 4. VALIDAR CANTIDAD
# ============================================================

Write-Host "Total de usuarios definidos: $($Users.Count)" -ForegroundColor Cyan

if ($Users.Count -ne 90) {

    Write-Host "ERROR: deben existir exactamente 90 usuarios." -ForegroundColor Red
    exit
}


# ============================================================
# 5. VALIDAR DUPLICADOS
# ============================================================


$Usernames = $Users | ForEach-Object {
    $_["Username"]
}

$Duplicates = $Usernames |
    Group-Object |
    Where-Object {$_.Count -gt 1}

if ($Duplicates) {

    Write-Host ""
    Write-Host "ERROR: existen usernames duplicados:" -ForegroundColor Red

    foreach ($Duplicate in $Duplicates) {
        Write-Host " - $($Duplicate.Name)" -ForegroundColor Red
    }

    exit
}

Write-Host "No existen usernames duplicados." -ForegroundColor Green


# ============================================================
# 6. VALIDAR 15 USUARIOS POR DEPARTAMENTO
# ============================================================

$Departments = @(
    "TI",
    "RRHH",
    "Finanzas",
    "Operaciones",
    "Comercial",
    "Gerencia"
)

foreach ($Department in $Departments) {

    $Count = ($Users | Where-Object {
        $_.Department -eq $Department
    }).Count

    if ($Count -ne 15) {

        Write-Host "ERROR: $Department tiene $Count usuarios." `
            -ForegroundColor Red

        exit
    }

    Write-Host "$Department : $Count usuarios OK" `
        -ForegroundColor Green
}


# ============================================================
# 7. PASSWORD COMUN
# ============================================================

$Password = ConvertTo-SecureString `
    "Soporte1*" `
    -AsPlainText `
    -Force


# ============================================================
# 8. CREAR USUARIOS
# ============================================================

Write-Host ""
Write-Host "Creando usuarios..." -ForegroundColor Cyan
Write-Host ""

$Created = 0
$Existing = 0

foreach ($User in $Users) {

    $UserOU = "OU=$($User.Department),$UsersOU"

    # Verificar OU
    $OUExists = Get-ADOrganizationalUnit `
        -Filter "DistinguishedName -eq '$UserOU'" `
        -ErrorAction SilentlyContinue

    if (-not $OUExists) {

        Write-Host "ERROR: No existe la OU $UserOU" `
            -ForegroundColor Red

        continue
    }

    # Buscar usuario
    $ExistingUser = Get-ADUser `
        -Filter "SamAccountName -eq '$($User.Username)'" `
        -ErrorAction SilentlyContinue

    if (-not $ExistingUser) {

        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName)" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -SamAccountName $User.Username `
            -UserPrincipalName "$($User.Username)@$DNSRoot" `
            -Department $User.Department `
            -Title $User.Title `
            -Path $UserOU `
            -AccountPassword $Password `
            -Enabled $true `
            -PasswordNeverExpires $false `
            -ChangePasswordAtLogon $false

        $Created++

        Write-Host "[CREADO] $($User.Username) -> $($User.Department)" `
            -ForegroundColor Green
    }
    else {

        $Existing = $Existing + 1

        Write-Host "[EXISTE] $($User.Username)" `
            -ForegroundColor Yellow
    }

    # Agregar al grupo global
    Add-ADGroupMember `
        -Identity $User.Group `
        -Members $User.Username `
        -ErrorAction SilentlyContinue
}


# ============================================================
# 9. RESUMEN
# ============================================================

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " RESUMEN"
Write-Host "==================================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "Usuarios definidos : $($Users.Count)"
Write-Host "Usuarios creados   : $Created" -ForegroundColor Green
Write-Host "Usuarios existentes: $Existing" -ForegroundColor Yellow
Write-Host "Password           : soporte" -ForegroundColor Yellow

Write-Host ""
Write-Host "Proceso terminado." -ForegroundColor Green