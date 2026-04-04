# Git / GitHub コマンド早見表

このページでは、教材内でよく出る `Git` / `npm` コマンドを、**用途** と **引数の意味** まで含めて短く整理します。

## 基本

### `git status`
- **用途:** 作業ツリーと staging 状態を確認する
- **書式:** `git status`
- **補足:** 引数なし。変更前後の確認で最初に使うコマンドです。

### `git pull origin main`
- **用途:** `origin` 上の `main` をローカルへ取り込む
- **引数の意味:**
  - `origin`: 通常は clone 元として登録されるリモート名
  - `main`: 取り込みたいブランチ名
- **注意:** 未コミット変更があると競合しやすいので、先に `git status` を確認します。

### `git switch -c feature/my-task`
- **用途:** 新しい作業ブランチを作成し、そのまま切り替える
- **引数の意味:**
  - `-c`: ブランチを**新規作成**するオプション
  - `feature/my-task`: 新しいブランチ名
- **例:** `git switch -c feature/login-form`
- **よくあるミス:** 既存ブランチへ移動するだけなら `-c` は不要です。例: `git switch main`

### `git add .`
- **用途:** 現在のフォルダー配下の変更をまとめて staging する
- **引数の意味:**
  - `.`: 「このディレクトリ以下すべて」を表す
- **注意:** 意図しないファイルまで含まれないよう、実行後に `git status` を確認します。

### `git commit -m "Add feature"`
- **用途:** staging 済みの変更を commit として記録する
- **引数の意味:**
  - `-m`: commit message をその場で指定する
  - `"Add feature"`: commit message の本文
- **注意:** 後から見て内容が分かる短い説明にします。

### `git push origin feature/my-task`
- **用途:** ローカルブランチをリモートへ送る
- **引数の意味:**
  - `origin`: push 先のリモート名
  - `feature/my-task`: push するブランチ名
- **注意:** `main` への直接 push 可否はチームルールを確認します。

## fork / upstream

### `git remote -v`
- **用途:** 登録済み remote と URL を確認する
- **引数の意味:**
  - `-v`: URL を含めて詳しく表示する (`verbose`)
- **使いどころ:** `origin` と `upstream` の向きが正しいか確認したいとき

### `git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git`
- **用途:** 本家 repository を `upstream` として追加する
- **引数の意味:**
  - `add`: remote を新規登録する
  - `upstream`: 追加後の remote 名。慣例的に「本家」をこう呼ぶ
  - `https://github.com/ORIGINAL_OWNER/REPO.git`: 本家 repository の URL
- **注意:** 自分の fork は通常 `origin`、本家は `upstream` です。

### `git fetch upstream`
- **用途:** `upstream` の最新履歴を**取得だけ**する
- **引数の意味:**
  - `upstream`: 取得元の remote 名
- **注意:** `fetch` はまだ現在のブランチへ反映しません。安全に最新差分を確認しやすい操作です。

### `git merge upstream/main`
- **用途:** `upstream` の `main` を、今いるブランチへ取り込む
- **引数の意味:**
  - `upstream/main`: `upstream` remote 上の `main` ブランチ
- **注意:** 通常は `git switch main` のあとに実行すると分かりやすく、事故も減らせます。

## submodule

### `git submodule update --init --recursive`
- **用途:** submodule を初期化し、ネストした submodule までまとめて取得する
- **引数の意味:**
  - `--init`: 未初期化の submodule を初期化する
  - `--recursive`: 子孫の submodule まで再帰的に処理する
- **よくある場面:** clone 直後や shared assets を含む project を初めて開くとき

### `git submodule status`
- **用途:** 各 submodule の commit 状態を確認する
- **補足:** どの submodule がどの revision を向いているか確認したいときに便利です。

## このリポジトリ固有の `npm run` コマンド

### `npm run quiz:validate`
- **用途:** quiz データをまとめて検証する
- **内部で呼ばれる処理:** `invoke-validate.ps1 -Mode all`
- **引数の意味:**
  - `run`: `package.json` の script を実行する
  - `quiz:validate`: 実行する script 名
- **注意:** PR 前の整合性チェックとして実行します。

### `npm run quiz:normalize`
- **用途:** quiz データの表記ゆれを正規化する
- **内部で呼ばれる処理:** `invoke-validate.ps1 -Mode normalize`
- **使いどころ:** 形式のゆれをそろえてから再検証したいとき

### `npm run ebook:build`
- **用途:** ebook 出力を生成し、build エラーの有無を確認する
- **内部で呼ばれる処理:** `invoke-build.ps1`
- **注意:** 公開前、release 前、大きな章更新後に実行すると安心です。

## 注意

- コマンドを丸暗記するより、**どの remote / branch / script を対象にしているか** を意識する
- `merge` / `rebase` / `submodule` 更新は、実行前に `git status` と現在の branch を確認する
- 詳しいシナリオは各章の hands-on とチェックリストも参照する
