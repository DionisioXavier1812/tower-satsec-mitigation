# ================================
# Script: montar_projeto.ps1
# Autor: Dionisio (com Copilot)
# Objetivo: Criar e preencher TODOS os arquivos do projeto automaticamente
# ================================

Write-Host "Iniciando montagem automática do projeto..." -ForegroundColor Cyan

# Criar diretórios
$dirs = @(
    "docs",
    "checklists",
    "scripts",
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

# ================================
# Função para criar arquivos
# ================================
function Criar-Arquivo($caminho, $conteudo) {
    Set-Content -Path $caminho -Value $conteudo -Encoding UTF8
    Write-Host "Arquivo criado: $caminho"
}

# ================================
# Conteúdos dos arquivos
# ================================

# README.md
$readme = @"
# Tower & Satellite Security Mitigation

[![Status](https://img.shields.io/badge/status-active-green)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()
[![Security](https://img.shields.io/badge/focus-security-critical%20infra-red)]()

Projeto focado em **mapeamento e mitigação de vulnerabilidades** em torres de transmissão e enlaces satelitais.

## Objetivos

- Documentar riscos físicos e lógicos em infraestruturas críticas.
- Oferecer checklists de avaliação de segurança.
- Disponibilizar scripts simples para apoio à auditoria de serviços e portas.
- Servir como base para estudos, provas de conceito e melhoria contínua.

## Estrutura

- `docs/` – documentação técnica (arquitetura, modelo de ameaça).
- `checklists/` – listas de verificação para inspeção física e lógica.
- `scripts/` – scripts em shell para apoio à análise básica.
- `examples/` – cenários de uso e estudos de caso.

## Roadmap

- [x] Estrutura inicial do projeto
- [x] Documentação básica de arquitetura
- [x] Checklists físicos e lógicos
- [x] Scripts de auditoria básica
- [ ] Integração com ferramentas de monitoramento
- [ ] Modelos avançados de ameaça
- [ ] Casos de uso reais (ISPs, provedores regionais)

## Releases

- `v0.1.0` – Estrutura inicial, documentação básica, scripts simples.
- `v0.2.0` – Ampliação de checklists e threat model.
- `v0.3.0` – Integração com ferramentas externas (futuro).

---

## English Version

This project focuses on **mapping and mitigating vulnerabilities** in transmission towers and satellite links.

### Goals

- Document physical and logical risks in critical infrastructure.
- Provide security assessment checklists.
- Offer simple scripts to support basic service and port auditing.
- Serve as a foundation for studies, proof-of-concept, and continuous improvement.

### Structure

- `docs/` – technical documentation (architecture, threat model).
- `checklists/` – verification lists for physical and logical inspection.
- `scripts/` – shell scripts for basic analysis.
- `examples/` – usage scenarios and case studies.

> This project is **educational** and does not replace professional audits, regulatory standards, or formal technical reports.
"@

# LICENSE
$license = @"
MIT License

Copyright (c) 2026 Dionisio

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
"@

# .gitignore
$gitignore = @"
# Logs
*.log

# Sistema
.DS_Store
Thumbs.db

# Editor
.vscode/
.idea/

# Python
__pycache__/
*.pyc
"@

# docs/arquitetura_torres.md
$torres = @"
# Arquitetura de Torres de Transmissão

## Visão Geral
Torres de transmissão podem ser usadas para telecom, energia e enlaces PTP.

## Componentes
- Estrutura física
- Antenas
- Rádios
- Switches
- Energia
- Aterramento

## Superfície de Ataque
- Acesso físico
- Sabotagem
- Falhas de energia
"@

# docs/arquitetura_satelites.md
$satelites = @"
# Arquitetura de Enlaces Satelitais

## Componentes
- Antena VSAT
- Modem satelital
- Roteadores
- Backhaul
- Monitoramento

## Superfície de Ataque
- Acesso físico
- Configurações inseguras
- Falhas ambientais
"@

# docs/modelo_ameaca.md
$ameaca = @"
# Modelo de Ameaça

## Atores
- Intrusos físicos
- Atacantes de rede
- Funcionários negligentes

## Vetores
- Portas abertas
- Senhas fracas
- Falta de segmentação
"@

# docs/threat_model_stride.md
$stride = @"
# Threat Model – STRIDE

## S – Spoofing
- Acesso indevido ao modem satelital.

## T – Tampering
- Alteração de parâmetros de enlace.

## R – Repudiation
- Falta de logs adequados.

## I – Information Disclosure
- SNMP inseguro.

## D – Denial of Service
- Corte de energia.

## E – Elevation of Privilege
- Senhas padrão.
"@

# docs/threat_model_mitre.md
$mitre = @"
# MITRE ATT&CK – Infra Crítica

## Técnicas
- T1595 – Active Scanning
- T1046 – Network Service Scanning
- T1190 – Exploit Public-Facing Application
"@

# docs/fluxos_ataque.md
$fluxos = @"
# Fluxos de Ataque

1. Ataque físico
2. Ataque lógico
3. Ataque ambiental
"@

# docs/diagrama_ascii.md
$ascii = @"
# Diagrama ASCII

        +----------------------+
        |   Torre de Rádio     |
        +----------+-----------+
                   |
                   |
        +----------v-----------+
        |   Estação Terrena    |
        +----------------------+
"@

# checklists
$torre_fisico = @"
# Checklist Torre Física
- Portões seguros
- Antenas fixas
- Energia protegida
"@

$torre_logico = @"
# Checklist Torre Lógica
- Senhas fortes
- Portas fechadas
- Logs ativos
"@

$satelite_check = @"
# Checklist Satélite
- Antena alinhada
- Modem seguro
- Monitoramento ativo
"@

$plano = @"
# Plano de Mitigação
1. Identificação
2. Classificação
3. Correção
4. Monitoramento
"@

# examples
$ex_torre = @"
# Estudo de Caso – Torre Urbana
Problemas: cadeado quebrado, antena desalinhada.
"@

$ex_sat = @"
# Simulação de Incidente Satelital
Sintomas: alta latência, perda de pacotes.
"@

$ex_logs = @"
# Logs Exemplos
Jan 12: weak cipher detected
"@

# scripts
$scan_ports = @"
#!/usr/bin/env bash
echo 'Scan básico'
"@

$scan_sat = @"
#!/usr/bin/env bash
echo 'Scan satelital'
"@

$check_auto = @"
#!/usr/bin/env bash
echo 'Checklist automático'
"@

# ================================
# Criar arquivos
# ================================

Criar-Arquivo "README.md" $readme
Criar-Arquivo "LICENSE" $license
Criar-Arquivo ".gitignore" $gitignore

Criar-Arquivo "docs/arquitetura_torres.md" $torres
Criar-Arquivo "docs/arquitetura_satelites.md" $satelites
Criar-Arquivo "docs/modelo_ameaca.md" $ameaca
Criar-Arquivo "docs/threat_model_stride.md" $stride
Criar-Arquivo "docs/threat_model_mitre.md" $mitre
Criar-Arquivo "docs/fluxos_ataque.md" $fluxos
Criar-Arquivo "docs/diagrama_ascii.md" $ascii

Criar-Arquivo "checklists/checklist_torre_fisico.md" $torre_fisico
Criar-Arquivo "checklists/checklist_torre_logico.md" $torre_logico
Criar-Arquivo "checklists/checklist_satellite_link.md" $satelite_check
Criar-Arquivo "checklists/plano_mitigacao.md" $plano

Criar-Arquivo "examples/estudo_caso_torre_urbana.md" $ex_torre
Criar-Arquivo "examples/simulacao_incidente_satellite.md" $ex_sat
Criar-Arquivo "examples/logs_exemplo.md" $ex_logs

Criar-Arquivo "scripts/scan_ports.sh" $scan_ports
Criar-Arquivo "scripts/scan_satellite_services.sh" $scan_sat
Criar-Arquivo "scripts/checklist_auto.sh" $check_auto

Write-Host "Projeto montado com sucesso!" -ForegroundColor Green
