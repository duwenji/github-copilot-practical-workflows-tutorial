# 教材一貫性・品質統一 実装計画

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** `docs/` 以下の全対象ページをページ種別テンプレートに準拠させ、文体を統一し、内容が薄い 5 ページをコンテンツレベルで拡充する。

**Architecture:** 3 フェーズで進める。(1) 検証スクリプトを書いてベースライン（多数のエラー）を確認する。(2) チャプターごとにテンプレート・文体を適用する。(3) 薄いページ 5 つのコンテンツを完全に書き直す。

**Tech Stack:** PowerShell, Markdown

## Global Constraints

- 本文の文末はですます調（「〜します」「〜できます」）に統一する
- 箇条書き末尾は体言止めまたは「〜すること」で統一する
- シェルコードブロックは ` ```powershell ` のみ（` ```bash ` は使用禁止）
- Copilot プロンプト例は「〜してください」形式かつ関数名・ファイル名を含む具体例にする
- 注意点は「〜しないこと」または「〜すること」の行動レベルで書く
- 種別 A ページ: 最低 60 行
- 種別 B ページ: 最低 30 行
- 作業ルート: `c:\Dev\tutorials\github-copilot-practical-workflows-tutorial`

---

## テンプレート定義（全タスク共通）

### 種別 A（解説ページ）— 必須セクション順

```
# ページタイトル
## 典型シナリオ
## コンセプトと仕組み
## 基本手順
## コマンドと引数の意味  ← コマンドがある場合のみ
## Copilot の使いどころ
## 注意点
## 章末チェック
```

### 種別 B（リファレンスページ）— 必須セクション順

```
# ページタイトル
## 概要
## [コンテンツ本体]
## 関連ページ
```

### 各セクションの標準形式

**## 典型シナリオ（2〜3 文）**
```markdown
## 典型シナリオ

[場面の説明。ですます調。「〜する場面です」「〜するときです」で終わる]
```

**## コンセプトと仕組み（箇条書き 2〜4 項目）**
```markdown
## コンセプトと仕組み

- [なぜそうするかの理由。体言止めまたは「〜すること」]
- [...]
```

**## Copilot の使いどころ（3 項目・具体的プロンプト）**
```markdown
## Copilot の使いどころ

- 「[ファイル名・関数名を含む依頼文]してください」
- 「[...]してください」
- 「[...]してください」
```

**## 章末チェック（2〜3 項目）**
```markdown
## 章末チェック

- [確認項目]できること
- [確認項目]を説明できること
```

### 種別判定ルール

以下のキーワードをファイル名に含む → 種別 B:
`checklist` `cheatsheet` `faq` `index` `matrix` `sample` `legend` `diagram` `playbook`

`docs/07-reference-and-scenario-playbook/` 以下は全て種別 B。

除外（テンプレートチェック不要）:
- `docs/00-COVER.md`
- `docs/01-cover-prompt.md`
- `docs/index.md`

---

## File Structure

- Create: `docs/superpowers/verify-docs.ps1`
- Modify: `docs/01-getting-started-and-onboarding/*.md`（4 ファイル）
- Modify: `docs/02-daily-development-workflows/*.md`（6 ファイル）
- Modify: `docs/03-collaboration-patterns/*.md`（7 ファイル）
- Modify: `docs/04-shared-assets-and-multi-repo-management/*.md`（7 ファイル）
- Modify: `docs/05-release-hotfix-and-operations/*.md`（9 ファイル）
- Modify: `docs/06-team-standards-and-governance/*.md`（6 ファイル）
- Modify: `docs/07-reference-and-scenario-playbook/*.md`（9 ファイル）

---

## Task 1: 検証スクリプトを作成する

**Files:**
- Create: `docs/superpowers/verify-docs.ps1`

**Interfaces:**
- Produces: 終了コード 0（全チェック通過）または 1（エラーあり）

- [ ] **Step 1: スクリプトファイルを作成する**

`docs/superpowers/verify-docs.ps1` に以下を書く:

```powershell
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
```

- [ ] **Step 2: スクリプトを実行してベースラインを確認する**

```powershell
cd c:\Dev\tutorials\github-copilot-practical-workflows-tutorial
pwsh docs/superpowers/verify-docs.ps1
```

期待される出力: 多数のエラーが表示される（正常。後続タスクで解消する）

- [ ] **Step 3: コミットする**

```powershell
git add docs/superpowers/verify-docs.ps1
git commit -m "chore: add docs consistency verification script"
```

---

## Task 2: Chapter 01 — テンプレート・文体適用（4 ページ）

**Files:**
- Modify: `docs/01-getting-started-and-onboarding/01-what-this-tutorial-covers.md`
- Modify: `docs/01-getting-started-and-onboarding/02-github-and-copilot-setup.md`
- Modify: `docs/01-getting-started-and-onboarding/03-clone-origin-and-local-setup.md`
- Modify: `docs/01-getting-started-and-onboarding/04-first-day-on-an-existing-repo.md`

