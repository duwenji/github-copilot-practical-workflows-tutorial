# CI と GitHub Actions の基本

## 典型シナリオ

PR を作成したら `GitHub Actions` が走り、lint / test / build の結果を確認する場面です。

## コンセプトと仕組み

- `.github/workflows/` に配置した YAML ファイルによる CI/CD 定義の仕組み
- `push` や `pull_request` などのイベントをトリガーとしたジョブの自動実行
- `runner` と呼ばれる実行環境での独立したジョブ実行
- `Checks` タブを使った結果確認と失敗ジョブの特定
- `secrets` による API キーなどの機密情報の安全な管理

## 基本手順

1. `.github/workflows/` に YAML ファイルを配置すること
2. トリガーイベントとジョブの設定を確認すること
3. PR 作成後に `Checks` タブで結果を確認すること
4. 失敗したジョブのログを開いてエラーを特定すること
5. ローカルで再現できるか確認すること
6. 修正して push し、再実行結果を確認すること

## Copilot の使いどころ

- CI エラーログの要約
- 原因仮説の整理
- 修正候補の比較
- release note の下書き

## 注意点

- 赤い CI をそのまま merge しないこと
- 失敗ジョブを 1 つずつ潰すこと
- Hotfix は通常フローより速くても、記録は残すこと
- `secrets` を YAML に直接書かないこと

## 章末チェック

- `GitHub Actions` の仕組みとトリガーの種類を説明できること
- PR の `Checks` タブで失敗したジョブを特定できること
- CI エラーの原因を Copilot と一緒に調査できること
