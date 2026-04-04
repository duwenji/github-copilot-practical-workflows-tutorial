# 図の見方と用語の凡例

このページでは、教材内の `Mermaid` 図でよく出てくる用語と読み方をまとめます。

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

- 箱は、`repo`、`branch`、または作業状態を表します。
- 矢印は、`clone`、`pull`、`push`、`Pull Request`、`deploy` などの流れを表します。
- 左から右、または上から下へ読むと、実務の進行順を追いやすくなります。

## まず見ると分かりやすい図

1. [fork / upstream の関係を図で理解する](../03-collaboration-patterns/05-fork-upstream-visual-guide.md)
2. [日常開発の全体フローマップ](../02-daily-development-workflows/05-end-to-end-workflow-map.md)
3. [submodule / subtree の見え方を図で整理する](../04-shared-assets-and-multi-repo-management/05-submodule-subtree-visual-guide.md)
4. [release / hotfix の流れを図で見る](../05-release-hotfix-and-operations/05-release-flow-diagram.md)

## 使い分けのコツ

- 関係が混乱したら、まず図で `どこが local で、どこが remote か` を確認します。
- その後で各章の `コンセプトと仕組み` を読むと、手順の意味がつながりやすくなります。