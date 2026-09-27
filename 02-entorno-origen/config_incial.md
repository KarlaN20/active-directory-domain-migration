# Configuración inicial — Entorno origen

La configuración inicial del dominio `corp.andesdata.local` se realiza mediante
scripts de PowerShell ubicados en la carpeta `scripts/` del proyecto.

Estos scripts permiten construir progresivamente la estructura base de Active
Directory, los usuarios, la organización de grupos y la configuración inicial
del servidor de archivos antes de realizar las pruebas de acceso.

## Scripts utilizados

| Script | Ubicación | Función principal |
|---|---|---|
| `create_OUs.ps1` | `scripts/` | Crear la estructura de OUs |
| `Usuarios.ps1` | `scripts/` | Crear los 90 usuarios y asignarlos a sus grupos Globales |
| `configurar-grupos-agdlp.ps1` | `scripts/` | Configurar la relación entre grupos Globales y grupos Domain Local |
| `crear_carpetas.ps1` | `scripts/` | Crear la estructura de carpetas del File Server |
| `compartir_carpetas_SMB.ps1` | `scripts/` | Crear los recursos compartidos SMB |
| `permisos_SMB.ps1` | `scripts/` | Configurar los permisos de los recursos compartidos SMB |
| `permisos_carpetas_NTFS.ps1` | `scripts/` | Configurar los permisos NTFS de las carpetas |

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
> realiza posteriormente.

---

## 4. crear_carpetas.ps1

**Ubicación:** `scripts/crear_carpetas.ps1`

### Función

Este script crea la estructura de directorios que será utilizada por el
servidor de archivos `FS01`.

La estructura se crea dentro de la unidad `E:` en la carpeta `Shares`.

### Estructura creada

```text
E:\
└── Shares
    ├── TI
    ├── RRHH
    ├── Finanzas
    ├── Operaciones
    ├── Comercial
    ├── Gerencia
    └── Public
```

Las carpetas departamentales serán utilizadas posteriormente para configurar
los recursos compartidos y sus permisos.

La carpeta `Public` se mantiene como un recurso independiente para contenido
compartido.

### Resultado

Después de ejecutar el script, `FS01` dispone de la estructura física de
carpetas necesaria para continuar con la configuración del File Server.

> **Nota:** Este script únicamente crea las carpetas. No crea recursos
> compartidos SMB ni configura permisos NTFS o SMB.

---

## 5. compartir_carpetas_SMB.ps1

**Ubicación:** `scripts/compartir_carpetas_SMB.ps1`

### Función

Este script crea los recursos compartidos **SMB** a partir de las carpetas
creadas previamente en `E:\Shares`.

Cada carpeta se publica en la red mediante un nombre de recurso compartido.

### Recursos compartidos creados

| Carpeta | Recurso SMB |
|---|---|
| `E:\Shares\TI` | `\\FS01\TI` |
| `E:\Shares\RRHH` | `\\FS01\RRHH` |
| `E:\Shares\Finanzas` | `\\FS01\Finanzas` |
| `E:\Shares\Operaciones` | `\\FS01\Operaciones` |
| `E:\Shares\Comercial` | `\\FS01\Comercial` |
| `E:\Shares\Gerencia` | `\\FS01\Gerencia` |
| `E:\Shares\Public` | `\\FS01\Public` |

Por ejemplo:

```text
E:\Shares\Finanzas
        ↓
   Recurso SMB
        ↓
\\FS01\Finanzas
```

### Resultado

Los usuarios y equipos de la red pueden localizar los recursos mediante las
rutas UNC correspondientes.

> **Nota:** Este script crea los recursos compartidos SMB, pero no establece
> todavía los permisos específicos de acceso.

---

## 6. permisos_SMB.ps1

**Ubicación:** `scripts/permisos_SMB.ps1`

### Función

Este script configura los permisos de los recursos compartidos SMB
departamentales.

Para estos recursos se establece `Everyone` con acceso **Full** a nivel SMB.

### Recursos configurados

| Recurso SMB | Cuenta | Permiso SMB |
|---|---|---|
| `TI` | `Everyone` | `Full` |
| `RRHH` | `Everyone` | `Full` |
| `Finanzas` | `Everyone` | `Full` |
| `Operaciones` | `Everyone` | `Full` |
| `Comercial` | `Everyone` | `Full` |
| `Gerencia` | `Everyone` | `Full` |

