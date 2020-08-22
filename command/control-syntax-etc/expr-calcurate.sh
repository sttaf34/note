# expr で加減乗除余
expr 15 + 5
expr 15 - 5
expr 15 \* 5 # エスケープが必要
expr 15 / 5
expr 15 % 4

# $(()) で加減乗除余
echo $((15 + 5))
echo $((15 - 5))
echo $((15 * 5))
echo $((15 / 5))
echo $((15 % 4))

# 変数を使って計算
VARIABLE=15
echo $(($VARIABLE * 5))
