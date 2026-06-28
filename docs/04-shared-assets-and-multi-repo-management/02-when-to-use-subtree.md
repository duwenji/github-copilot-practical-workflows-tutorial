# subtree を使うべき場面

## 典型シナリオ

チームメンバーに `submodule` の追加学習をさせずに、共有資産を別リポジトリから取り込みたい場面です。
共有物を子フォルダーとして自分の repo に含めながら、通常の Git 操作で扱える点が利点です。

`subtree` が向いているケースの例：

- テンプレートやスクリプト群を別 repo から子フォルダーとして取り込みたいとき
- 利用側メンバーに `submodule` の追加学習をさせたくないとき
- clone 後に特別な操作なしで共有資産を使い始めたいとき

## コンセプトと仕組み

- `subtree` は外部リポジトリの内容を **自分の repo の一部として取り込む** 方式であること
- 利用側は通常の Git 操作に近い感覚で扱えること
- clone が単純で、追加ツールなしで扱えること
- 取り込み後は通常のコミット履歴に混ざる形で管理されること

## 基本手順

1. 共有元リモートを `git remote add SHARED_REMOTE <url>` で登録すること
2. `git subtree add --prefix=shared-assets SHARED_REMOTE main --squash` で取り込むこと
3. 取り込み後の内容をコミット履歴で確認すること
4. 共有元の更新を取り込む場合は `git subtree pull --prefix=shared-assets SHARED_REMOTE main --squash` を実行すること
5. 競合が発生した場合は内容を確認してから解消すること

## コマンドと引数の意味

```powershell
git subtree add --prefix=shared-assets SHARED_REMOTE main --squash
git subtree pull --prefix=shared-assets SHARED_REMOTE main --squash
```

- `git subtree add --prefix=shared-assets SHARED_REMOTE main --squash`
  - `subtree add`: 別リポジトリの内容を現在 repo 配下へ取り込む操作
  - `--prefix=shared-assets`: 取り込み先フォルダーの指定
  - `SHARED_REMOTE`: 共有元リモート名
  - `main`: 取り込む共有元ブランチ名
  - `--squash`: 履歴を 1 つのまとまりとして取り込む指定

- `git subtree pull --prefix=shared-assets SHARED_REMOTE main --squash`
  - `subtree pull`: 共有元の最新を取り込む更新操作
  - `--prefix`: 対象フォルダーの指定
  - `--squash`: 履歴をまとめる指定

## Copilot の使いどころ

- `subtree` の初回取り込みコマンドの生成
- `prefix` 設計のアドバイス取得
- 更新フローのドキュメント作成

> Copilot に「subtree を使った共有資産の更新手順を説明してください」と依頼すると、チーム向けの手順書のたたき台になります。

## 注意点

- 更新の流れを理解していないと差分管理が難しいこと
- 共有元との同期方針を先に決めておくこと
- `prefix` に取り込む内容と場所を明確にしておくこと
- `--squash` を使わないと共有元の全履歴が混入すること

## 章末チェック

- `subtree` が `submodule` より扱いやすいケースを説明できること
- `git subtree add` の各引数の意味を説明できること
- 共有元の更新を `subtree pull` で取り込む手順を実行できること