La configuración SMB proporciona un nivel amplio de acceso al recurso
compartido. El control específico por departamento se realiza posteriormente
mediante los permisos NTFS.

Por ejemplo:

```text
\\FS01\Finanzas
        ↓
SMB: Everyone → Full
        ↓
NTFS: DL-FS-FINANZAS-RW → Modify
```

> **Nota:** El recurso `Public` no se incluye en la configuración de permisos
> SMB de este script.

---

## 7. permisos_carpetas_NTFS.ps1

**Ubicación:** `scripts/permisos_carpetas_NTFS.ps1`

### Función

Este script configura los permisos **NTFS** de las carpetas departamentales
del servidor `FS01`.

Los permisos se asignan utilizando los grupos Domain Local definidos
previamente mediante el modelo AGDLP.

### Permisos configurados

| Carpeta | Grupo Domain Local | Permiso NTFS |
|---|---|---|
| `TI` | `DL-FS-TI-RW` | Modify |
| `RRHH` | `DL-FS-RRHH-RW` | Modify |
| `Finanzas` | `DL-FS-FINANZAS-RW` | Modify |
| `Operaciones` | `DL-FS-OPERACIONES-RW` | Modify |
| `Comercial` | `DL-FS-COMERCIAL-RW` | Modify |
| `Gerencia` | `DL-FS-GERENCIA-RW` | Modify |

Además, las carpetas mantienen permisos de **Full Control** para:

- `BUILTIN\Administrators`
- `NT AUTHORITY\SYSTEM`

La herencia de permisos se deshabilita en las carpetas departamentales para
permitir una configuración explícita de los permisos.

### Ejemplo

Para Finanzas:

```text
Usuario de Finanzas
        ↓
GG-FINANZAS
        ↓
DL-FS-FINANZAS-RW
        ↓
E:\Shares\Finanzas
        ↓
NTFS: Modify
```

Mientras que un usuario que no pertenezca al grupo correspondiente no recibe
el permiso NTFS definido para esa carpeta.

### Resultado

La combinación de permisos SMB y NTFS permite mantener un acceso amplio a
nivel de recurso compartido y aplicar el control específico mediante NTFS.

```text
Usuario
   ↓
Grupo Global
   ↓
Grupo Domain Local
   ↓
Permiso NTFS
   ↓
Carpeta
```

---

## 8. Orden de ejecución

Los scripts se ejecutan en el siguiente orden:

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
        ↓
4. crear_carpetas.ps1
        ↓
   Estructura de carpetas en FS01
        ↓
5. compartir_carpetas_SMB.ps1
        ↓
   Recursos compartidos SMB
        ↓
6. permisos_SMB.ps1
        ↓
   Permisos SMB
        ↓
7. permisos_carpetas_NTFS.ps1
        ↓
   Permisos NTFS
```

Este orden permite construir progresivamente el entorno, comenzando por la
estructura de Active Directory y finalizando con la configuración de acceso a
los recursos compartidos.

---

## 9. Flujo completo de acceso

La configuración implementada sigue el siguiente flujo:

```text
Usuario
   ↓
Grupo Global
   ↓
Grupo Domain Local
   ↓
Recurso compartido SMB
   ↓
Permisos NTFS
   ↓
Carpeta del departamento
```

Por ejemplo, para un usuario de Finanzas:

```text
Usuario de Finanzas
        ↓
   GG-FINANZAS
        ↓
DL-FS-FINANZAS-RW
        ↓
\\FS01\Finanzas
        ↓
E:\Shares\Finanzas
        ↓
      Modify
```

De esta manera, la pertenencia de los usuarios se administra mediante grupos
Globales, mientras que los permisos sobre los recursos se asignan mediante
grupos Domain Local.

---

## 10. Alcance de la configuración

Esta etapa comprende:

- Creación de la estructura de OUs.
- Creación de los usuarios del dominio.
- Organización de usuarios por departamento.
- Organización de grupos Globales.
- Configuración de grupos Domain Local.
- Implementación del modelo AGDLP.
- Creación de la estructura de carpetas del File Server.
- Creación de recursos compartidos SMB.
- Configuración de permisos SMB.
- Configuración de permisos NTFS.

Con esta configuración se deja preparado el entorno de origen para realizar
las pruebas de autenticación, acceso a recursos compartidos y validación de
permisos antes de iniciar la migración del dominio.

