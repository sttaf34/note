
# コマンド実行履歴（Temp）を表示
history

# コマンド実行履歴（File）を表示
# exitなどのタイミングでTempからFileに保存される
cat ~/.bash_history

# 任意のタイミングでTempからFileに保存する
history -a

# 任意の文字列をTempの末尾に追加する
history -s pwd

# 履歴に追加しない設定
export HISTIGNORE="history:history*:ls*"

# 最新10件
history | tail -10

# 表示のコマンド部分だけを抽出
# while の仮引数みたいな部分（number command）は複数個の値を取れるのを利用
history | tail -100 | while read number command
do
  echo $command
done | less

# 回数を数えて、表示条件にする
history | while read number command
do
  echo $command
done | sort | uniq -c | awk '$1 > 2 {print $0}'
