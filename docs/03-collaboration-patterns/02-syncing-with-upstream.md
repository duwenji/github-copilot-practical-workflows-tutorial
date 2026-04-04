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

## 実務での考え方

- まず本家の変更を取り込む
- その後で自分の feature branch に反映する
- 大きな差分になる前に、こまめに同期する

## Copilot の使いどころ

- 同期手順の確認
- コンフリクト解消方針の整理
- merge 後のテスト観点洗い出し
