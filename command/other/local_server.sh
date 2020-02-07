
# npm install -g serve
# これはグローバルに入れてしまう

# ローカルサーバ起動
# index.htmlがない場合、ファイル一覧表示してくれる
cd ~/Projects/note/htmlcss && serve

# PHPでもできるが、index.htmlがない場合、404になるのでちょい不便
cd ~/Projects/note/htmlcss && php -S localhost:8080
