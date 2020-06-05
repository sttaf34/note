# -e -> 改行を表示する
echo -e "apple\norange\ngrape"

# 改行表示されない
echo "apple\norange\ngrape"

# 末尾に改行が入らない
printf "apple"

# 桁揃え・ゼロ埋め
printf "%4d" 85
printf "%04d" 85

# パイプで受け取ってのゼロ埋め
echo 85 | printf "%04d" $(cat)

# 環境変数を改行で分割して見やすく表示
echo $PATH | sed -e "s/:/\n/g"
