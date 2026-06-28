# Git / GitHub コマンド早見表

## 概要

この教材で登場する Git / GitHub CLI コマンドの逆引きチートシートです。
コマンド名・用途・基本構文を一覧で確認できます。

## コマンド一覧

### 基本

### `git status`
- **用途:** 作業ツリーと staging 状態の確認
- **書式:** `git status`
- **補足:** 引数なし。変更前後の確認で最初に使うコマンドです。

### `git pull origin main`
- **用途:** `origin` 上の `main` をローカルへ取り込む
- **引数の意味:**
  - `origin`: 通常は clone 元として登録されるリモート名
  - `main`: 取り込みたいブランチ名
- **注意:** 未コミット変更があると競合しやすいので、先に `git status` を確認します。

### `git switch -c feature/my-task`
- **用途:** 新しい作業ブランチの作成と切り替え
- **引数の意味:**
  - `-c`: ブランチを**新規作成**するオプション
  - `feature/my-task`: 新しいブランチ名
- **例:** `git switch -c feature/login-form`
- **よくあるミス:** 既存ブランチへ移動するだけなら `-c` は不要です。例: `git switch main`

### `git add .`
- **用途:** 現在のフォルダー配下の変更をまとめて staging
- **引数の意味:**
  - `.`: 「このディレクトリ以下すべて」を表す
- **注意:** 意図しないファイルまで含まれないよう、実行後に `git status` を確認します。

### `git commit -m "Add feature"`
- **用途:** staging 済みの変更を commit として記録
- **引数の意味:**
  - `-m`: commit message をその場で指定するオプション
  - `"Add feature"`: commit message の本文
- **注意:** 後から見て内容が分かる短い説明にします。

### `git push origin feature/my-task`
- **用途:** ローカルブランチをリモートへ送信
- **引数の意味:**
  - `origin`: push 先のリモート名
  - `feature/my-task`: push するブランチ名
- **注意:** `main` への直接 push 可否はチームルールを確認します。

## fork / upstream

### `git remote -v`
- **用途:** 登録済み remote と URL の確認
- **引数の意味:**
  - `-v`: URL を含めて詳しく表示する (`verbose`)
- **使いどころ:** `origin` と `upstream` の向きが正しいか確認したい場面

### `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
- **用途:** 本家 repository を `upstream` として追加
- **引数の意味:**
  - `add`: remote 新規登録用コマンド
  - `upstream`: 追加後の remote 名。慣例的に「本家」をこう呼ぶ
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家 repository の URL
- **注意:** 自分の fork は通常 `origin`、本家は `upstream` です。

### `git fetch upstream`
- **用途:** `upstream` の最新履歴の取得（マージなし）
- **引数の意味:**
  - `upstream`: 取得元の remote 名
- **注意:** `fetch` はまだ現在のブランチへ反映しません。安全に最新差分を確認しやすい操作です。

### `git merge upstream/main`
- **用途:** `upstream` の `main` を現在のブランチへ取り込む
- **引数の意味:**
  - `upstream/main`: `upstream` remote 上の `main` ブランチ
- **注意:** 通常は `git switch main` のあとに実行すると分かりやすく、事故も減らせます。

## submodule

### `git submodule update --init --recursive`
- **用途:** submodule の初期化とネストした submodule の取得
- **引数の意味:**
  - `--init`: 未初期化 submodule を初期化するオプション
  - `--recursive`: 子孫 submodule まで再帰的に処理するオプション
- **よくある場面:** clone 直後や shared assets を含む project を初めて開く場面

### `git submodule status`
- **用途:** 各 submodule の commit 状態の確認
- **補足:** どの submodule がどの revision を向いているか確認したい場面に便利です。

## このリポジトリ固有の `npm run` コマンド

### `npm run ebook:build`
- **用途:** ebook 出力の生成と build エラー有無の確認
- **内部で呼ばれる処理:** `invoke-build.ps1`
- **注意:** 公開前、release 前、大きな章更新後に実行すると安心です。

## 注意

- コマンドを丸暗記するより、**どの remote / branch / script を対象にしているか** を意識すること
- `merge` / `rebase` / `submodule` 更新は、実行前に `git status` と現在の branch を確認すること
- 詳しいシナリオは各章の hands-on とチェックリストも参照すること

## 関連ページ

- [シナリオ別逆引きガイド](03-scenario-index.md)
- [FAQ とトラブルシューティング](04-faq-and-troubleshooting.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
