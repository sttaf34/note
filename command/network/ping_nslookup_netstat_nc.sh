
# URLで応答を確認
ping www.yahoo.co.jp

# IPアドレスで応答を確認
ping 183.79.250.123

# IPアドレスを確認
nslookup www.yahoo.co.jp

# -w -> タイムアウト秒数指定、指定が無いと繋ぎっぱなしになってしまうっぽい
# -v -> 情報表示
nc -w 1 -v example.com 80

# 例
nc -w 1 -v 183.79.250.123 80
nc -w 1 -v google.com 80

# Docker で建てたコンテナの疎通確認
nc -w 1 -v 192.168.99.100 8080
nc -w 1 -v 192.168.99.100 3306

# -a すべての接続を表示
# -n DNS逆引きを行わず、IPアドレスとポート番号を数値のみで出力する
# -o 各接続に関連付けられたプロセスIDを表示する
netstat -aon