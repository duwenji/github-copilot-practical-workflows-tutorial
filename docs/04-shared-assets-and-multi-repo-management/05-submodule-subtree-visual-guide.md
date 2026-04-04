# submodule / subtree の見え方を図で整理する

## 全体イメージ

### `submodule`

```mermaid
flowchart LR
    A[Main Repo] --> B[.gitmodules / commit pointer]
    B --> C[Shared Repo]
```

### `subtree`

```mermaid
flowchart LR
    D[Main Repo] --> E[shared/ folder<br/>history included]
```

## 実務上の違い

- `submodule` は **外部 repo を参照** するため、共有元を独立して管理しやすいです。
- `subtree` は **利用側 repo に取り込む** ため、clone や日常操作が分かりやすいです。
- つまり、独立管理を優先するなら `submodule`、扱いやすさを優先するなら `subtree` が向きます。
