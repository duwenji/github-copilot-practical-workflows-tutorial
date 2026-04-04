# 公開前チェックリスト

## リポジトリ全体
- [ ] `README.md` の導線が分かりやすい
- [ ] `MASTER-INDEX.md` が最新
- [ ] `CONTRIBUTING.md` が存在する
- [ ] ライセンスが明記されている

## 検証
- [ ] `npm run quiz:validate` が成功する
  - `run`: `package.json` の script を実行する
  - `quiz:validate`: quiz データと metadata の整合性を確認する script
- [ ] `npm run ebook:build` が成功する
  - `run`: `package.json` の script を実行する
  - `ebook:build`: ebook 出力を生成して公開物を確認する script
- [ ] GitHub Pages の workflow 設定がある

## 公開品質
- [ ] 主要シナリオが本編で網羅されている
- [ ] `fork/upstream` と `submodule/subtree` の説明がある
- [ ] ガバナンスとレビュー観点が含まれている
- [ ] 追加で必要な図や例が残っていない
