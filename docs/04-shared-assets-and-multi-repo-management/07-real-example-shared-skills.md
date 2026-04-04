# 実例: shared repo と consumer repo の構成

## 例として見る構成

このワークスペースには、共有資産を別 repo で管理し、複数の consumer repo から利用する実例があります。

- `shared-copilot-skills` — 共通の skill / ebook-build / quiz-generator を保持
- `github-copilot-custom-agents-tutorial` — consumer repo の例
- `spa-quiz-app` — consumer repo の例

## どこが実務的か

- shared 側は **共通ロジック** を持つ
- consumer 側は `.github/skills-config/` に **repo 固有の wrapper と config** を置く
- 共有物を一括更新したいときに、`submodule` や shared repo 参照が役立つ

## 学べること

- 共通化と repo 固有化の分離
- shared repo 更新時の影響の考え方
- `submodule` / `subtree` の選定理由を現実の構成で理解する

## 見るべき場所

- `shared-copilot-skills/`
- `github-copilot-custom-agents-tutorial/.github/skills-config/`
- `spa-quiz-app/.github/skills-config/`
