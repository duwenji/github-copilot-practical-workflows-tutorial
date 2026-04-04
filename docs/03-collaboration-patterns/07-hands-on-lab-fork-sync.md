# ハンズオン: fork / upstream 同期を試す

## 目的

`fork` ベースの協業で、`origin` と `upstream` を正しく扱えるようになります。

## 想定シナリオ

- 本家 repo に直接 push できない
- 自分の fork 経由で PR を送りたい

## 手順

1. 対象 repo を `fork` する
2. ローカルに clone する
3. `upstream` を追加する
4. 本家との差分を fetch / merge する
5. 自分の fork に push して PR を作る

```powershell
git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git
git fetch upstream
git merge upstream/main
```

## コマンドと引数の意味

- `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
  - `add`: remote を登録する
  - `upstream`: 本家 repo の慣例名
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家 URL
- `git fetch upstream`
  - `fetch`: 最新履歴を取得する
  - `upstream`: 取得元 remote 名
- `git merge upstream/main`
  - `merge`: 取得した履歴を現在 branch に反映する
  - `upstream/main`: 本家 `main` の参照先

> `fetch` と `merge` を分けて実行すると、「取得だけした状態」で差分確認しやすくなります。

## 完了条件

- `origin` と `upstream` の役割を説明できる
- 本家追従の最小フローを再現できる
