# パスが通っている場所表示
echo $PATH

# 改行で分割して見やすく表示
echo $PATH | sed -e "s/:/\n/g"

# .bashrcへの書き方
PATH=$PATH:/usr/local/bin
export PATH

# 一行で書くならこう
export PATH=$PATH:/usr/local/bin

# 即座に反映させたい場合はsourceコマンドを打つ
source ~/.bashrc
