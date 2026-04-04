# CI と GitHub Actions の基本

## 典型シナリオ

PR を作成したら `GitHub Actions` が走り、lint / test / build の結果を確認する場面です。

## 見るべきポイント

- `Checks` が成功しているか
- どのジョブで落ちたか
- 再現方法がローカルにあるか

## Copilot の使いどころ

- CI エラーログの要約
- 原因仮説の整理
- 修正候補の比較
- release note の下書き

## 実務の基本姿勢

- 赤い CI をそのまま merge しない
- 失敗ジョブを 1 つずつ潰す
- Hotfix は通常フローより速くても、記録は残す
