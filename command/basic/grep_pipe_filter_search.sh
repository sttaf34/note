
# 全部表示
cat ~/Projects/dotfiles/code_settings.jsonc

# 'terminal'を含む行だけを表示
cat ~/Projects/dotfiles/code_settings.jsonc | grep terminal

# -v -> 含まない行を検索
cat ~/Projects/dotfiles/code_settings.jsonc | grep -v editor

# 複合条件
cat ~/Projects/dotfiles/code_settings.jsonc | grep -v editor | grep -v lint

#
# 検索
#

# grepで該当箇所があった場合 $? = 0 となる
cat ~/Projects/dotfiles/code_settings.jsonc | grep terminal
echo $?

# grepで該当箇所がなかった場合 $? = 1 となる
cat ~/Projects/dotfiles/code_settings.jsonc | grep pineapple
echo $?
