
# サーバ立ち上げて、
# 階層下のファイル変更を監視して、ブラウザを自動リロードしてくれる
cd ~/Projects/note/htmlcss && browser-sync start --server --files "*"
cd ~/Projects/note/javascript && browser-sync start --server --files "*"
cd ~/Projects/note/jquery && browser-sync start --server --files "*"

# serve コマンドでやるとなると、微調整を何度も繰り返す時に
# VSCode と Chrome を行ったり来たりする必要があって手間だが、
# browser-sync は自動でリロードされるので、すごく楽

# https://www.browsersync.io/
