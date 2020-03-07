
# https://ja.wikipedia.org/wiki/Base64
# データを64種類の英数字のみで表すエンコード方式

# エンコード
echo "こんにちは！！" | base64

# デコード
echo "44GT44KT44Gr44Gh44Gv77yB77yBCg==" | base64 -d

# ファイルの中身をエンコードしてファイルに出力
base64 sample.txt > base64.txt

# ファイルの中身をデコードして表示
base64 -d base64.txt

#
# - 元のデータに戻せる。
# - データ量は増える。
#
