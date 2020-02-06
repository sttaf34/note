# 色指定で画像の新規作成、同じ名前のファイルがあると自動で上書き
convert -size 128x128 xc:white new.png
convert -size 128x128 xc:none new.png
convert -size 128x128 xc:#338899 new.jpg

# bmp3でバージョン指定しないとMacのプレビューで開けない
convert -size 128x128 xc:#5500ff bmp3:new.bmp

# 2枚の画像をつなげて新しい画像を作成する、サイズ違いをつなげると白で補完された
convert -append top bottom output
convert +append left right output

# サイズ変更、mogrifyだと破壊編集
convert -resize 50% before.png after.png
mogrify -resize 50% before.png

# 横を指定ピクセル数にする
convert -resize 128x before.png after.png

# 縦を指定ピクセル数にする
convert -resize x480 before.jpg after.jpg

# 拡張子変更
convert before.jpg after.png

# アスペクト比を無視してサイズ変更
convert -resize 128x10\! before.png after.png

# サイズ確認
identify hoge.png

# 画像の一部分を切り取り、左上を基点にし whxy を指定する
convert -crop 100x100+20+20 before.png after.png

# 回転 数値は角度
convert -rotate 90 before.png after.png

## hoge.pngの特定の色を透明化する
mogrify -transparent white hoge.png
