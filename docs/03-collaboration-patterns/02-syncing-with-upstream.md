# upstream と同期する

## 典型シナリオ

本家リポジトリが更新されたとき、自分の `fork` と `feature branch` に最新の変更を反映する必要があるケースです。

## コンセプトと仕組み

- `upstream` 同期は、本家の最新状態を自分の作業環境へ取り込むための操作です。
- 差分が小さいうちに同期すると、`feature branch` へ反映するときのコンフリクトを減らせます。
- つまり、同期は「あとで困らないための予防作業」という位置付けです。

## 基本手順

1. `upstream` から最新履歴を取得すること
2. `main` ブランチへ切り替えること
3. 取得した `upstream/main` を現在のブランチへ統合すること
4. 自分の `origin` へ push して fork を最新化すること

```powershell
git fetch upstream
git switch main
git merge upstream/main
git push origin main
```

## コマンドと引数の意味

- `git fetch upstream`
  - `fetch`: 最新履歴の取得（現在のブランチへの反映は行わない）
  - `upstream`: 本家 repository の remote 名
- `git switch main`
  - `switch`: ブランチの切り替え
  - `main`: 同期の基点にするブランチ名
- `git merge upstream/main`
  - `merge`: 取得済みの変更を現在のブランチへの統合
  - `upstream/main`: `upstream` 上の `main` ブランチの参照
- `git push origin main`
  - `origin`: 自分の fork / clone 先の remote 名
  - `main`: 更新を送り返す自分側のブランチ名

> 重要なのは `fetch` と `merge` を分けて考えることです。`fetch` は取得のみ、`merge` で初めて現在のブランチへ反映されます。

## Copilot の使いどころ

- 同期手順の確認や見直し
- コンフリクト解消方針の整理
- merge 後のテスト観点の洗い出し

> **Copilot へのプロンプト例**
>
> 「upstream/main を merge した後に確認すべきテスト観点を列挙してください」

## 注意点

- `fetch` と `merge` を混同しないこと（`pull` は両方を一度に行う）
- 大きな差分になる前にこまめに同期すること
- `merge` 後は必ずビルドとテストの確認を行うこと

## 章末チェック

- [ ] `git fetch` と `git pull` の違いを説明できること
- [ ] `upstream/main` を `local main` へ統合する手順を実行できること
- [ ] 同期後に自分の fork を更新する意味を理解していること
- [ ] コンフリクトが発生したときの対応方針を説明できること
