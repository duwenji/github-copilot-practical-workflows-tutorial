# GitHub + GitHub Copilot 実務シナリオ完全チュートリアル

`GitHub` と `GitHub Copilot` を、**実務で起こるシナリオ単位**で学ぶ日本語チュートリアルです。

> 💡 ブラウザで https://duwenji.github.io/spa-quiz-app/ を開くと、この教材をクイズ形式で学習できます。

> 🔁 クイズ同期時の更新基準は [docs/quiz-sync-guide.md](docs/quiz-sync-guide.md) を参照してください。


> 機能の説明だけでなく、`Issue → Branch → PR → Review → Merge`、`fork/upstream`、`submodule/subtree`、`release/hotfix`、チーム標準化までを一気通貫で扱います。

---

## この教材で学べること

- 既存リポジトリに参加するときの基本動作
- 日常開発での `GitHub` + `Copilot` の使いどころ
- `fork` / `upstream` を含む協業パターン
- `submodule` / `subtree` を使った共有資産管理の考え方
- `GitHub Actions` を使った CI / release / hotfix の基礎
- `copilot-instructions.md` を使ったチーム標準化とガバナンス

---

## 想定読者

- GitHub を日常業務で使う開発者
- GitHub Copilot を実務で定着させたいチームリード
- 複数 repo や shared assets を扱うメンテナ

---

## 扱う実務シナリオ

1. **オンボーディング** — clone、権限、初期セットアップ
2. **日常開発** — Issue、branch、実装、commit、PR
3. **協業** — `fork`、`origin` / `upstream`、レビュー、conflict 解消
4. **共有資産管理** — `submodule`、`subtree`、テンプレート repo
5. **運用・リリース** — Actions、tag、release、hotfix、rollback
6. **チーム標準化** — `copilot-instructions.md`、レビュー基準、ガバナンス

---

## おすすめ学習ルート

| 読者 | 最初に読む章 | 次に読む章 |
|---|---|---|
| 日常開発を回したい開発者 | `02-daily-development-workflows` | `03-collaboration-patterns` |
| fork 運用が多いメンテナ | `03-collaboration-patterns` | `05-release-hotfix-and-operations` |
| shared repo を扱う担当者 | `04-shared-assets-and-multi-repo-management` | `06-team-standards-and-governance` |
| チーム標準を整えたいリード | `06-team-standards-and-governance` | `07-reference-and-scenario-playbook` |

## 図で全体像をつかむなら

- [`fork / upstream` の全体関係図](docs/03-collaboration-patterns/05-fork-upstream-visual-guide.md)
- [日常開発の全体フローマップ](docs/02-daily-development-workflows/05-end-to-end-workflow-map.md)
- [`submodule / subtree` の構造比較図](docs/04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md)
- [release / hotfix の全体フロー図](docs/05-release-hotfix-and-operations/05-release-flow-diagram.md)
- [図の見方と用語の凡例](docs/07-reference-and-scenario-playbook/09-diagram-legend.md)

---

## 目次

### 01. Getting Started and Onboarding
- [この教材の範囲と進め方](docs/01-getting-started-and-onboarding/01-what-this-tutorial-covers.md)
- [GitHub と Copilot の初期セットアップ](docs/01-getting-started-and-onboarding/02-github-and-copilot-setup.md)
- [clone、origin、ローカルセットアップ](docs/01-getting-started-and-onboarding/03-clone-origin-and-local-setup.md)
- [既存リポジトリに参加した初日にやること](docs/01-getting-started-and-onboarding/04-first-day-on-an-existing-repo.md)

### 02. Daily Development Workflows
- [Issue から branch を切るまで](docs/02-daily-development-workflows/01-from-issue-to-branch.md)
- [Copilot を使った実装の進め方](docs/02-daily-development-workflows/02-copilot-for-implementation.md)
- [commit と PR のベストプラクティス](docs/02-daily-development-workflows/03-commit-and-pr-best-practices.md)
- [レビュー指摘への対応と fixup](docs/02-daily-development-workflows/04-review-feedback-and-fixup.md)
- [日常開発の全体フローマップ](docs/02-daily-development-workflows/05-end-to-end-workflow-map.md)
- [ハンズオン: Issue から PR までを一通り回す](docs/02-daily-development-workflows/06-hands-on-lab-issue-to-pr.md)

### 03. Collaboration Patterns
- [fork と upstream の基本](docs/03-collaboration-patterns/01-fork-and-upstream-basics.md)
- [upstream と同期する](docs/03-collaboration-patterns/02-syncing-with-upstream.md)
- [merge と rebase の実務的な使い分け](docs/03-collaboration-patterns/03-merge-vs-rebase-in-practice.md)
- [conflict を Copilot と解消する](docs/03-collaboration-patterns/04-resolving-conflicts-with-copilot.md)
- [fork / upstream の関係を図で理解する](docs/03-collaboration-patterns/05-fork-upstream-visual-guide.md)
- [協業チェックリスト](docs/03-collaboration-patterns/06-collaboration-checklist.md)
- [ハンズオン: fork / upstream 同期を試す](docs/03-collaboration-patterns/07-hands-on-lab-fork-sync.md)

