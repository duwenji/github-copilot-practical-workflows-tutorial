# ハンズオン: release / hotfix ドリル

## 目的

軽微な変更を release 候補としてまとめ、問題があった場合の hotfix 思考を練習します。

## 手順

1. 直近の変更を 1 つ選ぶ
2. release note の下書きを作る
3. 想定される失敗パターンを 2 つ挙げる
4. hotfix にする場合の最小修正方針を書く
5. rollback 判断の条件を書く

## 事前確認で使うコマンド

```powershell
npm run quiz:validate
npm run ebook:build
```

- `npm run quiz:validate`
  - `run`: `package.json` の script を実行する
  - `quiz:validate`: quiz / metadata の整合性を確認する
- `npm run ebook:build`
  - `ebook:build`: ebook 出力を生成し、公開前の build 成否を確認する

> release 候補を判断するときは、「内容が良さそうか」だけでなく、**検証コマンドが通るか** を必ずセットで見ます。

## Copilot への依頼例

- 「この差分から release note を 3 行でまとめて」
- 「この変更のリスクを列挙して」
- 「hotfix 時の確認項目をチェックリストにして」

## 完了条件

- release と hotfix の違いを説明できる
- rollback 判断の基準を言語化できる
