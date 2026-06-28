# ハンズオン: fork / upstream 同期を試す

## 典型シナリオ

本家リポジトリへの貢献を始めるとき、`fork` と `upstream` の設定から PR 提出までの一連の操作を習得するケースです。

## コンセプトと仕組み

- `fork` ベースの協業では、`origin`（自分の fork）と `upstream`（本家）の 2 つの remote を管理します。
- `upstream` から取得した変更を `local main` へ反映し、その後 `origin` へ push することで fork を最新化できます。
- これらの操作を習慣化することで、コンフリクトの発生を最小限に抑えられます。

## 基本手順

1. 対象リポジトリを GitHub 上で `fork` すること
2. ローカルに `clone` すること
3. `upstream` を追加すること
4. 本家との差分を `fetch` / `merge` すること
5. 自分の fork に `push` して PR を作ること

```powershell
git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git
git fetch upstream
git merge upstream/main
```

## コマンドと引数の意味

- `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
  - `add`: remote の登録
  - `upstream`: 本家 repo の慣例名
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家 URL
- `git fetch upstream`
  - `fetch`: 最新履歴の取得
  - `upstream`: 取得元 remote 名
- `git merge upstream/main`
  - `merge`: 取得した履歴を現在ブランチへの反映
  - `upstream/main`: 本家 `main` の参照先

> `fetch` と `merge` を分けて実行すると、「取得だけした状態」で差分確認が容易になります。

## Copilot の使いどころ

- 手順の確認や次のステップの案内
- コンフリクト発生時の解消方針の整理
- PR 説明文の下書き作成

> **Copilot へのプロンプト例**
>
> 「upstream/main を merge した後に確認すべきポイントを教えてください」

## 注意点

- `upstream` を追加する前に `git remote -v` で現在の設定の確認が必要なこと
- `merge` の前に必ず `git switch main` でブランチの切り替えをすること
- PR を出す前にコンフリクトがないことの確認が必要なこと

## 章末チェック

- [ ] `origin` と `upstream` の役割の違いを説明できること
- [ ] 本家追従の最小フローを再現できること
- [ ] `fetch` と `merge` を分けて実行する意味を理解していること
- [ ] PR 提出前に確認すべき項目を列挙できること
