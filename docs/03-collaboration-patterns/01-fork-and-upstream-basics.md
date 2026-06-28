# fork と upstream の基本

## 典型シナリオ

オープンソースプロジェクトや社内の共有リポジトリへ貢献するとき、直接 push する権限がなく、`fork` 経由で変更提案が必要なケースです。

## コンセプトと仕組み

- `origin` は自分の作業結果を `push` する先、`upstream` は本家の更新を受け取る先です。
- この 2 つを分けることで、本家を直接触らずに安全な変更提案が可能です。
- 定期的に `upstream/main` を取り込むのは、自分の `fork` と本家の差分を小さく保つための習慣です。

## 基本手順

1. 本家リポジトリを GitHub 上で `fork` すること
2. ローカルに `clone` して `origin` を確認すること
3. 本家を `upstream` として追加すること
4. 定期的に `upstream/main` を取り込んで同期を保つこと

```powershell
git remote -v
git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git
git fetch upstream
```

## コマンドと引数の意味

- `git remote -v`
  - `remote`: 登録済み remote の管理コマンド
  - `-v`: URL を含めた詳細表示オプション
- `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
  - `add`: 新しい remote の登録
  - `upstream`: 本家 repo を表す慣例名
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家の clone URL
- `git fetch upstream`
  - `fetch`: 最新履歴の取得
  - `upstream`: 取得元 remote 名

> まず `git remote -v` で今の接続先を確認してから `upstream` を追加すると、push 先の取り違えを防ぐことができます。

## Copilot の使いどころ

- `origin` と `upstream` の違いが混乱したときの整理
- コンフリクト解消前の影響範囲の整理
- PR に書く説明文の下書き作成

> **Copilot へのプロンプト例**
>
> 「`origin` と `upstream` の違いを図を使って説明してください」

## 注意点

- `upstream` を長期間放置すると差分が大きくなり、同期コストが増加すること
- 同期前後でテストやビルドの確認が必要なこと
- `push` 先を `origin` と `upstream` で間違えないように、`git remote -v` で確認すること

## 章末チェック

- [ ] `origin` と `upstream` の役割の違いを説明できること
- [ ] `git remote add upstream <URL>` で本家を登録できること
- [ ] `git fetch upstream` で本家の最新履歴を取得できること
- [ ] 定期同期の目的と重要性を理解していること
