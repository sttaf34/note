
# 構造
# grep オプションと条件・検索対象（ファイルやディレクトリ等）

# 文字列・一つのファイル
grep 'git' ~/Projects/note/command/git/diff_log.sh

# 正規表現・一つのファイル
# -e -> 正規表現
grep -e '^git' ~/Projects/note/command/git/diff_log.sh

# 正規表現・ディレクトリ下の全ファイルを再帰的に
# -r -> ディレクトリ下の全ファイルを再帰的に
# ファイル名とファイル内のマッチ箇所が表示される
grep -e '^git' -r ~/Projects/note/command

# 正規表現・ディレクトリ下の全ファイルを再帰的に
# -h -> ファイル名を非表示
grep -e '^git' -h -r ~/Projects/note/command

# -l -> ファイル名だけを表示（ファイル内該当箇所は表示しない）
# 検索対象のところではワイルドカードが使える
grep -l 'git' ~/Projects/note/command/*

# cdしてから、現在ディレクトリ下を検索対象とする
cd ~/Projects/note/command/ && grep -lr 'git' .

# --color=auto -> 可能なら色を付ける、パイプで渡したは付けない
grep -e '^git' -r ~/Projects/note/command --color=auto | head

# --color=always -> パイプで渡した先でも色がつく
grep -e '^git' -r ~/Projects/note/command --color=always | head

# ワイルドカードを使えば、1つの階層下のファイルだけを対象にできるが
# ディレクトリが含まれていると「Is a directory」が邪魔になる
# -s -> エラーメッセージを表示しない、「Is a directory」は表示されない
grep '100%' -s ~/Projects/note/htmlcss/*

# 2階層以内の範囲を検索対象にしたいとかなら find と組み合わせることになる
