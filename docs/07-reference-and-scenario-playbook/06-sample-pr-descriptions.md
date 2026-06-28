# サンプル PR 説明文

## 概要

実務でそのまま参考にできる Pull Request 説明文のサンプル集です。
機能追加・Hotfix など代表的なケースのテンプレートを収録しています。

## サンプル PR 説明文

### 例: 機能追加

```markdown
## Summary
- Add quiz filter to the selector UI
- Improve discoverability for grouped learning sets

## Why
- Users had difficulty finding related quiz sets

## Verification
- Confirmed local UI behavior
- Ran `npm run ebook:build`  
  - `ebook:build`: ebook 出力の build 成否確認
```

### 例: Hotfix

```markdown
## Summary
- Fix broken navigation link in collaboration chapter

## Why
- Learners could not open the `fork/upstream` guide

## Verification
- Checked links locally
- Rebuilt ebook output
```

### 例: ドキュメント更新

```markdown
## Summary
- Update onboarding guide with new team rules

## Why
- Existing guide was missing the branch naming convention

## Verification
- Reviewed updated sections
- Confirmed no broken links
- Ran `npm run ebook:build`
```

## PR 説明文の書き方のポイント

- `Summary` には **何を変えたか** を箇条書きで記載すること
- `Why` には **なぜ変えたか** を簡潔に記載すること
- `Verification` には **どう確認したか** を再現可能な形で記載すること

## 関連ページ

- [公開前チェックリスト](08-release-readiness-checklist.md)
- [シナリオ別逆引きガイド](03-scenario-index.md)
- [Copilot プロンプトパターン集](02-copilot-prompt-patterns.md)
