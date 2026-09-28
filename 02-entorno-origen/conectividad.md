# Validación de conectividad — Entorno origen

## 1. CLIENT-01 → DC01-SRC

### Verificar configuración de red

```powershell
ipconfig /all
```

**Validar:** El servidor DNS debe ser `10.10.10.10`.

### Probar conectividad

```powershell
ping 10.10.10.10
```

**Resultado esperado:** Respuestas exitosas, sin pérdida de paquetes.

---

## 2. Validar DNS y dominio

### Comprobar resolución DNS

```powershell
nslookup corp.andesdata.local
nslookup DC01-SRC.corp.andesdata.local
```

**Resultado esperado:** Ambos nombres deben resolver hacia `10.10.10.10`.

### Comprobar descubrimiento del controlador de dominio

```powershell
nltest /dsgetdc:corp.andesdata.local
```

**Resultado esperado:** Encontrar el controlador de dominio `DC01-SRC.corp.andesdata.local`.

---

## 3. CLIENT-01 → FS01

### Probar conectividad y resolución DNS

```powershell
ping 10.10.10.30
nslookup FS01.corp.andesdata.local
```

**Resultado esperado:**

* `FS01` debe responder a las solicitudes de conectividad.
* El nombre `FS01.corp.andesdata.local` debe resolver a `10.10.10.30`.

---

## 4. FS01 → DC01-SRC

**Equipo:** `FS01`

### Probar conectividad y resolución DNS

```powershell
ping 10.10.10.10
nslookup corp.andesdata.local
nslookup DC01-SRC.corp.andesdata.local
```

**Resultado esperado:** Conectividad con el controlador de dominio y resolución DNS correcta.

---

## 5. Acceso a recursos SMB

**Equipo:** `CLIENT-01`

### Verificar acceso a carpetas compartidas

```powershell
Test-Path "\\FS01\TI"
Test-Path "\\FS01\RRHH"
Test-Path "\\FS01\Finanzas"
Test-Path "\\FS01\Operaciones"
Test-Path "\\FS01\Comercial"
Test-Path "\\FS01\Gerencia"
Test-Path "\\FS01\Public"
```

**Resultado esperado:** Todos los comandos deben devolver `True`.

---

## 6. Verificar recursos compartidos

**Equipo:** `FS01`

### Enumerar recursos SMB

```powershell
Get-SmbShare
```

### Verificar permisos SMB

```powershell
Get-SmbShareAccess -Name "TI"
Get-SmbShareAccess -Name "Finanzas"
```

**Resultado esperado:**

* Los recursos compartidos deben existir.
* Los permisos SMB deben coincidir con la configuración definida para cada recurso.

---

## 7. Verificar servicios

### En DC01-SRC

```powershell
Get-Service NTDS
Get-Service DNS
```

### En FS01

```powershell
Get-Service LanmanServer
```

**Resultado esperado:** Todos los servicios deben mostrar el estado `Running`.

---

## 8. Registro de resultados

| N.º | Validación                          | Estado      | Observaciones |
| --- | ----------------------------------- | ----------- | ------------- |
| 1   | CLIENT-01 → DC01-SRC                | ⬜ Pendiente |               |
| 2   | Resolución DNS y dominio            | ⬜ Pendiente |               |
| 3   | CLIENT-01 → FS01                    | ⬜ Pendiente |               |
| 4   | FS01 → DC01-SRC                     | ⬜ Pendiente |               |
| 5   | Acceso a recursos SMB               | ⬜ Pendiente |               |
| 6   | Recursos compartidos y permisos SMB | ⬜ Pendiente |               |
| 7   | Servicios de infraestructura        | ⬜ Pendiente |               |

**Criterio de aceptación:** Todas las validaciones deben completarse satisfactoriamente antes de continuar con las siguientes etapas de la migración del dominio.
