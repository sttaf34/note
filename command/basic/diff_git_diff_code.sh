
#
# ローカルでの差分
#

# ファイル間の差分表示、デフォルトだと見にくい
# 左のファイルを、右のファイルに変更した時の差分を表示している
diff ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

# gitでの差分表示と同様に区切って表示、単一色なのでまだ見にくい
# -u => ユニファイド形式で表示とのこと
diff -u ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

# git管理外のファイルであれば、git diff でファイル間の差分表示ができる、色がつく
git diff <管理外のファイル> <管理外のファイル>

# 但し、git管理下にあるファイルの場合は、この書き方だと
# tail.shのadd済と未addの差分、grep.shのadd済と未addの差分が表示されてしまう
git diff ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

# --no-index => このオプション指定で、単純なファイル間差分表示にできる
git diff --no-index ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

# VSCodeで差分を見る、これが一番見やすいかも
code -d ~/Projects/note/command/basic/tail.sh ~/Projects/note/command/basic/grep.sh

#
# リモート絡みの差分
#

# リモートとローカルの差分を、プロセス置換を利用して見る
# プロセス置換 -> ./process_substitution.sh
# ローカルで作業した後で、リモートに反映させる時に差分を見ているような形
diff -u <(ssh gcp 'cat ~/.bashrc') ~/.bashrc

# これは動かない
# git diff <(ssh gcp 'cat ~/.bashrc') ~/.bashrc

# リモートとリモートの差分
diff -u <(ssh gcp 'cat ~/.bashrc') <(ssh aws 'cat ~/.bashrc')
