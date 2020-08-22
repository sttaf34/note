# コマンドの実行結果を別コマンドに渡す、プロセス置換

# ファイルの行数を数える
wc -l ~/Projects/note/command/basic/tail.sh

# 標準出力を渡して行数を数える
ls -l ~/Projects | wc -l

# コマンドの実行結果をファイルとして扱って、行数を数える
# この使い方だと利便性はない
wc -l <(ls -l ~/Projects)

# diffは基本的には、ファイルパスを引数に取る
diff ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

# 「-」をつけると、標準出力を引数に取れる
cat ~/Projects/note/command/basic/tail.sh | diff -u ~/Projects/note/command/basic/grep.sh -

# diffの比較対象の片方がコマンドの実行結果の場合は、
# プロセス置換無しでもパイプで渡せば書ける
ls -l ~/Projects | diff -u ~/Projects/note/command/basic/grep.sh -

# diffの比較対象の両方がコマンドの実行結果の場合は、
# プロセス置換を使わないと実行できない、これが利点なのかも
cat <(ls -la ~/Projects) | diff -u <(ls -l ~/Projects) -
diff -u <(ls -l ~/Projects) <(ls -la ~/Projects)
