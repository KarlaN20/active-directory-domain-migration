# Requisitos técnicos

## Máquinas virtuales

| **VM** | **Hostname** | **Sistema operativo** | **Rol principal** | **vCPU** | **RAM** | **Disco** | **IP** | **Dominio** |
|---|---|---|---|---:|---:|---:|---|---|
| **VM01** | DC01-SRC | Windows Server 2019 Standard Evaluation **Desktop Experience** | AD DS + DNS — Dominio origen | 2 | 3 GB | 50 GB | 10.10.10.10 | corp.andesdata.local |
| **VM02** | DC01-TGT | Windows Server 2022 Standard Evaluation **Desktop Experience** | AD DS + DNS — Dominio destino | 2 | 3 GB | 50 GB | 10.10.10.20 | ad.andesdata.pe |
| **VM03** | FS01 | Windows Server 2022 Standard Evaluation **Desktop Experience** | File Server | 2 | 2 GB | 60 GB | 10.10.10.30 | Inicialmente origen → destino |
| **VM04** | CLIENT-01 | Windows 11 Pro | Estación de trabajo principal | 2 | 4 GB | 50 GB | DHCP / reserva | Origen → destino |
| **VM05** | CLIENT-02 | Windows 11 Pro | Estación de trabajo de pruebas | 2 | 4 GB | 50 GB | DHCP / reserva | Origen → destino |
