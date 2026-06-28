# 協業チェックリスト

## 概要

Fork / upstream を使った協業の各ステップで確認すべき項目のチェックリストです。

## fork / upstream 運用

- [ ] `origin` と `upstream` の役割を確認したこと
- [ ] 本家との差分を最新化したこと
- [ ] 同期後に build / test の確認を行ったこと

## PR 作成前

- [ ] 変更理由の説明ができること
- [ ] レビュー観点の整理が完了していること
- [ ] コンフリクトがないことの確認が完了していること

## コンフリクト解消

- [ ] コンフリクトが発生しているファイルの確認が完了していること
- [ ] 両方の変更意図の把握が完了していること
- [ ] 解消後のビルドとテストの実行が完了していること

## マージ / リベース方針

- [ ] チームの `merge` / `rebase` 規約を確認したこと
- [ ] 共有ブランチへの `rebase` を避けていること

## 関連ページ

- [fork と upstream の基本](01-fork-and-upstream-basics.md)
- [upstream との同期](02-syncing-with-upstream.md)
- [ハンズオン: fork / upstream 同期](07-hands-on-lab-fork-sync.md)
