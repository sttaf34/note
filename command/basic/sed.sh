
# s -> 正規表現置換
# 最初に見つかったcatをdogに置換
echo "cat cat" | sed -e "s/cat/dog/"

# g -> 全部置換する
# 見つかったcatを全部dogに置換
echo "cat cat" | sed -e "s/cat/dog/g"

# デリミタを@にしてみる
echo "cat cat" | sed -e "s@cat@dog@g"

# 環境変数を改行で分割して見やすく表示
echo $PATH | sed -e "s/:/\n/g"

# n -> 出力コマンド以外の出力は行わない
# 1行目から5行目だけを出力する場合
history | tail -10 | sed -n "1,5p"

# d -> 行番号指定で削除
# 1行目から5行目を削除して6行目以降を出力している
history | tail -10 | sed "1,5d"

# 先頭になにか文字を追加したい場合
history | tail -10 | sed -e "s@^@history =>@"

# 末尾になにか文字を追加したい場合
history | tail -10 | sed -e "s/\$/ hello/"
