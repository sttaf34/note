
# 1-10の連番を出力
seq 10

# -w -> 0埋めで桁揃え
seq -w 10

# 開始と終了を指定
seq -w 99 103

# 開始と増分と終了を指定
seq 0 3 12

# クリップボード入れると便利かもしれない
seq 10 | pbcopy
seq 10 | clip