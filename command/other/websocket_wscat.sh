# npm install -g wscat

# WebSocket のサーバ
wscat -l 4000

# WebSocket のクライアント
wscat -c ws://localhost:4000

# ターミナル2つ並べて開いて
# サーバのコマンドと、クライアントのコマンドを実行すると
# 相手側にも表示される
