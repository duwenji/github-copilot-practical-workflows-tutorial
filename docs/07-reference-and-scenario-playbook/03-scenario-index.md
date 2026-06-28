# シナリオ別逆引きガイド

## 概要

「こんなとき、どの章を読むか」を素早く見つけるための逆引きインデックスです。
作業シナリオから該当する章・コマンド・図の場所を一覧で確認できます。

## シナリオ別ガイド

### 章・シナリオの対応

- 新しい repo に参加する場面 → `01-getting-started-and-onboarding`
- 普通の機能追加を進める場面 → `02-daily-development-workflows`
- fork 先から本家に追従したい場面 → `03-collaboration-patterns`
- 共通テンプレートを複数 repo で配りたい場面 → `04-shared-assets-and-multi-repo-management`
- release 前後の対応を知りたい場面 → `05-release-hotfix-and-operations`
- チーム標準やルールを決めたい場面 → `06-team-standards-and-governance`

### シナリオ別によく見るコマンド

| シナリオ | まず見るコマンド | 補足 |
|---|---|---|
| 新しい repo に参加する | `git clone <repo-url>`, `git remote -v` | clone と remote の向きを確認する |
| 機能追加を始める | `git pull origin main`, `git switch -c feature/...` | 最新化してから作業 branch を切る |
| commit / PR を出す | `git add .`, `git commit -m "..."`, `git push origin ...` | 変更記録と共有に使う |
| fork を同期する | `git fetch upstream`, `git merge upstream/main` | 本家の変更取り込み |
| 公開前を確認する | `npm run ebook:build` | 公開 build を確認する |

> 各コマンドの引数の意味は [`01-command-cheatsheet.md`](01-command-cheatsheet.md) を参照してください。

## 使い方

新しい作業に入るときは、まず **どのシナリオか** を決めます。
迷ったらこのインデックスで当てはまる行を見つけ、対応する章の順に参照すると理解しやすくなります。

## 関連ページ

- [Git / GitHub コマンド早見表](01-command-cheatsheet.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
- [FAQ とトラブルシューティング](04-faq-and-troubleshooting.md)
