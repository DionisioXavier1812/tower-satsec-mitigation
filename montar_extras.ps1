# ================================
# Script: montar_extras.ps1
# Objetivo: Criar subpastas temáticas e arquivos extras automaticamente
# ================================

Write-Host "Iniciando montagem dos extras..." -ForegroundColor Cyan

# Criar subpastas
$dirs = @(
    "sigma-events",
    "incident-reports",
    "playbooks",
    "dfir-analysis",
    "examples"
)

foreach ($d in $dirs) {
    if (-Not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d | Out-Null
        Write-Host "Criado diretório: $d"
    } else {
        Write-Host "Diretório já existe: $d"
    }
}

function Criar-Arquivo($caminho, $conteudo) {
    Set-Content -Path $caminho -Value $conteudo -Encoding UTF8
    Write-Host "Arquivo criado: $caminho"
}

# ================================
# Conteúdos
# ================================

$examples_dashboard = @"
# Exemplos de Dashboards de Monitoramento

## 1. Dashboard de Torre (Telecom)
- Sinal RSSI em tempo real
- Alinhamento de antena
- Status de energia
- Alertas de intrusão física

## 2. Dashboard Satelital
- Latência média (ms)
- Perda de pacotes (%)
- Qualidade de enlace (SNR)
- Temperatura do modem

## 3. Dashboard de Segurança
- Tentativas de login SSH
- Portas abertas detectadas
- SNMP scans
- Eventos Sigma correlacionados
"@

$examples_sigma = @"
# Exemplos de Logs Sigma (Detecções)

## Regra: SSH Brute Force
detection:
  selection:
    EventID: 22
    Status: failed
  condition: selection

## Regra: Acesso físico fora do horário
detection:
  selection:
    DoorEvent: opened
    Time: /03:00|04:00|05:00/
  condition: selection

## Regra: Modem satelital travado
detection:
  selection:
    LogType: sat_modem
    Message: ""*no response*""
  condition: selection
"@

$examples_fluxo = @"
# Fluxo de Investigação – Torre/Satélite

1. Alerta inicial
2. Triagem
3. Coleta de evidências
4. Análise
5. Ação
6. Relatório
"@

$examples_diagramas = @"
# Diagramas ASCII – Incidentes

## 1. Perda de Enlace Satelital
[Modem] ---X--- [Antena] ----> [Satélite]
           ^
           |
         Falha

## 2. Intrusão Física
[Portão] --> [Sensor] --> [Alerta] --> [Dashboard]

## 3. Sabotagem de Energia
[Quadro Elétrico] --X--> [Modem] --> [Perda Total]
"@

$sigma_events = @"
# Alertas Sigma – Torre/Satélite

- SSH brute force
- SNMP scan
- Modem sem resposta
- Acesso físico fora do horário
"@

$incident_modelo = @"
# Modelo de Relatório de Incidente

1. Resumo Executivo
2. Linha do Tempo
3. Evidências
4. Causa Raiz
5. Recomendações
"@

$playbook_enlace = @"
# Playbook – Perda de Enlace Satelital

1. Confirmar alerta
2. Triagem
3. Ação
4. Recuperação
5. Documentação
"@

$dfir_analise = @"
# Análise Forense – Torre de Transmissão

- Coleta
- Preservação
- Análise
- Conclusão
"@

$incident_end_to_end = @"
# Caso Completo – Incidente Torre/Satélite (End-to-End)

1. Alerta inicial
2. Triagem
3. Investigação
4. Ação
5. Relatório executivo
6. Recomendações
"@

# ================================
# Criar arquivos
# ================================

Criar-Arquivo "examples/dashboard_prints.md" $examples_dashboard
Criar-Arquivo "examples/logs_sigma.md" $examples_sigma
Criar-Arquivo "examples/fluxo_investigacao.md" $examples_fluxo
Criar-Arquivo "examples/diagramas_incidentes.md" $examples_diagramas

Criar-Arquivo "sigma-events/alertas_sigma.md" $sigma_events
Criar-Arquivo "incident-reports/modelo_relatorio_incidente.md" $incident_modelo
Criar-Arquivo "incident-reports/caso_completo_end_to_end.md" $incident_end_to_end
Criar-Arquivo "playbooks/playbook_perda_enlace.md" $playbook_enlace
Criar-Arquivo "dfir-analysis/analise_forense_torre.md" $dfir_analise

Write-Host "Extras montados com sucesso!" -ForegroundColor Green
