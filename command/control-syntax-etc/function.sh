# 引数付きの関数
function echoAdditionResult() {
  echo $(($1 + $2))
}

# 実行時は () は付けない
echoAdditionResult 12 17

# 標準出力を変数に代入することで、返り値のように扱う
RESULT=$(echoAdditionResult 12 17)
echo $RESULT

# 配列
function echoNumbers() {
  # 変数に格納
  NUMBERS=(8 2 1 4 5)

  # echo で改行しながら、要素を順番に出力
  for e in ${NUMBERS[@]} ; do
    echo $e
  done
}

# 改行で区切って出力
echoNumbers
echoNumbers | sort

# 変数で受けてから echo すると改行区切りにはならない
NUMBERS=$(echoNumbers)
echo -e $NUMBERS
