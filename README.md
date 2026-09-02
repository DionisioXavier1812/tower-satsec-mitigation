# Tower-SatSec Mitigation

Projeto focado em seguranca, monitoramento e resposta a incidentes em ambientes de telecom com torres de transmissao e enlaces satelitais.

Ele combina:

- Documentacao tecnica (arquitetura, threat model, fluxos)
- Checklists operacionais
- Playbooks de resposta
- Relatorios de incidente
- Analise DFIR
- Automacao via scripts PowerShell

---

## Arquitetura – Visao Geral

A arquitetura alvo e composta por:

- **Torres de transmissao** (infraestrutura fisica, energia, acesso fisico)
- **Enlaces satelitais** (modem SAT, antena, satelite, estacao terrestre)
- **Rede local** (switch, roteador, VLAN, SNMP, SSH)
- **NOC/SOC** (monitoramento, alertas, Sigma, resposta a incidentes)

Diagrama ASCII detalhado em:

- `docs/diagrama_arquitetura_satelital.md`
- `docs/diagrama_cadeia_comunicacao.md`

---

## Fluxo de auditoria e monitoramento

O projeto assume um fluxo de auditoria continuo, incluindo:

1. **Coleta de logs**
   - Modem SAT (SNR, RSSI, temperatura, status de enlace)
   - Switch/roteador (SNMP, SSH, eventos de porta)
   - Sensores fisicos (acesso a torre, portao, energia)

2. **Correlacao de eventos**
   - Regras Sigma (SSH brute force, SNMP scan, modem sem resposta)
   - Alertas de horario indevido (acesso fisico fora da janela permitida)
   - Degradacao de enlace (queda de SNR, perda de pacotes)

3. **Auditoria**
   - Revisao periodica de configuracoes (SNMP, SSH, senhas, chaves)
   - Validacao de trilhas de auditoria (logs completos, timestamps, integridade)
   - Gaps identificados documentados em relatorios de incidente

Fluxos exemplificados em:

- `docs/fluxos_ataque.md`
- `examples/fluxo_investigacao.md`

---

## Cenarios reais – Exemplos

Alguns cenarios modelados no projeto:

- **Perda de enlace satelital por falha ambiental**
  - Temperatura elevada no modem
  - Degradacao progressiva de SNR
  - Perda total de comunicacao
  - Playbook: `playbooks/playbook_perda_enlace.md`
  - Relatorio: `incident-reports/caso_completo_end_to_end.md`

- **Intrusao fisica em torre**
  - Sensor de portao dispara fora do horario
  - Log de acesso fisico sem autorizacao
  - Possivel sabotagem de energia
  - Diagramas: `examples/diagramas_incidentes.md`

- **Ataque logico via SSH/SNMP**
  - Scan de portas
  - Tentativas de brute force em SSH
  - SNMP aberto com comunidade fraca
  - Sigma: `examples/logs_sigma.md`, `sigma-events/alertas_sigma.md`

---

## Scripts – Como usar

O projeto inclui uma pequena “pipeline” em PowerShell para automatizar tarefas:

### 1. Conversao para ASCII + Ingles

Script:

- `converter_ascii_english_ultra.ps1`

Funcao:

- Cria versoes sem acentos (ASCII) dos arquivos `.md`
- Cria versoes em ingles em `english-version/`

Uso:

```powershell
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1
