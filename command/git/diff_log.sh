#
# diff
#

# 「あるコミットIDの一つ前」と「あるコミットID」の差分表示
git diff 6761c3^ 6761c3

# 「HEADの一個前」と「HEAD」の差分表示
git diff HEAD^ HEAD

# ファイルを限定しての差分表示
git diff 94156c^ 94156c -- ~/Projects/note/command/basic/tail.sh

# あるコミットとあるコミットで変更したファイルの一覧
git diff --name-only XXXXXXXXXXXXXXXXXXXXX YYYYYYYYYYYYYYYYYYYY
git diff --name-only XXXXXXXXXXXXXXXXXXXXX HEAD

# 後者のコミットIDを省略するとHEADとの差分になる
git diff --name-only XXXXXXXXXXXXXXXXXXXXX

#
# log
#

# 最小の情報での履歴表示
git log --oneline

# デフォルトだと、使うスペースの割に情報が少ない
git log

# 変更したファイルを含めた履歴表示
git log --stat

# ファイルを限定しての履歴表示
git log ~/Projects/note/command/basic/tail.sh

# -p => 変更内容を表示
git log -p

# ファイルを限定して、変更内容も含めての履歴表示
git log -p ~/Projects/note/command/basic/tail.sh

# 日付で絞り込み
git log --since="10 days ago" --until="8 days ago"
git log --since="2019/12/01" --until="2019/12/31"
