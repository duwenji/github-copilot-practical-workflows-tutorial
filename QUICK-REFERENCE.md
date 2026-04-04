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

## 基本原則
- Copilot の提案は **必ず人が確認する**
- `fork/upstream` と `submodule/subtree` は **用語ではなく場面で覚える**
- release / hotfix では **記録を省略しない**
