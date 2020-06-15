
# -e -> 改行を表示する
echo -e "apple\norange\ngrape"

# 文字の順でソート
echo -e "apple\norange\ngrape" | sort

# -n -> 数値の順でのソート
echo -e "123\n99\n85\n3" | sort -n

# -r -> 逆順でソート
echo -e "123\n99\n85\n3" | sort -nr

# 環境変数を改行で分割して見やすく表示
# Mac の Bash だとダメだった
echo $PATH | sed -e "s/:/\n/g"

# 環境変数を改行で分割して見やすく表示
echo $PATH | tr '*' '\n'
