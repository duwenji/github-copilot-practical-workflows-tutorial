# GitHub Pages と公開手順

## 典型シナリオ

ドキュメントや成果物を GitHub Pages で公開し、チームや外部に共有する場面です。
`pages.yml` ワークフローが `main` への push をトリガーに自動公開します。

## コンセプトと仕組み

- リポジトリのコンテンツを静的サイトとして公開する `GitHub Pages` の機能概要
- `.github/workflows/pages.yml` に定義したワークフローによる自動ビルドと公開
- `GitHub Actions` 選択によるカスタムビルドスクリプトの組み込み
- `validate.yml` を使った ebook ビルド成否の事前確認
- `https://<org>.github.io/<repo>/` 形式の公開 URL
- Jekyll ビルド使用時の `_config.yml` によるサイト設定の管理

## 基本手順

1. GitHub でリポジトリを作成すること
2. `main` ブランチへ push すること
3. Settings → Pages で `GitHub Actions` を選ぶこと
4. `pages.yml` の実行結果を確認すること
5. 公開 URL を `README` に反映すること

## このリポジトリの公開導線

- `docs/` を GitHub Pages で公開すること
- `pages.yml` が `main` への push をトリガーとした自動実行
- `validate.yml` による ebook build の事前確認
- 公開前の `npm run ebook:build` によるローカル確認の実施

## 事前確認

- `npm run ebook:build`
  - `run`: `package.json` に定義した script を実行すること
  - `ebook:build`: ebook 出力を生成して build 状態を確認するスクリプト名

```powershell
npm run ebook:build
```

- `README` と `docs/index.md` のリンク確認

## コマンドと引数の意味

- `npm run ebook:build`
  - `npm run`: `package.json` の `scripts` に定義したコマンドを実行すること
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
