# ブランチ作って、そのブランチにチェックアウト
git checkout -b NEW_BRANCH_NAME

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

# リモートにだけ存在している特定のブランチにチェックアウト
# git checkout -b <ローカルで新たに作成するブランチ名> <リモートのブランチ名>
git checkout -b branch_a origin/branch_a

# git branch -a で表示されるリモートブランチが削除済のときに、
# それをローカルでも表示されないようにする
git fetch -p
git fetch --prune
