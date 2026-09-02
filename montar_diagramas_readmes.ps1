# ============================================
# Script: montar_diagramas_readmes.ps1
# Objetivo: Criar diagramas ASCII + READMEs internos automaticamente
# ============================================

Write-Host "Criando diagramas e READMEs..." -ForegroundColor Cyan

# Pastas alvo
$dirs = @(
    "docs",
    "examples",
    "sigma-events",
    "incident-reports",
    "playbooks",
    "dfir-analysis"
)

foreach ($d in $dirs) {
    if (-Not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d | Out-Null
        Write-Host "Criado diretorio: $d"
    }
}

function Criar-Arquivo($caminho, $conteudo) {
    Set-Content -Path $caminho -Value $conteudo -Encoding UTF8
    Write-Host "Arquivo criado: $caminho"
}

# ============================================
# Diagramas ASCII
# ============================================

$diag_arquitetura = @"
# Arquitetura de Comunicacao Satelital (ASCII)

                +----------------------+
                |      Satelite        |
                |   GEO / MEO / LEO    |
                +----------+-----------+
                           |
                           | Downlink
                           |
                +----------v-----------+
                |      Antena          |
                +----------+-----------+
                           |
                           | Cabo Coaxial
                           |
                +----------v-----------+
                |      Modem SAT       |
                +----------+-----------+
                           |
                           | Ethernet
                           |
                +----------v-----------+
                |      Switch          |
                +----------+-----------+
                           |
                           | Rede Local
                           |
                +----------v-----------+
                |      NOC / SOC       |
                +----------------------+
"@

$diag_fluxo_ataque = @"
# Fluxo de Ataque – Torre/Satelite (ASCII)

[Atacante]
    |
    | Recon
    v
[Scan SNMP / SSH]
    |
    | Brute force
    v
[Modem / Switch]
    |
    | Falha ambiental
    v
[Degradacao do enlace]
    |
    v
[Impacto no provedor]
"@

$diag_threat_model = @"
# Threat Model – Torre/Satelite

Superficie de Ataque
--------------------
- SSH
- SNMP
- Modem
- Antena
- Acesso fisico

MITRE ATT&CK
------------
- Recon: Port scanning
- Initial Access: SSH brute force
- Impact: Comunicacao degradada

STRIDE
------
S – Spoofing  
T – Tampering  
R – Repudiation  
I – Information Disclosure  
D – Denial of Service  
E – Elevation of Privilege  
"@

$diag_cadeia = @"
# Cadeia de Comunicacao Satelital (ASCII)

[Cliente]
    |
[Router]
    |
[Switch]
    |
[Modem SAT] ---> Telemetria ---> [NOC]
    |
[Antena]
    |
[Satelite]
    |
[Estacao Terrestre]
    |
[Backbone]
"@

# ============================================
# READMEs internos
# ============================================

$readme_docs = @"
# Documentacao Tecnica

Diagramas, fluxos e modelos de ameaca relacionados a torres e comunicacao satelital.
"@

$readme_examples = @"
# Exemplos e Casos de Uso

Casos praticos, fluxos de investigacao e simulacoes de incidentes.
"@

$readme_sigma = @"
# Sigma Events

Regras Sigma e eventos correlacionados para deteccao de ataques.
"@

$readme_incidents = @"
# Relatorios de Incidentes

Modelos e casos completos de incidentes envolvendo torres e enlaces satelitais.
"@

$readme_playbooks = @"
# Playbooks

Guias operacionais para resposta a incidentes e perda de enlace.
"@

$readme_dfir = @"
# DFIR Analysis

Analises forenses e coleta de evidencias para infraestrutura de telecom.
"@

# ============================================
# Criar arquivos
# ============================================

Criar-Arquivo "docs/diagrama_arquitetura_satelital.md" $diag_arquitetura
Criar-Arquivo "docs/diagrama_fluxo_ataque.md" $diag_fluxo_ataque
Criar-Arquivo "docs/diagrama_threat_model.md" $diag_threat_model
Criar-Arquivo "docs/diagrama_cadeia_comunicacao.md" $diag_cadeia

Criar-Arquivo "docs/README.md" $readme_docs
Criar-Arquivo "examples/README.md" $readme_examples
Criar-Arquivo "sigma-events/README.md" $readme_sigma
Criar-Arquivo "incident-reports/README.md" $readme_incidents
Criar-Arquivo "playbooks/README.md" $readme_playbooks
Criar-Arquivo "dfir-analysis/README.md" $readme_dfir

Write-Host "Diagramas e READMEs criados com sucesso!" -ForegroundColor Green
