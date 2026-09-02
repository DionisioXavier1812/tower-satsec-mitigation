# Tower & Satellite Security Mitigation — Technical Advanced Overview

[![Status](https://img.shields.io/badge/status-active-green)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()
[![Security](https://img.shields.io/badge/focus-security-critical%20infra-red)]()

Documento técnico avançado sobre riscos, arquitetura, ameaças e processos de mitigação em torres de transmissão e enlaces satelitais.

---

## Arquitetura Técnica

### Camada Física
- Antenas (parabólicas, painéis setoriais)
- Cabos coaxiais / waveguides
- Estrutura da torre (altura, acesso, proteção perimetral)
- Sensores ambientais (temperatura, vibração, porta)

### Camada de Enlace Satelital
- Modem SAT (SNR, RSSI, BER, telemetria)
- Protocolos TDMA/SCPC
- Downlink/Uplink
- Estação terrestre (gateway)

### Camada de Rede
- Switches (VLAN, SNMP, STP)
- Roteadores (ACL, BGP, OSPF)
- Monitoramento (Syslog, Netflow)
- Acesso remoto (SSH, VPN)

### Camada de Monitoramento
- NOC (operacional)
- SOC (segurança)
- Regras Sigma
- Alertas correlacionados

Diagramas completos em:
- `docs/diagrama_arquitetura_satelital.md`
- `docs/diagrama_cadeia_comunicacao.md`

---

## Threat Model Avançado

### Superfície de Ataque
- SSH exposto
- SNMP público
- Modem SAT sem hardening
- Acesso físico à torre
- Telemetria sem autenticação
- Falhas ambientais

### MITRE ATT&CK
- Reconnaissance: Port scanning, SNMP sweep
- Initial Access: SSH brute force
- Persistence: Configurações não auditadas
- Defense Evasion: Logs incompletos
- Impact: Perda de enlace, degradação de SNR

### STRIDE
- Spoofing  
- Tampering  
- Repudiation  
- Information Disclosure  
- Denial of Service  
- Elevation of Privilege  

---

## Cenários Técnicos Avançados

### Degradação progressiva de enlace
- SNR abaixo de 6 dB  
- RSSI instável  
- BER crescente  
- Modem em fallback  
- Perda total de comunicação  

### Intrusão física coordenada
- Sensor de porta dispara  
- Corte de energia  
- Antena desalinhada  
- Modem sem telemetria  
- Torre isolada  

### Ataque lógico simultâneo
- SSH brute force  
- SNMP walk não autorizado  
- Flood de pacotes  
- Switch sobrecarregado  
- Queda de VLAN crítica  

Casos completos:
- `incident-reports/caso_completo_end_to_end.md`

---

## Fluxo DFIR

### Coleta
- Logs do modem SAT  
- Syslog do switch  
- Telemetria histórica  
- Registros ambientais  

### Correlacionamento
- Sigma rules  
- Eventos de horário indevido  
- Queda de SNR + acesso físico  
- SSH brute force + SNMP scan  

### Análise
- Linha do tempo  
- Identificação de pivot  
- Causa raiz  

### Mitigação
- Hardening de modem  
- SNMP v3  
- ACLs restritivas  
- Proteção física reforçada  

---

## Scripts Técnicos

### Conversão ASCII + Inglês
Gera versões limpas para sistemas embarcados e documentação internacional.

### Criação de diagramas + READMEs
Organiza automaticamente toda a documentação interna.

### Pipeline completa
Executa tudo em um único comando:

