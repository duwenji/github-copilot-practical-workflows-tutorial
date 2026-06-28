# verify-docs.ps1
# 使い方: cd <repo-root>; pwsh docs/superpowers/verify-docs.ps1

$typeASections = @(
    "## 典型シナリオ",
    "## コンセプトと仕組み",
    "## 基本手順",
    "## Copilot の使いどころ",
    "## 注意点",
    "## 章末チェック"
)
$typeBSections = @(
    "## 概要",
    "## 関連ページ"
)
$typeBKeywords = @(
    "checklist","cheatsheet","faq","index","matrix",
    "sample","legend","diagram","playbook"
)
$excludeFiles = @("00-COVER.md","01-cover-prompt.md","index.md")

function Get-PageType($path) {
    $name = [IO.Path]::GetFileName($path).ToLower()
    if ($path -like "*07-reference*") { return "B" }
    foreach ($kw in $typeBKeywords) { if ($name -like "*$kw*") { return "B" } }
    return "A"
}

$repoRoot = Split-Path $PSScriptRoot -Parent | Split-Path -Parent
$docsRoot = Join-Path $repoRoot "docs"
$pages = Get-ChildItem -Path $docsRoot -Recurse -Filter "*.md" |
    Where-Object {
        $_.FullName -notlike "*superpowers*" -and
        $_.FullName -notlike "*\.git*" -and
        $excludeFiles -notcontains $_.Name
    }

$errors = @()
foreach ($page in $pages) {
    $content  = Get-Content $page.FullName -Raw -Encoding UTF8
    $lines    = (Get-Content $page.FullName -Encoding UTF8).Count
    $type     = Get-PageType $page.FullName
    $required = if ($type -eq "A") { $typeASections } else { $typeBSections }
    $minLines = if ($type -eq "A") { 60 } else { 30 }

    foreach ($s in $required) {
        if ($content -notmatch [regex]::Escape($s)) {
            $errors += "[$($page.Name)] 種別$type : セクション '$s' がありません"
        }
    }
    if ($lines -lt $minLines) {
        $errors += "[$($page.Name)] 種別$type : $lines 行（最低 $minLines 行必要）"
    }
    if ($content -match '```bash') {
        $errors += "[$($page.Name)]: ` ```bash ` が含まれています（` ```powershell ` に変更してください）"
    }
}

if ($errors.Count -eq 0) {
    Write-Host "✅ 全チェック通過 ($($pages.Count) ページ)" -ForegroundColor Green; exit 0
} else {
    Write-Host "❌ $($errors.Count) 件の問題:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  • $_" -ForegroundColor Yellow }
    exit 1
}
