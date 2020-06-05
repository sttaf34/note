# 実行すると標準出力と標準エラーを表示する関数
function echo-out-and-error() {
  echo "標準出力" >&1
  echo "標準エラー" >&2
}

# ターミナル上だと、標準出力と標準エラーの区別がつかない
# 続けて両方が表示されている
echo-out-and-error

# 1> は標準出力をファイルに出力「>」と一緒
# この場合、標準エラーは画面に表示される
echo-out-and-error 1> result.txt

# 2> は標準エラーをファイルに出力
# この場合、標準出力は画面に表示される
echo-out-and-error 2> result.txt

# 標準出力と標準エラーをファイルに出力のいくつかの書き方
echo-out-and-error &> result.txt
echo-out-and-error >& result.txt
echo-out-and-error > result.txt 2>&1

# そもそも標準出力と標準エラーを捨てるなと言う話
# https://sfujiwara.hatenablog.com/entry/20120613/1339547638
