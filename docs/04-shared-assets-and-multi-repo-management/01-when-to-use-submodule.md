# submodule を使うべき場面

## 向いているケース

`submodule` は、**共有資産を独立した履歴のまま参照したい** ときに向いています。

例:
- 共通テンプレート repo
- shared skills / shared docs
- 複数プロジェクトで使う内部ライブラリ

## メリット

- 共有物の履歴が独立する
- 参照するバージョンを repo ごとに固定できる
- upstream 側の更新を段階的に取り込める

## 注意点

- clone 時に `--recursive` が必要になることがある
- 更新方法をチームで統一しないと混乱しやすい
- 初学者には少し分かりにくい

## 代表的なコマンド

```powershell
git submodule update --init --recursive
```

- `update`: 登録済み submodule を現在の指定 revision に合わせる
- `--init`: 未初期化の submodule を初期化する
- `--recursive`: 入れ子になった submodule までまとめて処理する

> shared assets を初めて取得した直後に実行することが多いコマンドです。

## Copilot の使いどころ

- `submodule` 更新手順の説明作成
- `.gitmodules` の読み解き
- 更新時のレビュー観点整理
