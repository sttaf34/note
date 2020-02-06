
## 最上部に1マス分の線を描画
convert -size 640x800 xc:#ffffff \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 0,0 639,0" \
        bmp3:new.bmp

## 線を引く位置 ＋ 線の太さ ＝ 画像の大きさ
## になるようにすると画像の端ぴったしになる？
convert -size 640x800 xc:#ffffff \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 639,0 639,100" \
        bmp3:new.bmp

## 端を囲む
convert -size 640x800 xc:#ffffff \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 0,0 639,0" \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 0,0 0,799" \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 639,0 639,799" \
        -draw "stroke #000 stroke-width 1 stroke-linecap square line 0,799 639,799" \
        bmp3:new.bmp

