# commit と PR のベストプラクティス

## commit の基本

- 1 commit 1 意図を意識する
- メッセージは変更内容が分かるように書く

```powershell
git add .
git commit -m "Add quiz filter to selector"
```

## コマンドと引数の意味

- `git add .`
  - `add`: commit 対象として staging する
  - `.`: 現在フォルダー以下の変更をまとめて対象にする
- `git commit -m "Add quiz filter to selector"`
  - `commit`: staging 済み変更を履歴として記録する
  - `-m`: commit message をその場で指定する
  - `"Add quiz filter to selector"`: 変更内容を表すメッセージ

> まとめて `git add .` したときは、`git status` で意図しないファイルが入っていないか確認すると安全です。

## PR の基本

PR には少なくとも以下を含めます。

- 何を変えたか
- なぜ変えたか
- どう確認したか
- レビュアーに見てほしい点

## Copilot の使いどころ

- PR 本文の下書き作成
- 変更概要の要約
- レビュー観点の洗い出し

## 注意点

- 大きすぎる PR は分割する
- スクリーンショットや再現手順を必要に応じて添える
- CI が赤いまま出さない
