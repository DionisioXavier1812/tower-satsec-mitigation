# Tower-SatSec Mitigation

Projeto focado em segurança, monitoramento e resposta a incidentes em ambientes de telecom com torres de transmissão e enlaces satelitais.

Ele combina:

- Documentação técnica (arquitetura, threat model, fluxos)
- Checklists operacionais
- Playbooks de resposta
- Relatórios de incidente
- Análise DFIR
- Automação via scripts PowerShell

---

## Arquitetura – Visão Geral

A arquitetura alvo é composta por:

- Torres de transmissão (infraestrutura física, energia, acesso físico)
- Enlaces satelitais (modem SAT, antena, satélite, estação terrestre)
- Rede local (switch, roteador, VLAN, SNMP, SSH)
- NOC/SOC (monitoramento, alertas, Sigma, resposta a incidentes)

Diagramas ASCII detalhados em:

- `docs/diagrama_arquitetura_satelital.md`
- `docs/diagrama_cadeia_comunicacao.md`

---

## Fluxo de auditoria e monitoramento

O projeto assume um fluxo de auditoria contínuo, incluindo:

1. Coleta de logs  
2. Correlação de eventos  
3. Auditoria periódica  
4. Identificação de gaps  
5. Geração de relatórios

Fluxos exemplificados em:

- `docs/fluxos_ataque.md`
- `examples/fluxo_investigacao.md`

---

## Cenários reais – Exemplos

Alguns cenários modelados no projeto:

- Perda de enlace satelital por falha ambiental  
- Intrusão física em torre  
- Ataque lógico via SSH/SNMP  

---

## Scripts – Como usar

### 1. Conversão para ASCII + Inglês

```powershell
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1

