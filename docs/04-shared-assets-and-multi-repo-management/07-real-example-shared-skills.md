# 実例: shared repo と consumer repo の構成

## 典型シナリオ

このワークスペースにある `shared-copilot-skills` と複数の consumer repo を題材に、
実際の構成を観察しながら shared repo の活用方法を理解する場面です。

## コンセプトと仕組み

- shared repo は **共通ロジックを一元管理** するためのリポジトリであること
- consumer repo は **repo 固有の設定やラッパー** だけを自分で持つこと
- 共通部分を shared repo に集約することで、更新の影響範囲を明確にできること
- `submodule` や `subtree` を使えば shared repo の更新を consumer repo へ取り込みやすくなること

### このワークスペースの構成例

- `shared-copilot-skills` — 共通の skill・ebook-build・quiz-generator を保持する shared repo
- `github-copilot-custom-agents-tutorial` — consumer repo の例
- `spa-quiz-app` — consumer repo の例

## 見るべき場所

- `shared-copilot-skills/` — 共通ロジックの格納場所
- `github-copilot-custom-agents-tutorial/.github/skills-config/` — consumer 固有の wrapper と config
- `spa-quiz-app/.github/skills-config/` — 別 consumer repo の固有設定

## 基本手順

1. `shared-copilot-skills/` の中身を確認して共通ロジックの構成を把握すること
2. consumer repo の `.github/skills-config/` を確認して repo 固有の設定を把握すること
3. shared 側の更新が consumer 側へどう伝播するかを確認すること
4. `submodule` または `subtree` でどのように参照・取り込みが行われているか確認すること
5. 自分のプロジェクトに応じた構成に応用すること

## コマンドと引数の意味

- `git submodule status`
  - `status`: 現在の submodule の参照状態を表示する操作
  - 登録済み submodule の commit hash と状態を確認できること

- `git log --oneline -- shared/`
  - `log`: コミット履歴の表示
  - `--oneline`: 1 行形式での簡潔な表示
  - `-- shared/`: 対象パスをフォルダーに絞る指定

## Copilot の使いどころ

- 構成の把握と説明文の生成
- `submodule` / `subtree` の選定理由の言語化
- consumer repo への取り込み手順の作成

> Copilot に「この shared repo の構成を図にしてください」と依頼すると、Mermaid 形式の構成図が素早く生成できます。

## 注意点

- shared repo に consumer 固有の設定を混ぜないこと
- shared repo を更新した際は consumer repo への影響を確認すること
- `submodule` 参照を使っている場合、consumer repo 側の更新操作を忘れないこと
- `.github/skills-config/` など固有設定の場所をチーム内でルール化しておくこと

## 章末チェック

- shared repo と consumer repo の役割分担を説明できること
- このワークスペースの構成例（`shared-copilot-skills` と consumer repos）を把握できること
- `submodule` や `subtree` を使った shared repo 参照の仕組みを説明できること
