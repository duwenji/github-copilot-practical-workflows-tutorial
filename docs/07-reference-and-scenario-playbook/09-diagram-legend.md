# 図の見方と用語の凡例

## 概要

教材内の Mermaid 図でよく出てくる用語・記号・読み方をまとめた凡例ページです。
図を読む前にここを確認すると、各章の図の意味がすぐ理解しやすくなります。

## よく出る用語

- `local` — 手元の作業環境
- `remote` — GitHub 上のリポジトリ
- `origin` — 自分が `push` する先
- `upstream` — 本家リポジトリ
- `main` — 基本となるメインブランチ
- `feature/*` — 機能追加や修正のための作業ブランチ
- `release/*` — 公開前の最終確認を進めるブランチ
- `hotfix/*` — 本番障害への緊急修正ブランチ

## 図の読み方

- 箱は、`repo`、`branch`、または作業状態を表すこと
- 矢印は、`clone`、`pull`、`push`、`Pull Request`、`deploy` などの流れを表すこと
- 左から右、または上から下へ読むと、実務の進行順を追いやすいこと

## まず見ると分かりやすい図

1. [fork / upstream の関係を図で理解する](../03-collaboration-patterns/05-fork-upstream-visual-guide.md)
2. [日常開発の全体フローマップ](../02-daily-development-workflows/05-end-to-end-workflow-map.md)
3. [submodule / subtree の見え方を図で整理する](../04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md)
4. [release / hotfix の流れを図で見る](../05-release-hotfix-and-operations/05-release-flow-diagram.md)

## 使い分けのコツ

- 関係が混乱したら、まず図で `どこが local で、どこが remote か` を確認すること
- その後で各章の `コンセプトと仕組み` を読むと、手順の意味がつながりやすいこと
- 図の矢印の向きと Git コマンドの方向を対応させて理解すること

## 関連ページ

- [シナリオ別逆引きガイド](03-scenario-index.md)
- [Git / GitHub コマンド早見表](01-command-cheatsheet.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
