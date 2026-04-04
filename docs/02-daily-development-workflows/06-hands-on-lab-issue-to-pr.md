# ハンズオン: Issue から PR までを一通り回す

## 目的

`Issue → branch → 実装 → commit → PR` の一連の流れを、実際の repo を題材に体験します。

## 推奨題材

- `spa-quiz-app`

## 手順

1. 小さめの改善 Issue を 1 つ選ぶ
2. 受入条件を 2〜3 行でメモする
3. `Copilot Chat` に作業分解を依頼する
4. branch を切って実装する
5. 変更後にローカル確認を行う
6. commit / push / PR 作成まで進める

```powershell
git switch -c feature/sample-improvement
```

## Copilot への依頼例

- 「この Issue を実装ステップに分けて」
- 「PR 説明文の下書きを作って」
- 「レビューで見られそうな観点を列挙して」

## 完了条件

- PR を作成できた
- 変更理由と検証結果を説明できる
