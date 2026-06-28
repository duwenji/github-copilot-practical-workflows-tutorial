# clone、origin、ローカルセットアップ

## 典型シナリオ

既存のリポジトリに参加した初日、ローカル環境を用意してすぐに作業を始めたい場面です。
`git clone` でリポジトリを取得し、`origin` の向き先を確認してから開発に着手します。

## コンセプトと仕組み

- `git clone` するとリモートリポジトリの完全なコピーがローカルに作成されること
- clone 元のリモートは自動的に `origin` という名前で登録されること
- `git remote -v` で登録されたリモートの URL を確認できること
- ローカル環境では依存関係のインストールやビルド確認が必要な場合があること

## 基本手順

1. `git clone <repo-url>` でリポジトリをローカルへ複製する
2. `cd <repo-name>` でリポジトリのディレクトリに移動する
3. `git remote -v` で `origin` の URL が正しいことを確認する
4. `README` や開発ルールを読んで依存関係のインストール手順を確認する
5. `npm install` などの依存関係インストールを実行する
6. ビルドとテストが通ることをローカルで確認する

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

- `main` に直接 push しないこと
- 環境変数やシークレットを勝手に作らないこと
- まずローカルで `build` / `test` が通るか確認すること

## 章末チェック

- `git clone` した後に `git remote -v` で `origin` の URL を確認できる
- ローカルでビルドとテストが正常に通ることを確認できる
- ブランチ戦略と PR のルールを把握している
