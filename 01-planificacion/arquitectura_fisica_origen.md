# Arquitectura física — Entorno origen

## Descripción

La arquitectura física inicial representa la distribución de la infraestructura de red de AndesData antes de la migración de dominio.

La empresa se encuentra distribuida en cuatro pisos, con dos áreas principales por piso. La Sala de Comunicaciones se encuentra en el primer piso junto a Recepción y concentra la infraestructura principal de red y servidores.

## Distribución física

| Piso | Áreas | Equipo de acceso |
|---|---|---|
| Piso 1 | Recepción | — |
| Piso 2 | TI y RRHH | SW-PISO02 |
| Piso 3 | Finanzas y Operaciones | SW-PISO03 |
| Piso 4 | Comercial y Gerencia | SW-PISO04 |

## Sala de Comunicaciones

La Sala de Comunicaciones concentra los principales componentes de infraestructura:

- **DC01-SRC:** controlador de dominio del entorno origen y servidor DNS.
- **FS01:** servidor de archivos.
- **SW-CORE:** equipo principal de la infraestructura de red.

## Backbone

Los switches de los pisos se interconectan con el `SW-CORE` mediante el backbone vertical del edificio.

El backbone representa la conexión principal entre la Sala de Comunicaciones y los switches de distribución de los pisos.

## Consideraciones

- La topología representa la distribución física de referencia del entorno origen.
- La segmentación lógica mediante redes/VLAN se documenta en la arquitectura lógica.
- `DC01-SRC` pertenece al dominio `corp.andesdata.local`.
- `FS01` proporciona los recursos compartidos utilizados por las áreas de la organización.

## Diagrama

<img width="519" height="386" alt="image" src="https://github.com/user-attachments/assets/e10406f0-522d-4ff9-9765-cbe1225fe94b" />

