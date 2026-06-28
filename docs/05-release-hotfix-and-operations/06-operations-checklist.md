# release / hotfix 運用チェックリスト

## 概要

release 前・hotfix 時の確認事項をまとめた運用チェックリストです。
手順漏れや判断ミスを防ぐために、毎回このリストを参照することを推奨します。

## release 前

- [ ] 対象変更が揃っていること
- [ ] CI が通っていること
- [ ] `npm run ebook:build` を実行して公開物の build 成功を確認したこと
- [ ] release note を準備したこと
- [ ] 利害関係者への共有が完了していること
- [ ] ロールバック手順を事前に確認したこと

## hotfix 時

- [ ] 影響範囲を確認したこと
- [ ] 最小修正に絞ったこと
- [ ] レビューと記録を残したこと
- [ ] 事後確認と振り返りを実施したこと
- [ ] 本番適用後のモニタリングを継続したこと

## rollback 判断基準

- [ ] 想定外の不具合が確認されたこと
- [ ] 重大な性能劣化が検知されたこと
- [ ] 本番データまたは外部連携に問題が発生したこと
- [ ] rollback 先のバージョンが明確になっていること
- [ ] 関係者への連絡が完了していること

## 関連ページ

- [release の準備](02-preparing-a-release.md)
- [hotfix ワークフロー](03-hotfix-workflow.md)
- [ロールバックとリリース後確認](04-rollback-and-post-release-checks.md)
- [ハンズオン: release / hotfix ドリル](08-hands-on-release-drill.md)
