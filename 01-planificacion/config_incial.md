# Configuración inicial — Entorno origen

La configuración inicial del dominio `corp.andesdata.local` se realiza mediante
tres scripts de PowerShell ubicados en la carpeta `scripts/` del proyecto.

Estos scripts permiten construir progresivamente la estructura base de Active
Directory, los usuarios y la organización de grupos antes de configurar los
recursos compartidos y sus permisos.

## Scripts utilizados

| Script | Ubicación | Función principal |
|---|---|---|
| `create_OUs.ps1` | `scripts/` | Crear la estructura de OUs |
| `Usuarios.ps1` | `scripts/` | Crear los 90 usuarios y asignarlos a sus grupos Globales |
| `configurar-grupos-agdlp.ps1` | `scripts/` | Configurar la relación entre grupos Globales y grupos Domain Local |

---

## 1. create_OUs.ps1

**Ubicación:** `scripts/create_OUs.ps1`

### Función

Este script crea la estructura organizativa inicial del dominio mediante
Organizational Units (OUs).

Su función se limita a preparar la estructura donde posteriormente se
organizarán los usuarios, grupos y servidores.

### Estructura creada

| OU | Tipo | Función |
|---|---|---|
| `AndesData` | OU principal | Contenedor principal de la estructura empresarial |
| `Groups` | OU | Contenedor para la organización de grupos |
| `Groups\Global` | OU | Organización de grupos Globales |
| `Groups\Resource` | OU | Organización de grupos Domain Local |
| `Servers` | OU | Organización de servidores |
| `Users` | OU | Contenedor principal de usuarios |
| `Users\TI` | OU | Usuarios del área de TI |
| `Users\RRHH` | OU | Usuarios del área de Recursos Humanos |
| `Users\Finanzas` | OU | Usuarios del área de Finanzas |
| `Users\Operaciones` | OU | Usuarios del área de Operaciones |
| `Users\Comercial` | OU | Usuarios del área Comercial |
| `Users\Gerencia` | OU | Usuarios del área de Gerencia |

### Resultado

```text
AndesData
├── Groups
│   ├── Global
│   └── Resource
├── Servers
└── Users
    ├── TI
    ├── RRHH
    ├── Finanzas
    ├── Operaciones
    ├── Comercial
    └── Gerencia
```

---

## 2. Usuarios.ps1

**Ubicación:** `scripts/Usuarios.ps1`

### Función

Este script se encarga de crear las cuentas de usuario del dominio
`corp.andesdata.local`.

Los usuarios son organizados de acuerdo con el departamento al que
pertenecen, utilizando las OUs creadas previamente por `create_OUs.ps1`.

El script define un total de **90 usuarios**, distribuidos entre los seis
departamentos de la organización, con **15 usuarios por departamento**.

### Distribución de usuarios

| Departamento | Cantidad | Grupo Global |
|---|---:|---|
| TI | 15 | `GG-TI` |
| RRHH | 15 | `GG-RRHH` |
| Finanzas | 15 | `GG-FINANZAS` |
| Operaciones | 15 | `GG-OPERACIONES` |
| Comercial | 15 | `GG-COMERCIAL` |
| Gerencia | 15 | `GG-GERENCIA` |
| **Total** | **90** | |

### Proceso realizado

El script realiza diferentes validaciones antes de crear las cuentas:

1. Verifica que la cantidad total de usuarios definida sea 90.
2. Comprueba que no existan nombres de usuario duplicados.
3. Verifica que existan 15 usuarios para cada departamento.
4. Identifica la OU correspondiente al departamento.
5. Crea cada cuenta de usuario dentro de la OU correspondiente.
6. Agrega cada usuario al grupo Global de su departamento.

Por ejemplo, un usuario perteneciente al área de Finanzas queda organizado
de la siguiente manera:

```text
Usuario de Finanzas
        ↓
OU=Users\Finanzas
        ↓
GG-FINANZAS
```

### Resultado

