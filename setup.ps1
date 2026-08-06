# ============================================================
# 🐉 Dragon Ball Album - Script de Setup Automatizado
# ============================================================
# Execute com: .\setup.ps1
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  🐉 Dragon Ball Album - Setup Automático  " -ForegroundColor Yellow
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# --- Verificar Python ---
Write-Host "🔍 Verificando Python..." -ForegroundColor White
if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Python não encontrado! Instale em https://python.org e tente novamente." -ForegroundColor Red
    exit 1
}
$pyVersion = python --version
Write-Host "✅ $pyVersion encontrado." -ForegroundColor Green
Write-Host ""

# --- Criar / Reutilizar ambiente virtual ---
$venvPath = ".\backend\venv"

if (Test-Path $venvPath) {
    Write-Host "♻️  Ambiente virtual já existe. Reutilizando..." -ForegroundColor Yellow
} else {
    Write-Host "📦 Criando ambiente virtual em backend\venv..." -ForegroundColor White
    python -m venv $venvPath
    Write-Host "✅ Ambiente virtual criado." -ForegroundColor Green
}
Write-Host ""

# --- Instalar dependências ---
Write-Host "⬇️  Instalando dependências do backend..." -ForegroundColor White
$pip = ".\backend\venv\Scripts\pip.exe"
& $pip install -r .\backend\requirements.txt --quiet
Write-Host "✅ Dependências instaladas com sucesso." -ForegroundColor Green
Write-Host ""

# --- Iniciar o Backend ---
Write-Host "🚀 Iniciando o servidor backend em http://localhost:8000 ..." -ForegroundColor Cyan
Write-Host "   (Pressione CTRL+C para parar)" -ForegroundColor DarkGray
Write-Host ""

$python = ".\backend\venv\Scripts\python.exe"
& $python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload --app-dir .\backend
