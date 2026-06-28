# チーム向け copilot-instructions の作り方

## 典型シナリオ

チームで GitHub Copilot を使い始めるとき、AI の提案をプロジェクト固有のルールに合わせたい場面です。
`.github/copilot-instructions.md` を作成してリポジトリに置くことで、Copilot に文脈を伝えられます。

## コンセプトと仕組み

- `.github/copilot-instructions.md` はリポジトリ固有のルールを Copilot に伝えるための設定ファイルであること
- ファイルが存在すると、Copilot Chat がそのリポジトリで開いているセッションに自動で読み込むこと
- 命名規則・テスト方針・禁止パターンなどを書くことで、提案のばらつきを減らせること

## 基本手順

1. リポジトリのルートに `.github/` ディレクトリを作成すること（未存在の場合）
2. `.github/copilot-instructions.md` ファイルを作成すること
3. チームで合意したルールを記述すること
4. PR でレビューして merge すること
5. 定期的に内容を見直して更新すること

```powershell
# ファイルを作成する
New-Item -Path ".github/copilot-instructions.md" -ItemType File -Force
```

## `copilot-instructions.md` の記述例

```markdown
# Copilot Instructions

## 言語・スタイル
- コメントは日本語で書くこと
- 変数名・関数名は英語のキャメルケース（例: `filterQuizByCategory`）

## テスト方針
- ユニットテストは Vitest を使うこと
- テストファイル名は `*.test.ts` 形式にすること

## セキュリティ
- ユーザー入力は必ずバリデーションすること
- `eval()` や `innerHTML` の直接代入は使用しないこと

## Copilot に提案させたくないこと
- `any` 型の使用（TypeScript）
- `console.log` をコードに残すこと
```

## Copilot の使いどころ

- 「我々のチームの命名規則と禁止パターンを `copilot-instructions.md` の形式でまとめてください」
- 「この `copilot-instructions.md` の内容を読んで、レビュー観点を列挙してください」
- 「あなたが現在認識しているプロジェクトのルールを教えてください」

## 注意点

- ファイルは `.github/` ディレクトリ直下に置くこと（他の場所では読み込まれない）
- 秘密情報（API キー、パスワードなど）は書かないこと
- チーム全員がルールに合意してから merge すること
- 内容が古くなったら更新すること（放置するとルールと実装が乖離する）

## 章末チェック

- `.github/copilot-instructions.md` の役割を説明できること
- 自分のチームに必要なルールを 5 項目書き出せること
- ファイルの正しい配置場所（`.github/` 直下）を説明できること
