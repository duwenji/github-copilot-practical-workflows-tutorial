# シナリオ別逆引きガイド

## こんなときはどこを読むか

- 新しい repo に参加する → `01-getting-started-and-onboarding`
- 普通の機能追加を進める → `02-daily-development-workflows`
- fork 先から本家に追従したい → `03-collaboration-patterns`
- 共通テンプレートを複数 repo で配りたい → `04-shared-assets-and-multi-repo-management`
- release 前後の対応を知りたい → `05-release-hotfix-and-operations`
- チーム標準やルールを決めたい → `06-team-standards-and-governance`

## シナリオ別によく見るコマンド

| シナリオ | まず見るコマンド | 補足 |
|---|---|---|
| 新しい repo に参加する | `git clone <repo-url>`, `git remote -v` | clone と remote の向きを確認する |
| 機能追加を始める | `git pull origin main`, `git switch -c feature/...` | 最新化してから作業 branch を切る |
| commit / PR を出す | `git add .`, `git commit -m "..."`, `git push origin ...` | 変更記録と共有に使う |
| fork を同期する | `git fetch upstream`, `git merge upstream/main` | 本家の変更取り込み |
| 公開前を確認する | `npm run ebook:build` | 公開 build を確認する |

> 各コマンドの引数の意味は [`01-command-cheatsheet.md`](01-command-cheatsheet.md) を参照してください。
