# ============================================
# Script: tudo_automatico.ps1
# Objetivo: Pipeline completa sem conflitos, sem merge, sem abrir editor
# ============================================

Write-Host "Atualizando repositório antes de tudo..." -ForegroundColor Cyan

# Evita merge automático, evita abrir VIM, evita conflito
git pull origin main --rebase

Write-Host "Rodando conversao ASCII + Ingles..." -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1

Write-Host "Criando diagramas e READMEs..." -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File .\montar_diagramas_readmes.ps1

Write-Host "Preparando commit..." -ForegroundColor Cyan

$pastas = @(
    "ascii-version",
    "english-version",
    "docs",
    "examples",
    "sigma-events",
    "incident-reports",
    "playbooks",
    "dfir-analysis"
)

foreach ($p in $pastas) {
    if (Test-Path $p) {
        git add $p
    }
}

$arquivos = @(
    "converter_ascii_english_ultra.ps1",
    "montar_diagramas_readmes.ps1",
    "tudo_automatico.ps1"
)

foreach ($a in $arquivos) {
    if (Test-Path $a) {
        git add $a
    }
}

git commit -m "Pipeline completa: ASCII+Ingles, diagramas, READMEs, rebase aplicado"
git push origin main

Write-Host "Pipeline completa executada com sucesso, sem conflitos!" -ForegroundColor Green
