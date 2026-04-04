# GitHub と Copilot の初期セットアップ

## 目的

この章では、`GitHub` と `GitHub Copilot` を実務で使い始める前提環境をそろえます。

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

## 基本セットアップ

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

## Copilot の最初の使い方

- 「このリポジトリの構成を要約して」
- 「初回参加者が最初に確認すべき点を列挙して」
- 「この Issue の前提知識を整理して」
