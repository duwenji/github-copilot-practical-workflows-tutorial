# 実務シナリオ判断マトリクス

| シナリオ | まず使う GitHub 機能 | Copilot の使いどころ | 判断ポイント |
|---|---|---|---|
| 既存 repo 参加 | `clone`, `Issues`, `README` | 構成要約、初日チェック整理 | ルールと禁止事項を先に把握する |
| 普通の機能追加 | branch, commit, PR | 実装たたき台、テスト観点 | 要件との一致を最優先 |
| fork ベース協業 | `fork`, `origin`, `upstream` | 同期手順整理、競合説明 | 本家とのズレをためない |
| 共有資産管理 | `submodule` / `subtree` | 選定理由や更新手順の文書化 | 管理負荷と分かりやすさ |
| release / hotfix | Actions, release, tag | 差分要約、手順書下書き | 速度より記録の質も重視 |
| チーム標準化 | repo settings, templates | `copilot-instructions.md` 整備 | 安全性と再現性 |

## 使い方

新しい作業に入るときは、まず **どのシナリオか** を決め、そのシナリオに対応する章とチェック項目を参照します。
