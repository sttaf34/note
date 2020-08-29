# 引数に括弧を付与して出力する関数
# $@ => 引数全部
function echo-bracket() {
  echo 【$@】
}

# $1, $2 => 引数を区切って受け取る
# echo-bracket-separetely 123 456 とすると $1 => 123 $2 => 456
function echo-bracket-separetely() {
  echo 【$1】
  echo 《$2》
}

# 引数付きの関数
# 計算の書き方は ./expr-calcurate.sh にまとめてある
function echo-addition-result() {
  echo $(($1 + $2))
}

# 実行時は () は付けない
echo-addition-result 12 17

# 標準出力を変数に代入することで、返り値のように扱う
RESULT=$(echo-addition-result 12 17)
echo $RESULT

# 配列
function echo-numbers() {
  # 変数に格納
  NUMBERS=(8 2 1 4 5)

  # echo で改行しながら、要素を順番に出力
  for e in ${NUMBERS[@]} ; do
    echo $e
  done
}

# 改行で区切って出力
echo-numbers
echo-numbers | sort

# 変数で受けてから echo すると改行区切りにはならない
NUMBERS=$(echo-numbers)
echo -e $NUMBERS
