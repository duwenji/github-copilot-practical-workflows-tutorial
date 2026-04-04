# fork と upstream の基本

## まず押さえる関係

- `origin` — 自分が push する先
- `upstream` — 本家リポジトリ

`fork` ベースで貢献するときは、この 2 つを意識して運用します。

## コンセプトと仕組み

- `origin` は自分の作業結果を `push` する先、`upstream` は本家の更新を受け取る先です。
- この 2 つを分けることで、本家を直接触らずに安全に変更提案できます。
- 定期的に `upstream/main` を取り込むのは、自分の `fork` と本家の差分を小さく保つためです。

## よくある流れ

1. 本家を `fork` する
2. 自分の clone 先で `origin` を確認する
3. 本家を `upstream` として追加する
4. 定期的に `upstream/main` を取り込む

```powershell
git remote -v
git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git
git fetch upstream
```

## コマンドと引数の意味

- `git remote -v`
  - `remote`: 登録済み remote を扱う
  - `-v`: URL を含めて詳しく表示する
- `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
  - `add`: 新しい remote を登録する
  - `upstream`: 本家 repo を表す慣例名
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家の clone URL
- `git fetch upstream`
  - `fetch`: 最新履歴を取得する
  - `upstream`: 取得元 remote 名

> まず `git remote -v` で今の接続先を確認してから `upstream` を追加すると、push 先の取り違えを減らせます。

## Copilot の使いどころ

- `origin` と `upstream` の違いが混乱したときの整理
- コンフリクト解消前の影響範囲整理
- PR に書く説明文の下書き

## 実務で重要なこと

- `upstream` を放置すると差分が大きくなる
- 定期同期の習慣が重要
- 同期前後でテストやビルド確認を行う
