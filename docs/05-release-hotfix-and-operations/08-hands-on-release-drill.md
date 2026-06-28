# ハンズオン: release / hotfix ドリル

## 典型シナリオ

軽微な変更を release 候補としてまとめ、問題があった場合の hotfix 思考を練習する場面です。

## コンセプトと仕組み

- release と hotfix の違いを実際の操作で体験するためのドリルです。
- `npm run ebook:build` でビルド確認を行いながら、リリース判断の流れを学びます。
- Copilot を活用して release note の下書きやリスク洗い出しを練習します。
- rollback 判断の条件を言語化することで、緊急時の対応力を養います。
- 実際のコマンドと判断基準を組み合わせて、実務に近い流れを体験できます。

## 基本手順

1. 直近の変更を 1 つ選ぶこと
2. release note の下書きを作ること
3. 想定される失敗パターンを 2 つ挙げること
4. hotfix にする場合の最小修正方針を書くこと
5. rollback 判断の条件を書くこと
6. `npm run ebook:build` でビルド確認を行うこと

## 事前確認で使うコマンド

```powershell
npm run ebook:build
```

- `npm run ebook:build`
  - `ebook:build`: ebook 出力を生成し、公開前の build 成否を確認する

> release 候補を判断するときは、「内容が良さそうか」だけでなく、**検証コマンドが通るか** を必ずセットで見ます。

## 練習課題

- 直近のコミットから release note を書くこと
- 想定リスクを 2 つ以上列挙すること
- hotfix 対応が必要な場合の手順を書くこと
- rollback を判断する条件を 3 つ以上明示すること

## Copilot の使いどころ

- 「この差分から release note を 3 行でまとめてください」
- 「この変更のリスクを列挙してください」
- 「hotfix 時の確認項目をチェックリストにしてください」
- 「rollback の判断基準を整理してください」

## 注意点

- ビルドが通らない状態で release 候補としないこと
- release note は技術的な詳細だけでなく、影響範囲を明記すること
- rollback 条件は事前に明文化しておくこと

## 完了条件

- release と hotfix の違いを説明できること
- rollback 判断の基準を言語化できること

## 章末チェック

- `npm run ebook:build` でビルド確認を実施できること
- Copilot を使って release note の下書きを作成できること
- release / hotfix / rollback の判断基準を説明できること
