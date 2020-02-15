
# -a -> リモートを含んで、すべてのブランチ一覧の表示
git branch -a

# -v -> 表示にコミットハッシュが含まれるようになる
git branch -v

# -vv -> 表示にコミットハッシュとブランチ名が含まれるようになる
git branch -vv

# -m -> ブランチ名変更、今いるブランチ名を変更
git branch -m NEW_BRANCH_NAME

# これでも可
git branch -m OLD_BRANCH_NAME NEW_BRANCH_NAME
