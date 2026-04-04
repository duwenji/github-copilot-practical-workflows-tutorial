# upstream と同期する

## コンセプトと仕組み

- `upstream` 同期は、本家の最新状態を自分の作業環境へ取り込むための操作です。
- 差分が小さいうちに同期すると、`feature branch` へ反映するときの競合を減らせます。
- つまり、同期は「あとで困らないための予防作業」と考えると分かりやすいです。

## 典型手順

```powershell
git fetch upstream
git switch main
git merge upstream/main
git push origin main
```

## コマンドと引数の意味

- `git fetch upstream`
  - `fetch`: 最新履歴を取得するが、まだ現在の branch へ反映しない
  - `upstream`: 本家 repository の remote 名
- `git switch main`
  - `switch`: branch を切り替える
  - `main`: 同期の基点にしたい branch 名
- `git merge upstream/main`
  - `merge`: 取得済みの変更を現在 branch に取り込む
  - `upstream/main`: `upstream` 上の `main` ブランチ
- `git push origin main`
  - `origin`: 自分の fork / clone 先の remote 名
  - `main`: 更新を送り返す自分側のブランチ名

> 重要なのは `fetch` と `merge` を分けて考えることです。`fetch` は取得だけ、`merge` で初めて現在の branch に反映されます。

## 実務での考え方

- まず本家の変更を取り込む
- その後で自分の feature branch に反映する
- 大きな差分になる前に、こまめに同期する

## Copilot の使いどころ

- 同期手順の確認
- コンフリクト解消方針の整理
- merge 後のテスト観点洗い出し
