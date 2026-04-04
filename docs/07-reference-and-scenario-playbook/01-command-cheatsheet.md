# Git / GitHub コマンド早見表

## 基本

```powershell
git status
git pull origin main
git switch -c feature/my-task
git add .
git commit -m "Add feature"
git push origin feature/my-task
```

## fork / upstream

```powershell
git remote -v
git remote add upstream https://github.com/ORIGINAL_OWNER/REPO.git
git fetch upstream
git merge upstream/main
```

## submodule

```powershell
git submodule update --init --recursive
git submodule status
```

## 注意

- コマンドを覚えるより、**どの場面で使うか** を意識する
- merge / rebase / submodule 更新は、実行前に意図を確認する
