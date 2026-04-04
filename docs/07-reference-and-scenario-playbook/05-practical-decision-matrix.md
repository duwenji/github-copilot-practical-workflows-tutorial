# 実務シナリオ判断マトリクス

| シナリオ | まず使う GitHub 機能 | Copilot の使いどころ | 判断ポイント | 図で見るなら |
|---|---|---|---|---|
| 既存 repo 参加 | `clone`, `Issues`, `README` | 構成要約、初日チェック整理 | ルールと禁止事項を先に把握する | `01-getting-started-and-onboarding` |
| 普通の機能追加 | branch, commit, PR | 実装たたき台、テスト観点 | 要件との一致を最優先 | `02-daily-development-workflows/05-end-to-end-workflow-map.md` |
| fork ベース協業 | `fork`, `origin`, `upstream` | 同期手順整理、競合説明 | 本家とのズレをためない | `03-collaboration-patterns/05-fork-upstream-visual-guide.md` |
| 共有資産管理 | `submodule` / `subtree` | 選定理由や更新手順の文書化 | 管理負荷と分かりやすさ | `04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md` |
| release / hotfix | Actions, release, tag | 差分要約、手順書下書き | 速度より記録の質も重視 | `05-release-hotfix-and-operations/05-release-flow-diagram.md` |
| チーム標準化 | repo settings, templates | `copilot-instructions.md` 整備 | 安全性と再現性 | `06-team-standards-and-governance` |

## 使い方

新しい作業に入るときは、まず **どのシナリオか** を決めます。迷ったらこのマトリクスで当てはまる行を見つけ、対応する章・図・チェック項目の順に参照すると理解しやすくなります。
