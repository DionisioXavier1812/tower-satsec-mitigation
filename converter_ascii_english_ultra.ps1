# ============================================
# Script: converter_ascii_english_ultra.ps1
# Objetivo: Criar versoes ASCII + Ingles sem usar acentos no codigo
# ============================================

Write-Host "Gerando versoes ASCII + Ingles..." -ForegroundColor Cyan

# Criar pastas
$asciiDir = "ascii-version"
$englishDir = "english-version"

New-Item -ItemType Directory -Force -Path $asciiDir | Out-Null
New-Item -ItemType Directory -Force -Path $englishDir | Out-Null

# Funcao para remover acentos sem usar caracteres acentuados no script
function Remove-Acentos($texto) {

    # Remover acentos por substituicao de bytes
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($texto)
    $clean = [System.Text.Encoding]::ASCII.GetString($bytes)

    return $clean
}

# Funcao simples de traducao
function Traduzir-Ingles($texto) {

    $texto = $texto -replace "Incidente", "Incident"
    $texto = $texto -replace "Torre", "Tower"
    $texto = $texto -replace "Satelite", "Satellite"
    $texto = $texto -replace "Alerta", "Alert"
    $texto = $texto -replace "Triagem", "Triage"
    $texto = $texto -replace "Investigacao", "Investigation"
    $texto = $texto -replace "Acao", "Action"
    $texto = $texto -replace "Relatorio", "Report"
    $texto = $texto -replace "Recomendacoes", "Recommendations"
    $texto = $texto -replace "Energia", "Power"
    $texto = $texto -replace "Temperatura", "Temperature"
    $texto = $texto -replace "Modem", "Modem"
    $texto = $texto -replace "Antena", "Antenna"
    $texto = $texto -replace "Falha", "Failure"
    $texto = $texto -replace "Acesso fisico", "Physical access"
    $texto = $texto -replace "Fora do horario", "Out of schedule"
    $texto = $texto -replace "Brute force", "Brute force"
    $texto = $texto -replace "Scan", "Scan"
    $texto = $texto -replace "Sem resposta", "No response"

    return $texto
}

# Processar todos os arquivos .md
$arquivos = Get-ChildItem -Recurse -Filter *.md

foreach ($arq in $arquivos) {

    Write-Host "Processando: $($arq.FullName)"

    $conteudoOriginal = Get-Content $arq.FullName -Raw

    # Criar versao ASCII
    $ascii = Remove-Acentos $conteudoOriginal
    $asciiPath = Join-Path $asciiDir $arq.Name
    Set-Content -Path $asciiPath -Value $ascii -Encoding UTF8

    # Criar versao em ingles
    $english = Traduzir-Ingles $ascii
    $englishPath = Join-Path $englishDir $arq.Name
    Set-Content -Path $englishPath -Value $english -Encoding UTF8
}

Write-Host "Versoes ASCII + Ingles criadas com sucesso!" -ForegroundColor Green
