# 文字列の中にコマンド実行を書く command substitution
echo "Today is $(date)."

# ~/Projects/dotfiles 下のディレクトリ数の取得
find ~/Projects/dotfiles -type d | wc -l

# コマンドの実行結果を埋め込むような形
echo "ディレクトリ数は $(find ~/Projects/dotfiles -type d | wc -l) です"

# バッククォートでもいけるけど $() の方を使おう
# 理由 => https://stackoverflow.com/questions/9405478/
echo "ディレクトリ数は `find ~/Projects/dotfiles -type d | wc -l` です"
