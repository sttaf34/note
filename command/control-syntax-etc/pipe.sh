# パイプの左のコマンドの出力を右のコマンドの入力に渡す
echo pineapple | grep "apple"

# echo -e => 改行を表示する
# 改行区切りで出力すると、
# 例えば grep に渡したときに各行毎に処理してくれる
echo -e "apple\nbanana\npineapple\n" | grep "apple"
