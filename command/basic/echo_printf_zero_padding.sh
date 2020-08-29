# 引数の内容を標準出力に出力する
echo "Hey!"

# -e -> 改行を表示する
echo -e "apple\norange\ngrape"

# 改行表示されない
echo "apple\norange\ngrape"

# 末尾に改行が入らない
printf "apple"

# 桁揃え・ゼロ埋め
printf "%4d" 85
printf "%04d" 85

# 環境変数を改行で分割して見やすく表示
echo $PATH | sed -e "s/:/\n/g"

# パイプで受け取ってのゼロ埋め
# パイプで受け取った標準出力を cat で出力して printf に引数で渡してる
# printf "%04d" 85
echo 85 | printf "%04d" $(cat)

# 複数行をパイプで受け取って、色をつけてみる
seq 5 | printf "${GREEN}[%s]${RESET}\n" $(cat)
