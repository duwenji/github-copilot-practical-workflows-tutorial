# submodule を使うべき場面

## 典型シナリオ

複数のリポジトリで共通ライブラリや共有テンプレートを使いたいとき、
管理方法として `submodule` を検討する場面です。
共有物の履歴を独立したまま参照し続けたい場合に特に有効です。

`submodule` が向いているケースの例：

- 共通テンプレートや shared docs を別 repo として独立管理したい場面
- 複数プロジェクトで使う内部ライブラリのバージョンを repo ごとに固定したい場面
- upstream 側の更新を段階的・明示的に取り込みたい場面

## コンセプトと仕組み

- `submodule` は外部リポジトリを **参照ポインタ** として取り込む仕組みであること
- `.gitmodules` ファイルに URL とパスが記録されること
- 親 repo は submodule の特定コミットを固定して参照すること
- 更新を取り込むには明示的な操作が必要であること

## 基本手順

1. `git submodule add <url> <path>` で外部 repo を追加すること
2. `.gitmodules` と追加されたフォルダーをステージしてコミットすること
3. 別環境で clone した後、`git submodule update --init --recursive` を実行すること
4. 共有元の更新を取り込む場合は `git submodule update --remote` を実行すること
5. 更新内容を確認してから親 repo にコミットすること

## コマンドと引数の意味

```powershell
git submodule update --init --recursive
git submodule add <url> <path>
```

- `git submodule update --init --recursive`
  - `update`: 登録済み submodule を現在の指定 revision に合わせる操作
  - `--init`: 未初期化の submodule の初期化
  - `--recursive`: 入れ子になった submodule もまとめて処理する指定

- `git submodule add <url> <path>`
  - `add`: 新しい submodule の登録
  - `<url>`: 追加する外部リポジトリの URL
  - `<path>`: 配置先ディレクトリのパス

## Copilot の使いどころ

- `submodule` 更新手順の説明作成
- `.gitmodules` の読み解き
- 更新時のレビュー観点整理

> GitHub Copilot Chat に「.gitmodules の内容を説明してください」と貼り付けると、構成の把握が早くなります。

## 注意点

- clone 時に `--recursive` を忘れると submodule が空になること
- 更新方法をチームで統一しないと混乱しやすいこと
- 初学者には操作が分かりにくい場合があること
- `submodule update` のタイミングをルール化しておくこと

## 章末チェック

- `submodule` が向いているケースを 2 つ挙げられること
- `git submodule update --init --recursive` の各引数の意味を説明できること
- `submodule` と `subtree` の違いを 1 文で説明できること
