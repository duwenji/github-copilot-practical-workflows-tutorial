# upstream と同期する

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
