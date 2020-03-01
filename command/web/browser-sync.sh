
# https://www.browsersync.io/

# サーバ立ち上げて、
# 階層下のファイル変更を監視して、ブラウザを自動リロードしてくれる
cd ~/Projects/note/htmlcss && browser-sync start --server --files "*"
cd ~/Projects/note/javascript && browser-sync start --server --files "*"
cd ~/Projects/note/jquery && browser-sync start --server --files "*"

# serve コマンドでやるとなると、微調整を何度も繰り返す時に
# VSCode と Chrome を行ったり来たりする必要があって手間だが、
# browser-sync は自動でリロードされるので、すごく楽
#
# グローバルにしてしまう
# npm install -g browser-sync


# 例えば Express の開発時も Hot Reload したい場合

# 通常の開発サーバを立ち上げる
cd ~/Projects/note-express/hello-express && yarn develop

# これで browser-sync が見てくれる
browser-sync start --proxy "127.0.0.1:10300" --files="./**/*"
