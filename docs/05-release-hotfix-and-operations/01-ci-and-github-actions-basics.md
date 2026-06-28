# CI と GitHub Actions の基本

## 典型シナリオ

PR を作成したら `GitHub Actions` が自動で走り、lint / test / build の結果を GitHub 上で確認する場面です。
CI が赤い（失敗している）場合は原因を特定して修正してから merge します。

## コンセプトと仕組み

- `GitHub Actions` は `.github/workflows/` 以下の YAML ファイルで定義された自動処理を実行するサービスであること
- PR を作成・更新するたびにトリガーされ、結果を PR の `Checks` タブに表示すること
- lint・test・build を自動化することで、人間のレビューより先に機械的なチェックを通過させること

## 基本手順

1. PR を作成する（または push する）
2. PR の `Checks` タブを開く
3. 実行中のジョブ一覧を確認する
4. 失敗しているジョブをクリックしてログを確認する
5. エラー箇所をローカルで再現する
6. 修正して push する
7. CI が全て緑になるのを確認する

## ワークフロー YAML の読み方

CI の設定は `.github/workflows/` 以下の YAML ファイルに書かれています。

```powershell
# ワークフローファイルの一覧を確認する
ls .github/workflows/
```

```yaml
# .github/workflows/ci.yml の例
name: CI

on:
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: npm test
```

主要なキー:
- `on`: トリガー条件（`pull_request` は PR 作成・更新時）
- `jobs`: 実行するジョブの定義
- `runs-on`: 実行環境（`ubuntu-latest` が一般的）
- `steps`: ジョブ内の手順

## Copilot の使いどころ

- 「このワークフロー YAML の `on` セクションを説明してください」
- 「この CI エラーログを要約して、原因の仮説を 3 つ挙げてください」
- 「このテスト失敗のログを見て、修正候補を提示してください」

## 注意点

- 赤い CI のまま merge しないこと
- 失敗ジョブを 1 つずつ特定して潰すこと
- ローカルで再現できる場合は push 前に修正すること
- Hotfix でも CI を通す手順を省略しないこと（記録を残すため）

## 章末チェック

- PR の `Checks` タブから失敗したジョブのログを開けること
- `.github/workflows/` の YAML の基本構造（`on`・`jobs`・`steps`）を説明できること
- CI が赤い原因を調べる手順を 3 ステップで説明できること
