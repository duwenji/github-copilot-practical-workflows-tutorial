# Issue から branch を切るまで

## 典型シナリオ

チームの backlog から Issue を受け取り、作業ブランチを作って着手する場面です。

## コンセプトと仕組み

- `Issue` は「何を直すか」「何を満たせば完了か」を共有する入口です。
- `branch` は本流の作業と切り離して、安全に変更を進めるための作業場所です。
- 先に目的を確認してから branch を切ることで、不要な実装や手戻りを減らせます。

## 基本手順

1. Issue の目的と受入条件を読むこと
2. 必要なら Copilot Chat で作業分解を相談すること
3. ローカルで最新を取り込むこと
4. 作業ブランチを作成すること

```powershell
git pull origin main
git switch -c feature/add-quiz-filter
```

## コマンドと引数の意味

- `git pull origin main`
  - `pull`: remote の変更を取得し、現在 branch に反映すること
  - `origin`: ふだん自分が push する remote 名
  - `main`: 最新化の基準にする branch 名
- `git switch -c feature/add-quiz-filter`
  - `switch`: branch を切り替えること
  - `-c`: branch を新規作成すること
  - `feature/add-quiz-filter`: 作業内容が分かる branch 名

> branch を切る前に `main` を最新化しておくと、あとから不要な競合を減らしやすくなります。

## Copilot の使いどころ

- 「この Issue の作業ステップを 5 つに分けてください」
- 「受入条件からテスト観点を整理してください」
- 「この変更で影響しそうなファイルを推測してください」

## 成果物

- 着手前メモ
- 作業ブランチ
- 変更対象の見通し

## 注意点

- Issue を読まずに実装を始めないこと
- ブランチ名はチーム規約に合わせること
- 受入条件が曖昧なら先に確認すること

## 章末チェック

- Issue から受入条件を読み取れること
- `git pull` で最新化してから branch を切れること
- branch 名に作業内容を反映できること
