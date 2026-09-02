<div align="center">

# 🚀 Tower-SatSec Mitigation

### 🔧 Ferramentas Rápidas

| Função | Botão |
|-------|-------|
| Gerar versões ASCII + Inglês | <kbd style="background:#4CAF50;color:white;padding:6px 12px;border-radius:6px;">converter_ascii_english_ultra.ps1</kbd> |
| Criar diagramas + READMEs | <kbd style="background:#2196F3;color:white;padding:6px 12px;border-radius:6px;">montar_diagramas_readmes.ps1</kbd> |
| Pipeline completa (1 comando) | <kbd style="background:#9C27B0;color:white;padding:6px 12px;border-radius:6px;">tudo_automatico.ps1</kbd> |

</div>

---

## 📡 Visão Geral

Este repositório reúne documentação, automações e modelos de segurança voltados para ambientes de telecom:

- Torres de transmissão  
- Enlaces satelitais  
- Modems SAT  
- Switches e roteadores  
- NOC/SOC  
- Fluxos de auditoria  
- Playbooks de resposta  
- Relatórios de incidente  
- Análises DFIR  

---

## 🛰️ Arquitetura

Diagramas ASCII completos:

- `docs/diagrama_arquitetura_satelital.md`
- `docs/diagrama_cadeia_comunicacao.md`

Eles representam:

- Satélite → Antena → Modem SAT → Switch → Rede local → NOC/SOC  
- Cadeia de telemetria  
- Fluxo de comunicação bidirecional  
- Pontos de falha e superfícies de ataque  

---

## 🔥 Fluxo de Auditoria

O projeto segue um fluxo de auditoria contínuo:

1. Coleta de logs (modem, switch, sensores físicos)  
2. Correlação (Sigma, SNMP, SSH, eventos ambientais)  
3. Auditoria de configuração  
4. Identificação de gaps  
5. Relatórios de incidente  

Fluxos detalhados em:

- `docs/fluxos_ataque.md`
- `examples/fluxo_investigacao.md`

---

## ⚠️ Cenários Reais

Modelos incluídos:

- Perda de enlace por temperatura  
- Intrusão física em torre  
- Ataque lógico via SSH/SNMP  
- Sabotagem de energia  
- Degradação progressiva de SNR  

Casos completos:

- `incident-reports/caso_completo_end_to_end.md`

---

## 🧰 Scripts – Como usar

### 🔹 1. Converter ASCII + Inglês

```powershell
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1
