
# -i => 設定の表示
php -i | less

# 使っている php.ini のパスの表示
php -i | grep 'php.ini'

# ローカルサーバ起動
cd ~/Projects/note/htmlcss && php -S localhost:8080
