
# 行数・単語数・バイト数・ファイル名を表示
wc ~/Projects/note/command/basic/awk.sh

# -l -> 行数表示
# -w -> 単語数表示
# -c -> バイト数表示
wc -l ~/Projects/note/command/basic/awk.sh

# findで指定した条件のファイル数を数える
find ~/Projects/note/command/basic/ -name '*.sh' | wc -l

# 例：あるディレクトリ下のファイル数
find ~/Projects/note/command/basic/ -type f | wc -l

# 例：あるディレクトリ下のディレクトリ数
find ~/Projects/dotfiles/ -type d | wc -l
