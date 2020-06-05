
# ビットとバイト
# 16進数が2桁で1バイトは覚えとく
 1111111(2) = 127(10) = 7F(16) # 7ビット           = 128(10)個種類の情報を表せる
11111111(2) = 255(10) = FF(16) # 8ビット = 1バイト = 256(10)個種類の情報を表せる

#  2 -> 1101011000110000
#  8 -> 0153060
# 10 -> 54832
# 16 -> 0xd630

# bc は計算してくれるコマンド、これで進数を変換してみる
# obase -> 変換後の進数
# ibase -> 変換前の進数と数値

# 2 -> n
echo "obase=8;ibase=2;1101011000110000" | bc
echo "obase=10;ibase=2;1101011000110000" | bc
echo "obase=16;ibase=2;1101011000110000" | bc

# 8 -> n
echo "obase=2;ibase=8;0153060" | bc
echo "obase=10;ibase=8;0153060" | bc
echo "obase=16;ibase=8;0153060" | bc

# 10 -> n
echo "obase=2;ibase=10;54832" | bc
echo "obase=8;ibase=10;54832" | bc
echo "obase=16;ibase=10;54832" | bc

# 16 -> n
echo "obase=2;ibase=16;D630" | bc
echo "obase=8;ibase=16;D630" | bc
echo "obase=10;ibase=16;D630" | bc

# printfの場合
printf "%d\n" 0153060  # 8 -> 10
printf "%x\n" 0153060  # 8 -> 16
printf "%o\n" 54832    # 10 -> 8
printf "%x\n" 54832    # 10 -> 16
printf "%o\n" 0xd630   # 16 -> 8
printf "%d\n" 0xd630   # 16 -> 10
