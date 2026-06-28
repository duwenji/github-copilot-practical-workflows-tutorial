# FAQ とトラブルシューティング

## 概要

GitHub / GitHub Copilot の実務運用でよく出る疑問と対処法をまとめたリファレンスです。

## よくある質問

### Q. `origin` と `upstream` の違いが分かりません

`origin` は自分が `push` する先（自分の fork またはチームの repo）、
`upstream` は本家リポジトリです。`fork` ベースで開発するときは両方を登録して使い分けます。

```powershell
git remote -v   # 現在の登録を確認する
```

詳細: [fork と upstream の基本](../03-collaboration-patterns/01-fork-and-upstream-basics.md)

---

### Q. `submodule` と `subtree` はどちらを選べばよいですか？

| 観点 | submodule | subtree |
|---|---|---|
| 履歴の独立 | 独立する | 取り込まれる |
| clone 時の操作 | `--recursive` が必要 | 不要 |
| 初学者の扱いやすさ | 難しい | やや易しい |

独立した履歴を厳密に管理したいなら `submodule`、利用側の操作を単純にしたいなら `subtree` が候補です。

詳細: [submodule vs subtree 判断ガイド](../04-shared-assets-and-multi-repo-management/03-submodule-vs-subtree-decision-guide.md)

---

### Q. Copilot の提案はそのまま使ってよいですか？

使えません。必ず以下を確認してから採用します:

1. **要件との一致**: 提案が仕様を満たしているか
2. **セキュリティ**: 入力バリデーション・認証処理が適切か
3. **テスト**: ローカルでテストを実行して動作確認しているか

---

### Q. CI が失敗しましたが、ローカルでは再現しません

以下を順番に確認します:

1. Node.js / 言語ランタイムのバージョンが CI と一致しているか（`.nvmrc` / `package.json` の `engines` を確認）
2. 環境変数が CI に設定されているか（リポジトリの `Settings > Secrets and variables` を確認）
3. CI のエラーログを Copilot Chat に貼り付けて原因仮説を聞く

詳細: [CI と GitHub Actions の基本](../05-release-hotfix-and-operations/01-ci-and-github-actions-basics.md)

---

### Q. `git merge` と `git rebase` はどちらを使うべきですか？

| 観点 | merge | rebase |
|---|---|---|
| 履歴の形 | マージコミットが残る | 直線的になる |
| 操作の安全性 | 安全 | 操作ミスのリスクあり |

チームの規約に従うのが最優先です。決まっていない場合は `merge` を選ぶほうが安全です。

詳細: [merge と rebase の実践](../03-collaboration-patterns/03-merge-vs-rebase-in-practice.md)

---

### Q. PR のコンフリクトを解消する手順を教えてください

```powershell
git fetch origin
git switch feature/my-branch
git merge origin/main              # コンフリクトを発生させる
# コンフリクトマーカー（<<<<・====・>>>>）を手動で解消する
git add .
git commit -m "fix: resolve merge conflicts"
git push origin feature/my-branch
```

詳細: [Copilot でコンフリクトを解消する](../03-collaboration-patterns/04-resolving-conflicts-with-copilot.md)

---

### Q. `git submodule update` を忘れると何が起きますか？

submodule のコードが古いバージョンのままになります。
ビルドエラーや予期しない動作の原因になるため、`clone` や `pull` 後は必ず実行します。

```powershell
git submodule update --init --recursive
```

---

### Q. `copilot-instructions.md` が効いているか確認する方法は？

Copilot Chat で「あなたが現在認識しているプロジェクトのルールを教えてください」と尋ねます。
`.github/copilot-instructions.md` の内容が反映されていれば、ルールが読み込まれています。

詳細: [チーム向け copilot-instructions の作り方](../06-team-standards-and-governance/01-copilot-instructions-for-teams.md)

---

### Q. hotfix ブランチはいつ削除すればよいですか？

`main` と `release` の両方に merge されて CI が通ったあと、すぐに削除します。

```powershell
git branch -d hotfix/fix-login-error              # ローカル削除
git push origin --delete hotfix/fix-login-error   # リモート削除
```

詳細: [hotfix ワークフロー](../05-release-hotfix-and-operations/03-hotfix-workflow.md)

---

### Q. PR 説明文に何を書けばよいですか？

最低限、以下の 3 点を含めます:

1. **変更理由**: なぜこの変更が必要か（Issue 番号があれば `Closes #123` で紐付ける）
2. **変更内容**: 何を変えたか（ファイル・関数の概要）
3. **動作確認**: どのようにテスト・確認したか

詳細: [サンプル PR 説明文](06-sample-pr-descriptions.md)

## 関連ページ

- [コマンドチートシート](01-command-cheatsheet.md)
- [Copilot プロンプトパターン集](02-copilot-prompt-patterns.md)
- [シナリオ別逆引きガイド](03-scenario-index.md)
- [実務シナリオ判断マトリクス](05-practical-decision-matrix.md)