```text
Users
├── TI
│   └── 15 usuarios → GG-TI
├── RRHH
│   └── 15 usuarios → GG-RRHH
├── Finanzas
│   └── 15 usuarios → GG-FINANZAS
├── Operaciones
│   └── 15 usuarios → GG-OPERACIONES
├── Comercial
│   └── 15 usuarios → GG-COMERCIAL
└── Gerencia
    └── 15 usuarios → GG-GERENCIA
```

---

## 3. configurar-grupos-agdlp.ps1

**Ubicación:** `scripts/configurar-grupos-agdlp.ps1`

### Función

Este script configura la relación entre los grupos **Globales** y los grupos
**Domain Local** definidos en Active Directory.

La finalidad es implementar el modelo **AGDLP**, organizando la pertenencia
de los usuarios y preparando los grupos que posteriormente serán utilizados
para asignar permisos sobre los recursos compartidos.

La estructura utilizada es:

```text
Usuarios
    ↓
Grupos Globales
    ↓
Grupos Domain Local
    ↓
Permisos sobre recursos
```

### Relaciones configuradas

| Grupo Global | Grupo Domain Local |
|---|---|
| `GG-TI` | `DL-FS-TI-RW` |
| `GG-RRHH` | `DL-FS-RRHH-RW` |
| `GG-FINANZAS` | `DL-FS-FINANZAS-RW` |
| `GG-OPERACIONES` | `DL-FS-OPERACIONES-RW` |
| `GG-COMERCIAL` | `DL-FS-COMERCIAL-RW` |
| `GG-GERENCIA` | `DL-FS-GERENCIA-RW` |

### Proceso realizado

El script establece la relación entre cada grupo Global y su grupo Domain Local
correspondiente.

Por ejemplo, para el área de Finanzas:

```text
Usuarios de Finanzas
        ↓
GG-FINANZAS
        ↓
DL-FS-FINANZAS-RW
```

Para el área de TI:

```text
Usuarios de TI
        ↓
GG-TI
        ↓
DL-FS-TI-RW
```

La misma relación se aplica a los demás departamentos.

### Resultado

```text
GG-TI
   ↓
DL-FS-TI-RW

GG-RRHH
   ↓
DL-FS-RRHH-RW

GG-FINANZAS
   ↓
DL-FS-FINANZAS-RW

GG-OPERACIONES
   ↓
DL-FS-OPERACIONES-RW

GG-COMERCIAL
   ↓
DL-FS-COMERCIAL-RW

GG-GERENCIA
   ↓
DL-FS-GERENCIA-RW
```

> **Nota:** Este script configura únicamente la relación entre los grupos
> Globales y Domain Local. La configuración de permisos **NTFS y SMB** se
> realiza posteriormente y se documenta de forma independiente.

---

## 4. Orden de ejecución

Los tres scripts se ejecutan en el siguiente orden:

```text
1. create_OUs.ps1
        ↓
   Estructura de OUs
        ↓
2. Usuarios.ps1
        ↓
   Usuarios + Grupos Globales
        ↓
3. configurar-grupos-agdlp.ps1
        ↓
   Relación Global → Domain Local
```

Este orden permite construir progresivamente la estructura inicial del dominio:

1. Primero se crean las OUs.
2. Luego se crean y organizan los usuarios.
3. Finalmente se establece la relación entre los grupos Globales y Domain Local.

De esta manera, Active Directory queda preparado para la siguiente etapa del
proyecto: la configuración del servidor de archivos, los recursos compartidos
y sus permisos.

### Alcance de esta configuración

Esta etapa comprende:

- Creación de la estructura de OUs.
- Creación de los usuarios del dominio.
- Organización de usuarios por departamento.
- Creación y organización de grupos Globales.
- Configuración de la relación entre grupos Globales y Domain Local mediante
  AGDLP.

La configuración de permisos **NTFS y SMB** no forma parte de estos tres
scripts y se documenta posteriormente como una etapa independiente.

