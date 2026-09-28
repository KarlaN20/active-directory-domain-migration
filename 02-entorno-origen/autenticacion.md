# Validación de autenticación — Entorno origen

## 1. Verificar usuario

En `CLIENT-01` loguearse con un usuario de Finanzas:

```cmd
whoami
whoami /groups
```

## 2. Validar acceso al recurso del departamento

Iniciar sesión con un usuario de Finanzas.

Probar acceso a su carpeta:

```powershell
Test-Path "\\FS01\Finanzas"
```

**Esperado:**

```text
True
```

Probar acceso a una carpeta de otro departamento:

```powershell
Test-Path "\\FS01\TI"
```

**Esperado:**

```text
False
```

## 3. Validar permisos de escritura

Crear un archivo de prueba:

```powershell
"Prueba Finanzas" | Out-File "\\FS01\Finanzas\prueba.txt"
```

Comprobar:

```powershell
Test-Path "\\FS01\Finanzas\prueba.txt"
```

**Esperado:**

```text
True
```

Eliminar el archivo:

```powershell
Remove-Item "\\FS01\Finanzas\prueba.txt"
```
