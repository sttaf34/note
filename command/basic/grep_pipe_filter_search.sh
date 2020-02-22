
# 全部表示
cat ~/Projects/dotfiles/vscode/settings.jsonc

# 'terminal'を含む行だけを表示
cat ~/Projects/dotfiles/vscode/settings.jsonc | grep terminal

# -v -> 含まない行を検索
cat ~/Projects/dotfiles/vscode/settings.jsonc | grep -v editor

# 複合条件
cat ~/Projects/dotfiles/vscode/settings.jsonc | grep -v editor | grep -v lint

#
# 検索
#

# grepで該当箇所があった場合 $? = 0 となる、if の判定とかに使う用
# $? -> 直前実行したコマンドの終了値（0:成功, 1:失敗）
cat ~/Projects/dotfiles/vscode/settings.jsonc | grep terminal
echo $?

# grepで該当箇所がなかった場合 $? = 1 となる
cat ~/Projects/dotfiles/vscode/settings.jsonc | grep pineapple
echo $?
