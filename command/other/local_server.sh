
# 今いるところでローカルサーバ起動
# index.htmlがない場合、ファイル一覧表示してくれる
# npm install -g serve
# これはグローバルに入れてしまって良いかもかな？
cd ~/Projects/Documents/HTMLCSS && serve

# index.htmlがない場合、404になるのでちょい不便
cd ~/Projects/Documents/HTMLCSS && php -S localhost:8080
