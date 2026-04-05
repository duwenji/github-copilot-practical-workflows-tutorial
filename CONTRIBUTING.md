# Contributing

このリポジトリへの改善提案や修正は歓迎します。

## 基本方針

- 単なる機能説明ではなく、**実務シナリオに結びつく内容**を優先してください。
- `GitHub` と `GitHub Copilot` の説明は、安全性・レビュー・検証を前提にしてください。
- 大きな変更は `Issue` で背景を共有してから進めてください。

## 推奨フロー

1. `Issue` を作成する
2. branch を切る
3. 変更を加える
4. `npm run ebook:build` を実行する
5. `Pull Request` を作成する

### コマンド補足

- `npm run ebook:build`
  - `run`: `package.json` の script を実行する
  - `ebook:build`: ebook 出力を生成する script 名
  - **目的:** 公開物の build エラーやリンク崩れを早めに見つける

## レビュー観点

- 実務で使える内容になっているか
- 誤解を生む説明がないか
- コマンドや手順が再現可能か
- セキュリティ上の注意が書かれているか
