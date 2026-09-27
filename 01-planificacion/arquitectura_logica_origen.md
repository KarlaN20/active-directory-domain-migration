# Arquitectura lógica — Entorno origen

## Descripción

La arquitectura lógica representa la organización de la red y los servicios utilizados por AndesData antes de la migración del dominio.

El entorno utiliza el dominio **corp.andesdata.local**, administrado mediante **Active Directory Domain Services (AD DS)** y **DNS**. El servidor `DC01-SRC` cumple estas funciones y `FS01` proporciona los recursos compartidos.

## Segmentación de red

| Subred | Áreas |
|---|---|
| `10.10.11.0/24` | TI y RRHH |
| `10.10.12.0/24` | Finanzas y Operaciones |
| `10.10.13.0/24` | Comercial y Gerencia |
| `10.10.10.0/24` | Servidores |

Las áreas ubicadas en un mismo piso comparten la subred correspondiente.

## Servicios principales

- **DC01-SRC:** AD DS + DNS — `10.10.10.10`
- **FS01:** File Server — `10.10.10.30`
- **Dominio:** `corp.andesdata.local`
- **SW-CORE:** núcleo de la infraestructura de red.

## Diagrama

<img width="633" height="362" alt="image" src="https://github.com/user-attachments/assets/0576a6af-3f51-4267-a39c-ef7ee66ce63d" />
