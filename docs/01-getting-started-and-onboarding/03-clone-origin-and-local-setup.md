# clone、origin、ローカルセットアップ

## まず理解すること

`git clone` すると、通常は clone 元が `origin` として登録されます。

```powershell
git clone <repo-url>
cd <repo-name>
git remote -v
```

## コマンドと引数の意味

- `git clone <repo-url>`
  - `clone`: repository をローカルへ複製する
  - `<repo-url>`: GitHub 上の clone 用 URL
- `cd <repo-name>`
  - `cd`: 作業ディレクトリを移動する
  - `<repo-name>`: clone 後に作成されたフォルダー名
- `git remote -v`
  - `remote`: 登録済みリモートを扱う
  - `-v`: URL を含めて詳しく表示する (`verbose`)

> `git clone` した直後は、clone 元が通常 `origin` として自動登録されます。まず `git remote -v` で向きを確認すると安心です。

## 初回に確認する項目

- 依存関係のインストール方法
- 開発サーバーやテストの起動方法
- ブランチ戦略
- PR のルール

## Copilot の使いどころ

- `README` の要点要約
- セットアップ手順の見落としチェック
- 不明なスクリプトの意味確認

## 注意点

- `main` に直接 push しない
- 環境変数やシークレットを勝手に作らない
- まずローカルで `build` / `test` が通るか確認する
