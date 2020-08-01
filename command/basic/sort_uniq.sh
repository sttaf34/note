# 文字の順でソート
echo -e "apple\norange\ngrape" | sort

# -n -> 数値の順でのソート
echo -e "123\n99\n85\n3" | sort -n

# -r -> 逆順でソート
echo -e "123\n99\n85\n3" | sort -nr

# コマンド履歴から通し番号を除去したものを出力
history | head -20 | awk '{print $2}'

# uniq で重複行を削除する
# uniq は sort 済でないと機能しない
history | head -20 | awk '{print $2}' | sort | uniq

# -c -> 数を数える
history | head -20 | awk '{print $2}' | sort | uniq -c

# さらに awk で条件指定で絞り込む
# $1 が数えた数を指していて、それを検索条件にしてる
history | head -20 | awk '{print $2}' | sort | uniq -c | awk '$1 > 1 {print $0}'

# 文字数順にソートして、文字数とパスを表示する
(cd ~/Projects/note/jquery && git ls-files) | awk '{print length(),$0}' | sort -n

# 文字数順にソートして、パスを表示する、文字数は表示しない
(cd ~/Projects/note/jquery && git ls-files) | awk '{print length(),$0}' | sort -n | awk '{print $2}'
