# ハンズオン: Issue から PR までを一通り回す

## 典型シナリオ

`Issue → branch → 実装 → commit → PR` の一連の流れを、実際の repo を題材に体験する場面です。

## コンセプトと仕組み

- ハンズオンでは小さい Issue を選ぶことで、1 サイクルを短時間で完了できること
- 受入条件を先にメモすることで、実装の方向性がぶれにくくなること
- Copilot に作業分解を依頼することで、実装ステップを見通しやすくなること

## 基本手順

1. 小さめの改善 Issue を 1 つ選ぶこと
2. 受入条件を 2〜3 行でメモすること
3. `Copilot Chat` に作業分解を依頼すること
4. branch を切って実装すること
5. 変更後にローカル確認を行うこと
6. commit / push / PR 作成まで進めること

```powershell
git switch -c feature/sample-improvement
```

## コマンドと引数の意味

- `git switch -c feature/sample-improvement`
  - `switch`: branch を切り替えること
  - `-c`: 新しい branch を作成すること
  - `feature/sample-improvement`: 手を入れる内容が分かる branch 名

実装後の commit と push は以下の手順で行います。

```powershell
git add .
git commit -m "Improve sample feature"
git push origin feature/sample-improvement
```

> まずは小さめの改善 Issue を選び、branch 名にも目的が出るようにしておくと PR レビュー時に伝わりやすくなります。

## Copilot の使いどころ

- 「この Issue を実装ステップに分けてください」
- 「PR 説明文の下書きを作ってください」
- 「レビューで見られそうな観点を列挙してください」

## 注意点

- 推奨題材は `spa-quiz-app` を使うこと
- 受入条件を確認してから実装を始めること
- PR 作成まで完了してから次の Issue に移ること

## 章末チェック

- PR を作成できること
- 変更理由と検証結果を説明できること
- `Issue → branch → commit → PR` の流れを自力で再現できること
- branch 名に作業目的を反映できること