**Interfaces:**
- Consumes: テンプレート定義（上記 Global 参照）
- Produces: 4 ページが種別 A テンプレートに準拠した状態

- [ ] **Step 1: 現在の不足セクションをスクリプトで確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "01-"
```

出力されたエラーに対応するセクションを追加する。

- [ ] **Step 2: `01-what-this-tutorial-covers.md` に不足セクションを追加する**

以下の内容を既存テキストに統合する（テンプレート定義の順序を守る）:

```markdown
## 典型シナリオ

この教材を初めて開いたとき、どこから読み始めればよいかを把握する場面です。
自分の業務で頻出するシナリオを特定して、最短で実務に活かすルートを選びます。

## コンセプトと仕組み

- この教材は機能の説明ではなく「実務シナリオ」を単位として構成されていること
- 各章は独立して読めるが、01 → 02 → 03 の順に進めると学習効果が高いこと
- `07-reference-and-scenario-playbook` は逆引きリファレンスとして活用できること

## 基本手順

1. この章（01）でセットアップを済ませる
2. `02-daily-development-workflows` で基本の流れをつかむ
3. `03`〜`06` で実務の広がりと運用・標準化を学ぶ
4. `07` のリファレンスを逆引きとして活用する

## Copilot の使いどころ

- 「この教材の章一覧を見て、バックエンド開発者に関連する章を優先順位付きで教えてください」
- 「`02-daily-development-workflows` の内容をひとことで要約してください」
- 「この教材で扱う `submodule` と `subtree` の違いを 2 行で説明してください」

## 注意点

- 途中の章から始める場合は前提となるセットアップ（章 01）を確認すること
- GitHub / Copilot のバージョンによって UI や機能が異なる場合があること
- 教材内のコマンドは PowerShell で動作確認されていること
```

- [ ] **Step 3: 残り 3 ファイルに不足セクションを追加する**

`02-github-and-copilot-setup.md`、`03-clone-origin-and-local-setup.md`、`04-first-day-on-an-existing-repo.md` のそれぞれについて:

1. ファイルを読む
2. スクリプト出力で示された不足セクションを特定する
3. テンプレート定義の標準形式に従って、そのページの内容に即した文を書いて追加する
4. 既存の「コンセプトと仕組み」「基本手順」がある場合はそのまま活用する

- [ ] **Step 4: 文体を統一する（4 ファイル）**

各ファイルで以下を確認・修正する:
- 本文の文末: `〜する。` → `〜します。`、`〜できる。` → `〜できます。`
- 箇条書き末尾: `〜する` / `〜できる` → 体言止めまたは `〜すること`
- コードブロック: ` ```bash ` → ` ```powershell `
- Copilot プロンプト例: 「〜して」 → 「〜してください」
- 注意点: 「〜しない」 → 「〜しないこと」

- [ ] **Step 5: 検証スクリプトを実行して Chapter 01 のエラーが 0 になるのを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "01-"
```

期待される出力: `01-` を含む行が 0 件

- [ ] **Step 6: コミットする**

```powershell
git add docs/01-getting-started-and-onboarding/
git commit -m "docs: apply template and style to chapter 01"
```

---

## Task 3: Chapter 02 — テンプレート・文体適用（6 ページ）

**Files:**
- Modify: `docs/02-daily-development-workflows/01-from-issue-to-branch.md`
- Modify: `docs/02-daily-development-workflows/02-copilot-for-implementation.md`（後の Task 9 で内容拡充）
- Modify: `docs/02-daily-development-workflows/03-commit-and-pr-best-practices.md`
- Modify: `docs/02-daily-development-workflows/04-review-feedback-and-fixup.md`
- Modify: `docs/02-daily-development-workflows/05-end-to-end-workflow-map.md`
- Modify: `docs/02-daily-development-workflows/06-hands-on-lab-issue-to-pr.md`

**Interfaces:**
- Consumes: テンプレート定義（上記 Global 参照）
- Produces: 6 ページが種別 A テンプレートに準拠した状態（`02-copilot-for-implementation.md` は行数未到達のままで OK。Task 9 で解消）

- [ ] **Step 1: 現在の不足セクションをスクリプトで確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "02-"
```

- [ ] **Step 2: `03-commit-and-pr-best-practices.md` に不足セクションを追加する**

このファイルは「コマンドと引数の意味」と「Copilot の使いどころ」はあるが、「典型シナリオ」「コンセプトと仕組み」「章末チェック」が不足している:

```markdown
## 典型シナリオ

機能追加の実装が終わり、変更を commit して PR を作成する場面です。
レビュアーが変更の意図をすぐ理解できるよう、commit メッセージと PR 説明文を整えます。

## コンセプトと仕組み

- 1 commit = 1 つの意図にすることで、後から変更の経緯を追いやすくなること
- PR は「何を・なぜ・どう確認したか」を伝えるコミュニケーションツールであること
- CI が通った状態で PR を出すことで、レビュアーの負荷を下げられること

## 章末チェック

