# VALIDATION CHECKLIST

## Repository health
- [ ] `README.md` のリンクが機能する
- [ ] `docs/index.md` から主要章に遷移できる
- [ ] `MASTER-INDEX.md` が最新

## Commands
- [ ] `npm install`
  - 依存関係をインストールする
- [ ] `npm run ebook:build`
  - ebook 出力を生成して build エラーを確認する

## Content quality
- [ ] `Issue → Branch → PR → Review → Merge` が説明されている
- [ ] `fork` / `upstream` が含まれている
- [ ] `submodule` / `subtree` が含まれている
- [ ] release / hotfix / governance が含まれている

## Publication
- [ ] `.github/workflows/pages.yml` がある
- [ ] `.github/workflows/validate.yml` がある
- [ ] `LICENSE`, `CONTRIBUTING.md`, `CHANGELOG.md`, `ROADMAP.md` がある
