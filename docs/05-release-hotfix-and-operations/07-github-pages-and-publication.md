# GitHub Pages と公開手順

## このリポジトリの公開導線

- `docs/` を GitHub Pages で公開する
- `pages.yml` が `main` への push をトリガーに動く
- `validate.yml` で quiz と ebook を事前確認する

## 基本手順

1. GitHub でリポジトリを作成する
2. `main` ブランチへ push する
3. Settings → Pages で `GitHub Actions` を選ぶ
4. `pages.yml` の実行結果を確認する

## 事前確認

- `npm run quiz:validate`
  - `run`: `package.json` に定義した script を実行する
  - `quiz:validate`: quiz データを一括検証する script 名
- `npm run ebook:build`
  - `run`: `package.json` に定義した script を実行する
  - `ebook:build`: ebook 出力を生成して build 状態を確認する script 名
- `README` と `docs/index.md` のリンク確認

> quiz の形式ゆれを先に整えたい場合は、`npm run quiz:normalize` を使ってから `npm run quiz:validate` を再実行すると整理しやすいです。

## 注意点

- Pages は公開 URL が確定したら `README` に反映する
- Jekyll のビルドエラーが出た場合は `docs/_config.yml` も確認する
