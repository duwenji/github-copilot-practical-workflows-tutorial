param(
    [string]$OutputPng = (Join-Path $PSScriptRoot "..\cover-pattern-a.png"),
    [string]$OutputJpg = (Join-Path $PSScriptRoot "..\cover.jpg"),
    [int]$Width = 1600,
    [int]$Height = 2560
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Add-Type -AssemblyName System.Drawing

function New-RoundedRectPath {
    param(
        [float]$X,
        [float]$Y,
        [float]$Width,
        [float]$Height,
        [float]$Radius
    )

    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $diameter = $Radius * 2

    $path.AddArc($X, $Y, $diameter, $diameter, 180, 90)
    $path.AddArc($X + $Width - $diameter, $Y, $diameter, $diameter, 270, 90)
    $path.AddArc($X + $Width - $diameter, $Y + $Height - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($X, $Y + $Height - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    return $path
}

$pngDir = Split-Path -Parent $OutputPng
$jpgDir = Split-Path -Parent $OutputJpg
if ($pngDir) { [System.IO.Directory]::CreateDirectory($pngDir) | Out-Null }
if ($jpgDir) { [System.IO.Directory]::CreateDirectory($jpgDir) | Out-Null }

$bitmap = New-Object System.Drawing.Bitmap($Width, $Height)
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

$fullRect = New-Object System.Drawing.Rectangle(0, 0, $Width, $Height)
$backgroundBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    $fullRect,
    [System.Drawing.Color]::FromArgb(255, 11, 18, 32),
    [System.Drawing.Color]::FromArgb(255, 24, 62, 120),
    90
)
$graphics.FillRectangle($backgroundBrush, $fullRect)

$overlayBrush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
    (New-Object System.Drawing.Rectangle(0, 0, $Width, $Height)),
    [System.Drawing.Color]::FromArgb(65, 120, 255, 210),
    [System.Drawing.Color]::FromArgb(0, 120, 255, 210),
    35
)
$graphics.FillEllipse($overlayBrush, -220, -80, 900, 900)
$graphics.FillEllipse($overlayBrush, 820, 1500, 950, 950)

$accentPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(65, 255, 255, 255), 3)
$graphics.DrawLine($accentPen, 1160, 190, 1420, 190)
$graphics.DrawLine($accentPen, 1240, 240, 1500, 240)
$graphics.DrawLine($accentPen, 1080, 290, 1340, 290)

$white = [System.Drawing.Color]::FromArgb(255, 250, 252, 255)
$softWhite = [System.Drawing.Color]::FromArgb(225, 232, 238, 247)
$mint = [System.Drawing.Color]::FromArgb(255, 120, 255, 214)
$sky = [System.Drawing.Color]::FromArgb(255, 127, 203, 255)

$titleBrush = New-Object System.Drawing.SolidBrush($white)
$subBrush = New-Object System.Drawing.SolidBrush($softWhite)
$mintBrush = New-Object System.Drawing.SolidBrush($mint)

$labelFont = New-Object System.Drawing.Font('Segoe UI', 30, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$enTitleFont = New-Object System.Drawing.Font('Segoe UI Semibold', 46, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$jpTitleFont = New-Object System.Drawing.Font('Yu Gothic UI', 112, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$jpTitleFont2 = New-Object System.Drawing.Font('Yu Gothic UI', 104, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$subTitleFont = New-Object System.Drawing.Font('Yu Gothic UI', 38, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$tagFont = New-Object System.Drawing.Font('Yu Gothic UI', 26, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
$authorFont = New-Object System.Drawing.Font('Yu Gothic UI', 36, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)

$left = 120
$coverLabel = 'PRACTICAL WORKFLOWS'
$coverEnTitle = 'GitHub + GitHub Copilot'
$coverTitleLine1 = '実務ワークフロー'
$coverTitleLine2 = '実践ガイド'
$coverSubtitle = "日常開発から協業、共有資産管理、`nrelease / hotfix までを`nシナリオで学ぶ"
$tagItems = @('日常開発', '協業', '共有資産', '運用')

$graphics.DrawString($coverLabel, $labelFont, $mintBrush, 120, 150)
$graphics.DrawString($coverEnTitle, $enTitleFont, $titleBrush, $left, 248)
$graphics.DrawString($coverTitleLine1, $jpTitleFont, $titleBrush, $left, 412)
$graphics.DrawString($coverTitleLine2, $jpTitleFont2, $titleBrush, $left, 576)

$subtitleRect = New-Object System.Drawing.RectangleF(120, 830, 1320, 250)
$graphics.DrawString(
    $coverSubtitle,
    $subTitleFont,
    $subBrush,
    $subtitleRect
)

$tagX = 120
$tagY = 1215
foreach ($tag in $tagItems) {
    $size = $graphics.MeasureString($tag, $tagFont)
    $tagWidth = [Math]::Ceiling($size.Width) + 52
    $tagHeight = 62
    $tagPath = New-RoundedRectPath -X $tagX -Y $tagY -Width $tagWidth -Height $tagHeight -Radius 22
    $tagBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(44, 255, 255, 255))
    $tagPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(88, 127, 203, 255), 2)
    $graphics.FillPath($tagBrush, $tagPath)
    $graphics.DrawPath($tagPen, $tagPath)
    $graphics.DrawString($tag, $tagFont, $titleBrush, $tagX + 24, $tagY + 12)
    $tagX += $tagWidth + 18
}

$panelPath = New-RoundedRectPath -X 120 -Y 1705 -Width 1360 -Height 380 -Radius 36
$panelBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::FromArgb(38, 7, 13, 26))
$panelPen = New-Object System.Drawing.Pen([System.Drawing.Color]::FromArgb(88, 120, 255, 214), 2)
$graphics.FillPath($panelBrush, $panelPath)
$graphics.DrawPath($panelPen, $panelPath)

$bulletFont = New-Object System.Drawing.Font('Yu Gothic UI', 32, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
$bulletBrush = New-Object System.Drawing.SolidBrush($softWhite)
$bullets = @(
    'Issue → Branch → PR → Review → Merge',
    'fork / upstream・submodule / subtree',
    'release / hotfix・チーム標準化'
)

$bulletY = 1778
foreach ($line in $bullets) {
    $graphics.FillEllipse((New-Object System.Drawing.SolidBrush($sky)), 160, $bulletY + 14, 12, 12)
    $graphics.DrawString($line, $bulletFont, $bulletBrush, 190, $bulletY)
    $bulletY += 94
}

$graphics.DrawString('杜 文吉', $authorFont, $titleBrush, 120, 2335)

$bitmap.Save($OutputPng, [System.Drawing.Imaging.ImageFormat]::Png)
$bitmap.Save($OutputJpg, [System.Drawing.Imaging.ImageFormat]::Jpeg)

$graphics.Dispose()
$bitmap.Dispose()
$backgroundBrush.Dispose()
$overlayBrush.Dispose()
$accentPen.Dispose()
$titleBrush.Dispose()
$subBrush.Dispose()
$mintBrush.Dispose()

Write-Host "Created: $OutputPng"
Write-Host "Created: $OutputJpg"