- commit メッセージに変更内容と理由が含まれていることを確認できること
- PR 説明文に変更理由・変更内容・動作確認の 3 点が含まれていること
- 大きすぎる PR を分割するタイミングを判断できること
```

- [ ] **Step 3: 残り 4 ファイル（`01`・`04`・`05`・`06`）に不足セクションを追加する**

Task 2 Step 3 と同じ手順で、スクリプト出力を見ながら各ページの内容に即した不足セクションを追加する。

- [ ] **Step 4: 文体を統一する（6 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 5: Chapter 02 のエラーを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "02-"
```

期待される出力: `02-copilot-for-implementation.md` の行数不足エラー以外は 0 件（Task 9 で解消）

- [ ] **Step 6: コミットする**

```powershell
git add docs/02-daily-development-workflows/
git commit -m "docs: apply template and style to chapter 02"
```

---

## Task 4: Chapter 03 — テンプレート・文体適用（7 ページ）

**Files:**
- Modify: `docs/03-collaboration-patterns/01-fork-and-upstream-basics.md`
- Modify: `docs/03-collaboration-patterns/02-syncing-with-upstream.md`
- Modify: `docs/03-collaboration-patterns/03-merge-vs-rebase-in-practice.md`
- Modify: `docs/03-collaboration-patterns/04-resolving-conflicts-with-copilot.md`
- Modify: `docs/03-collaboration-patterns/05-fork-upstream-visual-guide.md`
- Modify: `docs/03-collaboration-patterns/06-collaboration-checklist.md`（種別 B）
- Modify: `docs/03-collaboration-patterns/07-hands-on-lab-fork-sync.md`

**Interfaces:**
- Consumes: テンプレート定義
- Produces: 7 ページがそれぞれの種別テンプレートに準拠した状態

- [ ] **Step 1: 不足セクションを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "03-"
```

- [ ] **Step 2: 各ファイルに不足セクションを追加する**

`06-collaboration-checklist.md` は種別 B（`checklist` を含むため）。「## 概要」と「## 関連ページ」が不足している場合は以下の形式で追加する:

```markdown
## 概要

Fork / upstream を使った協業の各ステップで確認すべき項目のチェックリストです。

## 関連ページ

- [fork と upstream の基本](01-fork-and-upstream-basics.md)
- [upstream との同期](02-syncing-with-upstream.md)
- [ハンズオン: fork / upstream 同期](07-hands-on-lab-fork-sync.md)
```

種別 A の 6 ページは Task 2 Step 3 と同じ手順で不足セクションを追加する。

- [ ] **Step 3: 文体を統一する（7 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 4: Chapter 03 のエラーが 0 になるのを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "03-"
```

- [ ] **Step 5: コミットする**

```powershell
git add docs/03-collaboration-patterns/
git commit -m "docs: apply template and style to chapter 03"
```

---

## Task 5: Chapter 04 — テンプレート・文体適用（7 ページ）

**Files:**
- Modify: `docs/04-shared-assets-and-multi-repo-management/01-when-to-use-submodule.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/02-when-to-use-subtree.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/03-submodule-vs-subtree-decision-guide.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/04-managing-shared-templates-and-skills.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/06-shared-repo-strategy-lab.md`
- Modify: `docs/04-shared-assets-and-multi-repo-management/07-real-example-shared-skills.md`

**Interfaces:**
- Consumes: テンプレート定義
- Produces: 7 ページがテンプレートに準拠した状態

- [ ] **Step 1: 不足セクションを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "04-"
```

- [ ] **Step 2: `01-when-to-use-submodule.md` に不足セクションを追加する**

このファイルは「典型シナリオ」「章末チェック」が不足している:

```markdown
## 典型シナリオ

複数のリポジトリで共通ライブラリや共有テンプレートを使いたいとき、
管理方法として `submodule` を検討する場面です。

## 章末チェック

- `submodule` が向いているケースを 2 つ挙げられること
- `git submodule update --init --recursive` の各引数の意味を説明できること
- `submodule` と `subtree` の違いを 1 文で説明できること
```

残り 6 ファイルも同じ手順でスクリプト出力を見ながら不足セクションを追加する。

- [ ] **Step 3: 文体を統一する（7 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 4: Chapter 04 のエラーが 0 になるのを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "04-"
```

- [ ] **Step 5: コミットする**

```powershell
git add docs/04-shared-assets-and-multi-repo-management/
git commit -m "docs: apply template and style to chapter 04"
```

---

## Task 6: Chapter 05 — テンプレート・文体適用（9 ページ）

**Files:**
- Modify: `docs/05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md`（後の Task 10 で内容拡充）
- Modify: `docs/05-release-hotfix-and-operations/02-preparing-a-release.md`
- Modify: `docs/05-release-hotfix-and-operations/03-hotfix-workflow.md`
- Modify: `docs/05-release-hotfix-and-operations/04-rollback-and-post-release-checks.md`
- Modify: `docs/05-release-hotfix-and-operations/05-release-flow-diagram.md`（種別 B）
- Modify: `docs/05-release-hotfix-and-operations/06-operations-checklist.md`（種別 B）
- Modify: `docs/05-release-hotfix-and-operations/07-github-pages-and-publication.md`
- Modify: `docs/05-release-hotfix-and-operations/08-hands-on-release-drill.md`
- Modify: `docs/05-release-hotfix-and-operations/09-ci-troubleshooting-playbook.md`（種別 B）

