# fork / upstream の関係を図で理解する

## 全体関係図

```mermaid
flowchart LR
    subgraph Remote["Remote 側"]
        U["upstream/main<br/>本家リポジトリ"]
        OM["origin/main<br/>自分の fork"]
        OF["origin/feature/*<br/>自分の作業 branch"]
    end

    subgraph Local["Local 側"]
        LM["local main"]
        LF["local feature/*"]
        LR["local release/*"]
    end

    REL["Release / Deploy"]

    U -->|fork / sync| OM
    OM -->|clone / pull| LM
    LM -->|branch| LF
    LF -->|push| OF
    OF -->|Pull Request| U
    LM -->|prepare release| LR
    LR -->|tag / deploy| REL
```

## この図で押さえること

- `upstream` は本家、`origin` は自分の `remote`、`local` は手元の作業環境です。
- 日常開発では `local main` を最新化してから `feature branch` を切り、`origin` に push して `Pull Request` を出します。
- `release` は `main` を起点に分けて考えると、通常開発と運用フローを整理しやすくなります。
