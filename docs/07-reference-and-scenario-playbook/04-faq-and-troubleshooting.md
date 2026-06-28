# FAQ とトラブルシューティング

## 概要

教材を進める中でよく出る疑問とトラブルへの対処法をまとめたリファレンスです。
Git / GitHub / Copilot に関する Q&A を一覧で確認できます。

## よくある質問

### Q. `origin` と `upstream` が混乱します
A. `origin` は自分が push する先、`upstream` は本家です。
図で確認したい場合は [fork / upstream の関係を図で理解する](../03-collaboration-patterns/05-fork-upstream-visual-guide.md) を参照してください。

### Q. `submodule` と `subtree` はどちらを選べばよいですか？
A. 独立履歴を厳密に管理したいなら `submodule`、利用側を単純にしたいなら `subtree` が候補です。
詳しい選定基準は [実務シナリオ判断マトリクス](05-practical-decision-matrix.md) を参照してください。

### Q. Copilot の提案はそのまま使ってよいですか？
A. いいえ。要件・設計・セキュリティ・テストの観点で確認が必要です。

### Q. `git merge` と `git rebase` はどう使い分けますか？
A. チームの履歴管理ポリシーに従います。
merge はマージコミットを残す方針、rebase は履歴を線形に整える方針での使用が一般的です。

### Q. PR レビューのコメントへの返信は Copilot に頼めますか？
A. はい。「このレビューコメントに対する返信案を出して」というプロンプトが有効です。
[Copilot プロンプトパターン集](02-copilot-prompt-patterns.md) も参照してください。

## 注意

- トラブル発生時はまず `git status` で現在の状態を確認すること
- 不明な点はチームに相談してから操作を進めること

## 関連ページ

- [Git / GitHub コマンド早見表](01-command-cheatsheet.md)
- [Copilot プロンプトパターン集](02-copilot-prompt-patterns.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
