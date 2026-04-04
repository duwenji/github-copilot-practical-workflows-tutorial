# 日常開発の全体フローマップ

## 1本の流れで見る

```mermaid
flowchart TD
    A[Issue / 受入条件を確認] --> B[local main を最新化]
    B --> C[feature branch を作成]
    C --> D[Copilot を使って実装]
    D --> E[ローカルで test / build 確認]
    E --> F[origin/feature に push]
    F --> G[Pull Request を作成]
    G --> H[レビュー対応]
    H --> I[CI 通過]
    I --> J[main に merge]
```

## ポイント

- `Issue` で目的を確認してから branch を切ると、変更範囲がぶれにくくなります。
- `Copilot` は実装補助と説明整理に役立ちますが、品質判定は `review` と `CI` が担います。
- `local` → `remote` → `PR` → `main` の流れで見ると、1 サイクルを把握しやすくなります。
