# PHP 実行する
php -r 'echo("Hello!\n");'

# 標準入力を受け取る
echo 'Hello!' | php -r 'echo(fgets(STDIN));'

# 一行づつ処理する
# -R => Run PHP <code> for every input line
ls / | php -R 'echo($argn . "\n");'

# それぞれの行に 0.6 から 1.1 を掛けて出力する
echo -e "500\n400" | php -R 'echo($argn * rand(60, 110) * 0.01 . "\n");'

# 小数点以下を丸めて、ヒアドキュメントを絡める
cat <<EOF | php -R 'echo(round($argn * rand(60, 110) * 0.01) . "\n");'
333
444
555
EOF
