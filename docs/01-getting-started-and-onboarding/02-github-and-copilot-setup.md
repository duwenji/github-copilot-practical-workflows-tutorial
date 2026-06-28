# GitHub と Copilot の初期セットアップ

## 典型シナリオ

チームに参加した初日、または新しいマシンで開発を始める際に環境を整える場面です。
`GitHub` アカウントと `Copilot` の利用権限がそろっているかを確認してセットアップを完了させます。

## コンセプトと仕組み

- `GitHub` は認証とリポジトリ操作の基盤です。
- `VS Code` は `GitHub Copilot` / `Copilot Chat` 拡張を通じて、アカウントやライセンス状態と連携します。
- 組織利用では、個人設定だけでなく **ライセンス割り当て** や **利用ポリシー** が有効であることも重要です。
- つまり、`GitHub アカウント`、`VS Code`、`Copilot 利用権限` の 3 つがそろって初めてスムーズに使えます。

## 準備するもの

- `GitHub` アカウント
- `VS Code`
- `Git`
- `GitHub Copilot` のライセンスまたは利用可能な環境

## 基本手順

1. `VS Code` に GitHub 関連拡張を入れる
2. GitHub にサインインする
3. `Copilot` と `Copilot Chat` を有効化する
   - 拡張機能ビューで `GitHub Copilot` を検索してインストールする
   - `GitHub Copilot Chat` を検索してインストールする
   - 求められたら `GitHub` アカウントでサインインし、業務で使うアカウントか確認する
   - `Copilot Chat` パネルを開き、短い質問を送って応答が返ることを確認する
   - 組織利用の場合は、ライセンスや利用ポリシーで無効化されていないか確認する
4. `git config` でユーザー名とメールアドレスを設定する

```powershell
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## コマンドと引数の意味

- `git config --global user.name "Your Name"`
  - `config`: Git の設定値を確認・変更する
  - `--global`: 現在のユーザー環境全体に適用する
  - `user.name`: commit 作成者名の設定キー
  - `"Your Name"`: 表示したい名前
- `git config --global user.email "you@example.com"`
  - `user.email`: commit 作成者メールアドレスの設定キー
  - `"you@example.com"`: GitHub と整合するメールアドレスを入れる

> 会社用アカウントと個人アカウントを使い分ける場合は、どのメールアドレスで commit が記録されるかを先に確認しておくと安全です。

## 実務上の確認ポイント

- 会社の GitHub 組織に参加済みか
- `GitHub Copilot` のライセンスや組織利用設定が有効か
- `VS Code` が正しい `GitHub` アカウントでサインインされているか
- 利用ポリシーに同意しているか
- 機密情報を入力してはいけないルールを理解しているか

## つまずきやすい点

- `Copilot Chat` が表示されないときは、拡張が有効か、再サインインが必要ないかを確認する
- ライセンスが見つからないときは、個人契約か組織割り当てかを確認する
- 会社管理の環境では、管理者側で機能制限されている場合がある

## Copilot の使いどころ

- 「このリポジトリの構成を要約してください」
- 「初回参加者が最初に確認すべき点を列挙してください」
- 「この Issue の前提知識を整理してください」

## 注意点

- 会社用アカウントと個人アカウントを混在させないこと
- 組織のライセンスや利用ポリシーを事前に確認すること
- `git config` のメールアドレスは GitHub アカウントと一致させること
- 機密情報を Copilot Chat に入力しないこと

## 章末チェック

- `VS Code` で `GitHub Copilot` と `Copilot Chat` が動作することを確認できる
- `git config --global user.name` と `user.email` が正しく設定されている
- 所属する GitHub 組織に参加済みで、Copilot のライセンスが有効であることを確認できる