**Interfaces:**
- Consumes: テンプレート定義
- Produces: 9 ページがテンプレートに準拠した状態（`01-ci-and-github-actions-basics.md` は行数未到達のままで OK。Task 10 で解消）

- [ ] **Step 1: 不足セクションを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "05-"
```

- [ ] **Step 2: 種別 B の 3 ファイルに「## 概要」と「## 関連ページ」を追加する**

`05-release-flow-diagram.md` の例:
```markdown
## 概要

release / hotfix / rollback の各フローを図で示したビジュアルガイドです。

## 関連ページ

- [release の準備](02-preparing-a-release.md)
- [hotfix ワークフロー](03-hotfix-workflow.md)
- [ロールバックとリリース後確認](04-rollback-and-post-release-checks.md)
```

`06-operations-checklist.md` と `09-ci-troubleshooting-playbook.md` も同じ形式で追加する。

- [ ] **Step 3: 種別 A の 6 ファイルに不足セクションを追加する**

Task 2 Step 3 と同じ手順で各ページの内容に即した不足セクションを追加する。

- [ ] **Step 4: 文体を統一する（9 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 5: Chapter 05 のエラーを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "05-"
```

期待される出力: `01-ci-and-github-actions-basics.md` の行数不足エラー以外は 0 件

- [ ] **Step 6: コミットする**

```powershell
git add docs/05-release-hotfix-and-operations/
git commit -m "docs: apply template and style to chapter 05"
```

---

## Task 7: Chapter 06 — テンプレート・文体適用（6 ページ）

**Files:**
- Modify: `docs/06-team-standards-and-governance/01-copilot-instructions-for-teams.md`（後の Task 11 で内容拡充）
- Modify: `docs/06-team-standards-and-governance/02-pr-review-checklist.md`（種別 B）
- Modify: `docs/06-team-standards-and-governance/03-security-and-content-exclusion.md`
- Modify: `docs/06-team-standards-and-governance/04-kpi-and-adoption-metrics.md`
- Modify: `docs/06-team-standards-and-governance/05-sample-team-policy.md`（種別 B）
- Modify: `docs/06-team-standards-and-governance/06-team-adoption-checklist.md`（種別 B）

**Interfaces:**
- Consumes: テンプレート定義
- Produces: 6 ページがテンプレートに準拠した状態（`01-copilot-instructions-for-teams.md` は行数未到達のままで OK。Task 11 で解消）

- [ ] **Step 1: 不足セクションを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "06-"
```

- [ ] **Step 2: 種別 B の 3 ファイルに「## 概要」と「## 関連ページ」を追加する**

`02-pr-review-checklist.md` の例:
```markdown
## 概要

PR をレビューするときに確認すべき観点のチェックリストです。
レビュアーとレビュイーの双方が参照することで、観点の抜け漏れを防ぎます。

## 関連ページ

- [commit と PR のベストプラクティス](../02-daily-development-workflows/03-commit-and-pr-best-practices.md)
- [サンプル PR 説明文](../07-reference-and-scenario-playbook/06-sample-pr-descriptions.md)
```

`05-sample-team-policy.md` と `06-team-adoption-checklist.md` も同じ形式で追加する。

- [ ] **Step 3: 種別 A の 3 ファイルに不足セクションを追加する**

Task 2 Step 3 と同じ手順で処理する。

- [ ] **Step 4: 文体を統一する（6 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 5: Chapter 06 のエラーを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "06-"
```

期待される出力: `01-copilot-instructions-for-teams.md` の行数不足エラー以外は 0 件

- [ ] **Step 6: コミットする**

```powershell
git add docs/06-team-standards-and-governance/
git commit -m "docs: apply template and style to chapter 06"
```

---

## Task 8: Chapter 07 — テンプレート・文体適用（9 ページ、全て種別 B）

**Files:**
- Modify: `docs/07-reference-and-scenario-playbook/01-command-cheatsheet.md`
- Modify: `docs/07-reference-and-scenario-playbook/02-copilot-prompt-patterns.md`（後の Task 12 で内容拡充）
- Modify: `docs/07-reference-and-scenario-playbook/03-scenario-index.md`
- Modify: `docs/07-reference-and-scenario-playbook/04-faq-and-troubleshooting.md`（後の Task 13 で内容拡充）
- Modify: `docs/07-reference-and-scenario-playbook/05-practical-decision-matrix.md`
- Modify: `docs/07-reference-and-scenario-playbook/06-sample-pr-descriptions.md`
- Modify: `docs/07-reference-and-scenario-playbook/07-sample-copilot-chat-prompts.md`
- Modify: `docs/07-reference-and-scenario-playbook/08-release-readiness-checklist.md`
- Modify: `docs/07-reference-and-scenario-playbook/09-diagram-legend.md`

