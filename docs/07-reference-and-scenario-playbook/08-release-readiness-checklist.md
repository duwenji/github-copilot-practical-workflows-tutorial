# 公開前チェックリスト

## 概要

教材を公開する前に確認すべき項目をまとめたチェックリストです。
リポジトリ全体・検証・公開品質の観点から必要な確認事項を網羅しています。

## チェックリスト

### リポジトリ全体

- [ ] `README.md` の導線が分かりやすいこと
- [ ] `MASTER-INDEX.md` が最新の状態であること
- [ ] `CONTRIBUTING.md` が存在すること
- [ ] ライセンスが明記されていること
- [ ] ブランチ保護ルールが設定されていること

### 検証

- [ ] `npm run ebook:build` が成功すること
  - `run`: `package.json` の script を実行する
  - `ebook:build`: ebook 出力を生成して公開物を確認する script
- [ ] GitHub Pages の workflow 設定があること
- [ ] リンク切れがないこと

### 公開品質

- [ ] 主要シナリオが本編で網羅されていること
- [ ] `fork/upstream` と `submodule/subtree` の説明があること
- [ ] ガバナンスとレビュー観点が含まれていること
- [ ] 追加で必要な図や例が残っていないこと
- [ ] 各章のチェックリストページが揃っていること
- [ ] サンプルコードと説明の整合性が取れていること

## 注意

- チェックは公開直前だけでなく、大きな変更のたびに実行すること
- `npm run ebook:build` エラーは公開前に必ず解消すること

## 関連ページ

- [Git / GitHub コマンド早見表](01-command-cheatsheet.md)
- [サンプル PR 説明文](06-sample-pr-descriptions.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
