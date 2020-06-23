# PHP 実行する
php -r 'echo("Hello!\n");'

# 標準入力を受け取る
echo 'Hello!' | php -r 'echo(fgets(STDIN));'