**Interfaces:**
- Consumes: テンプレート定義（種別 B）
- Produces: 9 ページが種別 B テンプレートに準拠した状態（`02` と `04` は行数未到達のままで OK）

- [ ] **Step 1: 不足セクションを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "07-"
```

- [ ] **Step 2: 各ファイルに「## 概要」と「## 関連ページ」を追加する**

`01-command-cheatsheet.md` の例:
```markdown
## 概要

この教材で登場する Git / GitHub CLI コマンドの逆引きチートシートです。
コマンド名・用途・基本構文を一覧で確認できます。

## 関連ページ

- [シナリオ別逆引きガイド](03-scenario-index.md)
- [FAQ とトラブルシューティング](04-faq-and-troubleshooting.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
```

残り 8 ファイルも同じ形式で、各ページの内容に合った「## 概要」と「## 関連ページ」を追加する。

- [ ] **Step 3: 文体を統一する（9 ファイル）**

Task 2 Step 4 と同じ基準を適用する。

- [ ] **Step 4: Chapter 07 のエラーを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "07-"
```

期待される出力: `02-copilot-prompt-patterns.md` と `04-faq-and-troubleshooting.md` の行数不足エラー以外は 0 件

- [ ] **Step 5: コミットする**

```powershell
git add docs/07-reference-and-scenario-playbook/
git commit -m "docs: apply template and style to chapter 07"
```

---

## Task 9: 薄いページ拡充 — `02-copilot-for-implementation.md`

**Files:**
- Modify: `docs/02-daily-development-workflows/02-copilot-for-implementation.md`

**Interfaces:**
- Produces: 60 行以上・全必須セクションを含む完成版ページ

- [ ] **Step 1: ファイルの内容を以下で完全に置き換える**

```markdown
# Copilot を使った実装の進め方

## 典型シナリオ

仕様がある程度決まっていて、実装を前に進めたい場面です。
既存コードの意図が分からない箇所の説明を求めたり、テストケースの洗い出しを依頼したりします。

## コンセプトと仕組み

- Copilot はコンテキスト（背景情報）を渡すほど精度が上がるツールであること
- ファイルを開いた状態や関連コードを選択した状態でプロンプトを送ると、より的確な提案が返ること
- 提案は「たたき台」であり、要件・セキュリティ・例外処理の確認は人間が担うこと
- プロジェクト固有のルールは `.github/copilot-instructions.md` に書くことで毎回説明する手間を省けること

## 基本手順

1. VS Code で変更対象のファイルを開く
2. 関連するコードを選択する（任意）
3. Copilot Chat を開く（`Ctrl + Alt + I`）
4. 目的をプロンプトで伝える
5. 提案を確認し、必要な部分を採用する
6. ローカルでテストを実行して動作を確認する

## Copilot の使いどころ

- 「`filterQuiz` 関数に、カテゴリが空の場合のバリデーションを追加してください」
- 「`fetchUserData` のユニットテストケースを網羅的に 5 件列挙してください」
- 「この `sortByPriority` 関数の処理の流れを 3 行で説明してください」
- 「選択中のコードをリファクタして、可読性を上げてください」

## 注意点

- 提案コードを要件と照らし合わせて確認すること
- セキュリティ上の懸念（入力バリデーション・認証処理）は必ず自分でレビューすること
- 提案をそのままコミットせず、ローカルでテストを実行してから採用すること
- Copilot の提案は最新の API や依存ライブラリのバージョンに追従していない場合があること

## 章末チェック

- Copilot Chat を開いてプロンプトを送る操作ができること
- コンテキストを渡した場合と渡さない場合の提案の違いを体験できること
- 提案を採用する前に確認すべき 3 点（要件・セキュリティ・テスト）を挙げられること
```

- [ ] **Step 2: スクリプトでエラーが解消されたことを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "02-copilot-for-implementation"
```

期待される出力: 0 件

- [ ] **Step 3: コミットする**

```powershell
git add docs/02-daily-development-workflows/02-copilot-for-implementation.md
git commit -m "docs: expand copilot-for-implementation page to full content"
```

---

## Task 10: 薄いページ拡充 — `01-ci-and-github-actions-basics.md`

**Files:**
- Modify: `docs/05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md`

**Interfaces:**
- Produces: 60 行以上・全必須セクションを含む完成版ページ

- [ ] **Step 1: ファイルの内容を以下で完全に置き換える**

```markdown
# CI と GitHub Actions の基本

## 典型シナリオ

PR を作成したら `GitHub Actions` が自動で走り、lint / test / build の結果を GitHub 上で確認する場面です。
CI が赤い（失敗している）場合は原因を特定して修正してから merge します。

## コンセプトと仕組み

- `GitHub Actions` は `.github/workflows/` 以下の YAML ファイルで定義された自動処理を実行するサービスであること
- PR を作成・更新するたびにトリガーされ、結果を PR の `Checks` タブに表示すること
- lint・test・build を自動化することで、人間のレビューより先に機械的なチェックを通過させること

## 基本手順

1. PR を作成する（または push する）
2. PR の `Checks` タブを開く
3. 実行中のジョブ一覧を確認する
4. 失敗しているジョブをクリックしてログを確認する
5. エラー箇所をローカルで再現する
6. 修正して push する
7. CI が全て緑になるのを確認する

## ワークフロー YAML の読み方

CI の設定は `.github/workflows/` 以下の YAML ファイルに書かれています。

```powershell
# ワークフローファイルの一覧を確認する
ls .github/workflows/
```

```yaml
# .github/workflows/ci.yml の例
name: CI

on:
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: npm test
```

主要なキー:
- `on`: トリガー条件（`pull_request` は PR 作成・更新時）
- `jobs`: 実行するジョブの定義
- `runs-on`: 実行環境（`ubuntu-latest` が一般的）
- `steps`: ジョブ内の手順

## Copilot の使いどころ

- 「このワークフロー YAML の `on` セクションを説明してください」
- 「この CI エラーログを要約して、原因の仮説を 3 つ挙げてください」
- 「このテスト失敗のログを見て、修正候補を提示してください」

## 注意点

- 赤い CI のまま merge しないこと
- 失敗ジョブを 1 つずつ特定して潰すこと
- ローカルで再現できる場合は push 前に修正すること
- Hotfix でも CI を通す手順を省略しないこと（記録を残すため）

## 章末チェック

- PR の `Checks` タブから失敗したジョブのログを開けること
- `.github/workflows/` の YAML の基本構造（`on`・`jobs`・`steps`）を説明できること
- CI が赤い原因を調べる手順を 3 ステップで説明できること
```

- [ ] **Step 2: スクリプトでエラーが解消されたことを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "01-ci-and-github"
```

期待される出力: 0 件

- [ ] **Step 3: コミットする**

```powershell
git add docs/05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md
git commit -m "docs: expand ci-and-github-actions-basics page to full content"
```

---

## Task 11: 薄いページ拡充 — `01-copilot-instructions-for-teams.md`

**Files:**
- Modify: `docs/06-team-standards-and-governance/01-copilot-instructions-for-teams.md`

**Interfaces:**
- Produces: 60 行以上・全必須セクションを含む完成版ページ

- [ ] **Step 1: ファイルの内容を以下で完全に置き換える**

```markdown
# チーム向け copilot-instructions の作り方

## 典型シナリオ

チームで GitHub Copilot を使い始めるとき、AI の提案をプロジェクト固有のルールに合わせたい場面です。
`.github/copilot-instructions.md` を作成してリポジトリに置くことで、Copilot に文脈を伝えられます。

## コンセプトと仕組み

- `.github/copilot-instructions.md` はリポジトリ固有のルールを Copilot に伝えるための設定ファイルであること
- ファイルが存在すると、Copilot Chat がそのリポジトリで開いているセッションに自動で読み込むこと
- 命名規則・テスト方針・禁止パターンなどを書くことで、提案のばらつきを減らせること

## 基本手順

1. リポジトリのルートに `.github/` ディレクトリを作成する（未存在の場合）
2. `.github/copilot-instructions.md` ファイルを作成する
3. チームで合意したルールを記述する
4. PR でレビューして merge する
5. 定期的に内容を見直して更新する

```powershell
# ファイルを作成する
New-Item -Path ".github/copilot-instructions.md" -ItemType File -Force
```

## `copilot-instructions.md` の記述例

```markdown
# Copilot Instructions

## 言語・スタイル
- コメントは日本語で書くこと
- 変数名・関数名は英語のキャメルケース（例: `filterQuizByCategory`）

## テスト方針
- ユニットテストは Vitest を使うこと
- テストファイル名は `*.test.ts` 形式にすること

## セキュリティ
- ユーザー入力は必ずバリデーションすること
- `eval()` や `innerHTML` の直接代入は使用しないこと

## Copilot に提案させたくないこと
- `any` 型の使用（TypeScript）
- `console.log` をコードに残すこと
```

## Copilot の使いどころ

- 「我々のチームの命名規則と禁止パターンを `copilot-instructions.md` の形式でまとめてください」
- 「この `copilot-instructions.md` の内容を読んで、レビュー観点を列挙してください」
- 「あなたが現在認識しているプロジェクトのルールを教えてください」

## 注意点

- ファイルは `.github/` ディレクトリ直下に置くこと（他の場所では読み込まれない）
- 秘密情報（API キー、パスワードなど）は書かないこと
- チーム全員がルールに合意してから merge すること
- 内容が古くなったら更新すること（放置するとルールと実装が乖離する）

## 章末チェック

- `.github/copilot-instructions.md` の役割を説明できること
- 自分のチームに必要なルールを 5 項目書き出せること
- ファイルの正しい配置場所（`.github/` 直下）を説明できること
```

- [ ] **Step 2: スクリプトでエラーが解消されたことを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "01-copilot-instructions"
```

期待される出力: 0 件

- [ ] **Step 3: コミットする**

```powershell
git add docs/06-team-standards-and-governance/01-copilot-instructions-for-teams.md
git commit -m "docs: expand copilot-instructions-for-teams page with full example"
```

---

## Task 12: 薄いページ拡充 — `02-copilot-prompt-patterns.md`

**Files:**
- Modify: `docs/07-reference-and-scenario-playbook/02-copilot-prompt-patterns.md`

**Interfaces:**
- Produces: 30 行以上・種別 B テンプレートに準拠した完成版ページ

- [ ] **Step 1: ファイルの内容を以下で完全に置き換える**

```markdown
# Copilot プロンプトパターン集

## 概要

GitHub Copilot Chat に送るプロンプトの典型パターンをまとめたリファレンスです。
各パターンは「場面」「プロンプト例」「期待される出力」の 3 点で構成しています。

## 要件整理

| 場面 | プロンプト例 | 期待される出力 |
|---|---|---|
| Issue の作業分解 | 「この Issue を実装ステップに分けてください（最大 5 ステップ）」 | 番号付きステップリスト |
| 受入条件からテスト観点 | 「この受入条件からテストケースを網羅的に列挙してください」 | テストケースの箇条書き |
| 影響範囲の確認 | 「この変更で影響しそうなファイルとモジュールを推測してください」 | ファイル名・モジュール名のリスト |

## 実装支援

| 場面 | プロンプト例 | 期待される出力 |
|---|---|---|
| バリデーション追加 | 「`filterQuiz` 関数に空文字チェックと null チェックを追加してください」 | 修正済みコード |
| リファクタリング | 「この `fetchData` 関数を読みやすくリファクタしてください」 | リファクタ済みコード |
| 例外処理の追加 | 「この API 呼び出しに try-catch と適切なエラーメッセージを追加してください」 | 修正済みコード |
| テストケース生成 | 「`sortByPriority` 関数のユニットテストを 5 件書いてください」 | テストコード |

## レビュー・説明

| 場面 | プロンプト例 | 期待される出力 |
|---|---|---|
| PR 説明文の下書き | 「この変更の PR 説明文を、変更理由・変更内容・動作確認の 3 セクションで下書きしてください」 | PR 説明文の Markdown |
| レビューコメントへの返信 | 「このレビューコメントに対する返信案を 2 パターン出してください」 | 返信案 |
| コードの説明 | 「この `useQuizFilter` フックが何をしているか、非エンジニア向けに 3 行で説明してください」 | 説明文 |

## 活用のコツ

- プロンプトにファイル名・関数名を含めるほど精度が上がります
- プロジェクト固有ルールは `.github/copilot-instructions.md` に書くと毎回説明する手間を省けます
- 期待する出力の形式（箇条書き・表・コードブロック）を指定すると結果が揃いやすくなります

## 関連ページ

- [copilot-instructions の作り方](../06-team-standards-and-governance/01-copilot-instructions-for-teams.md)
- [サンプル Copilot Chat プロンプト](07-sample-copilot-chat-prompts.md)
- [FAQ とトラブルシューティング](04-faq-and-troubleshooting.md)
```

- [ ] **Step 2: スクリプトでエラーが解消されたことを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "02-copilot-prompt"
```

期待される出力: 0 件

- [ ] **Step 3: コミットする**

```powershell
git add docs/07-reference-and-scenario-playbook/02-copilot-prompt-patterns.md
git commit -m "docs: expand copilot-prompt-patterns with tables and context examples"
```

---

## Task 13: 薄いページ拡充 — `04-faq-and-troubleshooting.md`

**Files:**
- Modify: `docs/07-reference-and-scenario-playbook/04-faq-and-troubleshooting.md`

**Interfaces:**
- Produces: 30 行以上・10 件の Q&A を含む完成版ページ

- [ ] **Step 1: ファイルの内容を以下で完全に置き換える**

```markdown
# FAQ とトラブルシューティング

## 概要

GitHub / GitHub Copilot の実務運用でよく出る疑問と対処法をまとめたリファレンスです。

## よくある質問

### Q. `origin` と `upstream` の違いが分かりません

`origin` は自分が `push` する先（自分の fork またはチームの repo）、
`upstream` は本家リポジトリです。`fork` ベースで開発するときは両方を登録して使い分けます。

```powershell
git remote -v   # 現在の登録を確認する
```

詳細: [fork と upstream の基本](../03-collaboration-patterns/01-fork-and-upstream-basics.md)

---

### Q. `submodule` と `subtree` はどちらを選べばよいですか？

| 観点 | submodule | subtree |
|---|---|---|
| 履歴の独立 | 独立する | 取り込まれる |
| clone 時の操作 | `--recursive` が必要 | 不要 |
| 初学者の扱いやすさ | 難しい | やや易しい |

独立した履歴を厳密に管理したいなら `submodule`、利用側の操作を単純にしたいなら `subtree` が候補です。

詳細: [submodule vs subtree 判断ガイド](../04-shared-assets-and-multi-repo-management/03-submodule-vs-subtree-decision-guide.md)

---

### Q. Copilot の提案はそのまま使ってよいですか？

使えません。必ず以下を確認してから採用します:

1. **要件との一致**: 提案が仕様を満たしているか
2. **セキュリティ**: 入力バリデーション・認証処理が適切か
3. **テスト**: ローカルでテストを実行して動作確認しているか

---

### Q. CI が失敗しましたが、ローカルでは再現しません

以下を順番に確認します:

1. Node.js / 言語ランタイムのバージョンが CI と一致しているか（`.nvmrc` / `package.json` の `engines` を確認）
2. 環境変数が CI に設定されているか（リポジトリの `Settings > Secrets and variables` を確認）
3. CI のエラーログを Copilot Chat に貼り付けて原因仮説を聞く

詳細: [CI と GitHub Actions の基本](../05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md)

---

### Q. `git merge` と `git rebase` はどちらを使うべきですか？

| 観点 | merge | rebase |
|---|---|---|
| 履歴の形 | マージコミットが残る | 直線的になる |
| 操作の安全性 | 安全 | 操作ミスのリスクあり |

チームの規約に従うのが最優先です。決まっていない場合は `merge` を選ぶほうが安全です。

詳細: [merge と rebase の実践](../03-collaboration-patterns/03-merge-vs-rebase-in-practice.md)

---

### Q. PR のコンフリクトを解消する手順を教えてください

```powershell
git fetch origin
git switch feature/my-branch
git merge origin/main              # コンフリクトを発生させる
# コンフリクトマーカー（<<<<・====・>>>>）を手動で解消する
git add .
git commit -m "fix: resolve merge conflicts"
git push origin feature/my-branch
```

詳細: [Copilot でコンフリクトを解消する](../03-collaboration-patterns/04-resolving-conflicts-with-copilot.md)

---

### Q. `git submodule update` を忘れると何が起きますか？

submodule のコードが古いバージョンのままになります。
ビルドエラーや予期しない動作の原因になるため、`clone` や `pull` 後は必ず実行します。

```powershell
git submodule update --init --recursive
```

---

### Q. `copilot-instructions.md` が効いているか確認する方法は？

Copilot Chat で「あなたが現在認識しているプロジェクトのルールを教えてください」と尋ねます。
`.github/copilot-instructions.md` の内容が反映されていれば、ルールが読み込まれています。

詳細: [チーム向け copilot-instructions の作り方](../06-team-standards-and-governance/01-copilot-instructions-for-teams.md)

---

### Q. hotfix ブランチはいつ削除すればよいですか？

`main` と `release` の両方に merge されて CI が通ったあと、すぐに削除します。

```powershell
git branch -d hotfix/fix-login-error              # ローカル削除
git push origin --delete hotfix/fix-login-error   # リモート削除
```

詳細: [hotfix ワークフロー](../05-release-hotfix-and-operations/03-hotfix-workflow.md)

---

### Q. PR 説明文に何を書けばよいですか？

最低限、以下の 3 点を含めます:

1. **変更理由**: なぜこの変更が必要か（Issue 番号があれば `Closes #123` で紐付ける）
2. **変更内容**: 何を変えたか（ファイル・関数の概要）
3. **動作確認**: どのようにテスト・確認したか

詳細: [サンプル PR 説明文](06-sample-pr-descriptions.md)

## 関連ページ

- [コマンドチートシート](01-command-cheatsheet.md)
- [Copilot プロンプトパターン集](02-copilot-prompt-patterns.md)
- [シナリオ別逆引きガイド](03-scenario-index.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
```

- [ ] **Step 2: スクリプトでエラーが解消されたことを確認する**

```powershell
pwsh docs/superpowers/verify-docs.ps1 2>&1 | Select-String "04-faq"
```

期待される出力: 0 件

- [ ] **Step 3: コミットする**

```powershell
git add docs/07-reference-and-scenario-playbook/04-faq-and-troubleshooting.md
git commit -m "docs: expand faq page from 3 to 10 Q&As"
```

---

## Task 14: 最終検証

**Files:** なし（変更なし）

**Interfaces:**
- Consumes: Tasks 1〜13 の全成果物
- Produces: スクリプトが 0 エラーで通過する状態

- [ ] **Step 1: 全体の検証スクリプトを実行する**

```powershell
pwsh docs/superpowers/verify-docs.ps1
```

期待される出力:
```
✅ 全チェック通過 (XX ページ)
```

- [ ] **Step 2: エラーが残っている場合は対応する**

残存エラーに対して、該当ファイルを開いて:
- セクション不足 → テンプレート定義を参照して追加する
- 行数不足 → 各セクションに 1〜2 文ずつ内容を補足する
- ` ```bash ` → ` ```powershell ` に置換する

- [ ] **Step 3: 最終コミットを作成する**

```powershell
git add .
git commit -m "docs: complete consistency and quality pass for all 51 pages"
```
