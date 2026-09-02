# ================================
# Script: converter_ascii.ps1
# Objetivo: Remover acentos de TODOS os arquivos .md automaticamente
# ================================

Write-Host "Convertendo arquivos para ASCII..." -ForegroundColor Cyan

# Função para remover acentos
function Remove-Acentos($texto) {
    $normalized = $texto.Normalize([Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($c in $normalized.ToCharArray()) {
        if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($c) -ne "NonSpacingMark") {
            $sb.Append($c) | Out-Null
        }
    }
    return $sb.ToString().Normalize([Text.NormalizationForm]::FormC)
}

# Pegar todos os arquivos .md
$arquivos = Get-ChildItem -Recurse -Filter *.md

foreach ($arq in $arquivos) {
    Write-Host "Convertendo: $($arq.FullName)"

    $conteudo = Get-Content $arq.FullName -Raw
    $conteudo_ascii = Remove-Acentos $conteudo

    # Salvar sem acentos
    Set-Content -Path $arq.FullName -Value $conteudo_ascii -Encoding UTF8
}

Write-Host "Conversao concluida! Todos os arquivos agora estao em ASCII." -ForegroundColor Green
