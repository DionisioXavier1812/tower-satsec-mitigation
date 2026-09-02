# ============================================
# Script: tudo_automatico.ps1
# Objetivo: Converter ASCII+Ingles, criar diagramas/READMEs e fazer commit/push
# ============================================

Write-Host "Rodando conversao ASCII + Ingles..." -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File .\converter_ascii_english_ultra.ps1

Write-Host "Criando diagramas e READMEs..." -ForegroundColor Cyan
powershell -ExecutionPolicy Bypass -File .\montar_diagramas_readmes.ps1

Write-Host "Iniciando commit automatico..." -ForegroundColor Cyan

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

git commit -m "Pipeline completa: ASCII+Ingles, diagramas, READMEs"
git push

Write-Host "Pipeline completa executada com sucesso!" -ForegroundColor Green
