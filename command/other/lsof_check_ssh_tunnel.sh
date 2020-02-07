
# 全プロセスを表示する
lsof

# ssh のトンネルの状況を調べるとき
# -n -> IPアドレスを表示する
# -P -> ポート番号をサービス名に変換しない
# -i -> ネットワークソケットファイルを指定する
lsof -n -P -iTCP -sTCP:LISTEN
