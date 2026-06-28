# GitHub Pages と公開手順

## 典型シナリオ

ドキュメントや成果物を GitHub Pages で公開し、チームや外部に共有する場面です。
`pages.yml` ワークフローが `main` への push をトリガーに自動公開します。

## コンセプトと仕組み

- `GitHub Pages` は、リポジトリのコンテンツを静的サイトとして公開する機能です。
- `.github/workflows/pages.yml` に定義したワークフローが自動でビルドと公開を行います。
- `GitHub Actions` を選択することで、カスタムビルドスクリプトを組み込めます。
- `validate.yml` で事前に ebook ビルドの成否を確認してから公開します。
- 公開 URL は `https://<org>.github.io/<repo>/` の形式になります。
- Jekyll ビルドを使用する場合は `_config.yml` でサイト設定を管理します。

## 基本手順

1. GitHub でリポジトリを作成すること
2. `main` ブランチへ push すること
3. Settings → Pages で `GitHub Actions` を選ぶこと
4. `pages.yml` の実行結果を確認すること
5. 公開 URL を `README` に反映すること

## このリポジトリの公開導線

- `docs/` を GitHub Pages で公開する
- `pages.yml` が `main` への push をトリガーに動く
- `validate.yml` で ebook build を事前確認する
- 公開前に `npm run ebook:build` でローカル確認を行う

## 事前確認

- `npm run ebook:build`
  - `run`: `package.json` に定義した script を実行すること
  - `ebook:build`: ebook 出力を生成して build 状態を確認する script 名

```powershell
npm run ebook:build
```

- `README` と `docs/index.md` のリンク確認

## コマンドと引数の意味

- `npm run ebook:build`
  - `npm run`: `package.json` の `scripts` に定義したコマンドを実行する
  - `ebook:build`: ebook 形式での出力とビルド確認を行うスクリプト名

## Copilot の使いどころ

- `pages.yml` の設定確認と修正案の提案
- Jekyll ビルドエラーの原因調査
- 公開前チェックリストの整理
- 公開 URL の動作確認手順の相談

## 注意点

- Pages は公開 URL が確定したら `README` に反映すること
- Jekyll のビルドエラーが出た場合は `docs/_config.yml` も確認すること
- 機密情報を `docs/` に含めないこと

## 章末チェック

- GitHub Pages の設定手順を説明できること
- `pages.yml` ワークフローの役割を説明できること
- ビルドエラー発生時の調査手順を Copilot と一緒に実施できること