### 04. Shared Assets and Multi-Repo Management
- [submodule を使うべき場面](docs/04-shared-assets-and-multi-repo-management/01-when-to-use-submodule.md)
- [subtree を使うべき場面](docs/04-shared-assets-and-multi-repo-management/02-when-to-use-subtree.md)
- [submodule vs subtree 判断ガイド](docs/04-shared-assets-and-multi-repo-management/03-submodule-vs-subtree-decision-guide.md)
- [shared templates / skills を複数 repo で管理する](docs/04-shared-assets-and-multi-repo-management/04-managing-shared-templates-and-skills.md)
- [submodule / subtree の見え方を図で整理する](docs/04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md)
- [ハンズオン: shared repo 戦略を決める](docs/04-shared-assets-and-multi-repo-management/06-shared-repo-strategy-lab.md)

### 05. Release, Hotfix and Operations
- [CI と GitHub Actions の基本](docs/05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md)
- [release 準備の進め方](docs/05-release-hotfix-and-operations/02-preparing-a-release.md)
- [hotfix 対応フロー](docs/05-release-hotfix-and-operations/03-hotfix-workflow.md)
- [rollback とリリース後確認](docs/05-release-hotfix-and-operations/04-rollback-and-post-release-checks.md)
- [release / hotfix の流れを図で見る](docs/05-release-hotfix-and-operations/05-release-flow-diagram.md)
- [release / hotfix 運用チェックリスト](docs/05-release-hotfix-and-operations/06-operations-checklist.md)
- [GitHub Pages と公開手順](docs/05-release-hotfix-and-operations/07-github-pages-and-publication.md)
- [ハンズオン: release / hotfix ドリル](docs/05-release-hotfix-and-operations/08-hands-on-release-drill.md)

### 06. Team Standards and Governance
- [チーム向け copilot-instructions の作り方](docs/06-team-standards-and-governance/01-copilot-instructions-for-teams.md)
- [PR レビューチェックリスト](docs/06-team-standards-and-governance/02-pr-review-checklist.md)
- [セキュリティと Content Exclusion](docs/06-team-standards-and-governance/03-security-and-content-exclusion.md)
- [KPI と定着化メトリクス](docs/06-team-standards-and-governance/04-kpi-and-adoption-metrics.md)
- [サンプルチームポリシー](docs/06-team-standards-and-governance/05-sample-team-policy.md)
- [チーム導入チェックリスト](docs/06-team-standards-and-governance/06-team-adoption-checklist.md)

### 07. Reference and Scenario Playbook
- [コマンド早見表](docs/07-reference-and-scenario-playbook/01-command-cheatsheet.md)
- [Copilot プロンプトパターン集](docs/07-reference-and-scenario-playbook/02-copilot-prompt-patterns.md)
- [シナリオ別逆引きガイド](docs/07-reference-and-scenario-playbook/03-scenario-index.md)
- [FAQ とトラブルシューティング](docs/07-reference-and-scenario-playbook/04-faq-and-troubleshooting.md)
- [実務シナリオ判断マトリクス](docs/07-reference-and-scenario-playbook/05-practical-decision-matrix.md)
- [サンプル PR 説明文](docs/07-reference-and-scenario-playbook/06-sample-pr-descriptions.md)
- [サンプル Copilot Chat プロンプト](docs/07-reference-and-scenario-playbook/07-sample-copilot-chat-prompts.md)
- [公開前チェックリスト](docs/07-reference-and-scenario-playbook/08-release-readiness-checklist.md)
- [図の見方と用語の凡例](docs/07-reference-and-scenario-playbook/09-diagram-legend.md)

---

## クイックスタート

```powershell
git clone <repo-url>
cd github-copilot-practical-workflows-tutorial
npm install
code .
```

1. `README.md` で全体像を確認する
2. `docs/01-getting-started-and-onboarding/` から読み始める
3. 必要に応じて `npm run quiz:validate` と `npm run ebook:build` を実行する
4. ハンズオンでサンプル repo を使いながら手を動かす

---

## 補助資料と公開準備

- `copilot-instructions.md` テンプレート
- PR レビューチェックリスト
- KPI / 導入効果測定テンプレート
- Pages / ebook / quiz 連携
- [MASTER-INDEX](MASTER-INDEX.md)
- [QUICK-REFERENCE](QUICK-REFERENCE.md)
- [COMPLETION-REPORT](COMPLETION-REPORT.md)
- [PUBLISHING GUIDE](PUBLISHING.md)
- [CHANGELOG](CHANGELOG.md)
- [ROADMAP](ROADMAP.md)
- [公開前チェックリスト](docs/07-reference-and-scenario-playbook/08-release-readiness-checklist.md)
- [GitHub Pages と公開手順](docs/05-release-hotfix-and-operations/07-github-pages-and-publication.md)
- [VALIDATION_CHECKLIST](VALIDATION_CHECKLIST.md)

---

## 実装状況

- ✅ リポジトリ骨格を作成
- ✅ README と章構成を初期化
- ✅ 主要シナリオのスターターページを追加
- 🔄 各章の本文を拡充中
