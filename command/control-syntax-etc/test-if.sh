# コマンドの終了ステータスを表示する
# 0 以外のときはプロンプトに表示するようにしている
echo $?

# test コマンドは終了ステータスで結果を得るような仕組み
# 真 => 0
# 偽 => 1

# 文字列の判定
test "apple" = "apple";  echo $? # 文字列の一致 0 が返る
test "apple" = "fruit";  echo $? # 文字列の一致 1 が返る
test "apple" != "apple"; echo $? # 文字列の不一致

# 整数の判定
test 123456 -eq 123456;  echo $? # 数値の一致
test 123456 -ne 123456;  echo $? # 数値の不一致

# if と test
VARIABLE=15
if test $VARIABLE = 15; then
  echo 15である
else
  echo 15ではない
fi

# test を [] で書いてみる
if [ $VARIABLE = 15 ]; then
  echo 15である
else
  echo 15ではない
fi

# 正規表現のときは [[]] で囲む
VARIABLE=example.pdf
if [[ $VARIABLE =~ pdf$ ]]; then
  echo PDF!
fi

# 標準出力の結果に応じて何かをしようとする場合
RESULT=$(echo '')
echo $RESULT
if [ -n "$RESULT" ]; then
  echo "RESULTには何かが入っている" # 通らない
fi

RESULT=$(echo 'Hey!')
echo $RESULT
if [ -n "$RESULT" ]; then
  echo "RESULTには何かが入っている" # 通る
fi
