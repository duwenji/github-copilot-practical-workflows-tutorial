# QUICK REFERENCE

## シナリオ別早見表

| シナリオ | まず使うもの | Copilot の使いどころ | 参照章 |
|---|---|---|---|
| 新規参加 | `clone`, `README`, `Issues` | 構成要約、初日チェック整理 | `01-getting-started-and-onboarding` |
| 日常開発 | branch, commit, PR | 実装案、テスト観点、PR 下書き | `02-daily-development-workflows` |
| 協業 | `fork`, `origin`, `upstream` | 同期手順、競合説明 | `03-collaboration-patterns` |
| 共有資産 | `submodule`, `subtree` | 選定理由の文書化 | `04-shared-assets-and-multi-repo-management` |
| リリース | Actions, tag, release | 差分要約、release note | `05-release-hotfix-and-operations` |
| チーム標準 | `copilot-instructions.md`, PR review | ルール整理、レビュー観点 | `06-team-standards-and-governance` |

## よく使うコマンド

```powershell
git status
git switch -c feature/my-task
git remote -v
git fetch upstream
git submodule update --init --recursive
npm run quiz:validate
npm run ebook:build
```

| コマンド | 主な引数 / オプション | 何をするか | 注意 |
|---|---|---|---|
| `git status` | なし | 変更状態を確認する | 作業前後の確認に使う |
| `git switch -c feature/my-task` | `-c`: branch を新規作成 | 新しい作業 branch を作って切り替える | 既存 branch へ移動するだけなら `-c` は不要 |
| `git remote -v` | `-v`: URL を詳しく表示 | `origin` / `upstream` の設定を確認する | push 先を間違えないために重要 |
| `git fetch upstream` | `upstream`: 本家 remote 名 | 本家の最新履歴を取得する | 取得だけで、まだ merge しない |
| `git submodule update --init --recursive` | `--init`: 初期化 / `--recursive`: ネストも対象 | submodule をまとめて更新する | clone 直後に実行することが多い |
| `npm run quiz:validate` | `quiz:validate`: script 名 | quiz データを検証する | PR 前の確認に向く |
| `npm run ebook:build` | `ebook:build`: script 名 | ebook 出力を build する | release / 公開前に実行する |

> 詳しい引数説明と例は [`docs/07-reference-and-scenario-playbook/01-command-cheatsheet.md`](docs/07-reference-and-scenario-playbook/01-command-cheatsheet.md) を参照してください。

## 基本原則
- Copilot の提案は **必ず人が確認する**
- `fork/upstream` と `submodule/subtree` は **用語ではなく場面で覚える**
- release / hotfix では **記録を省略しない**
