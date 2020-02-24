
# DES (Data Encryption Standard)
# AES (Advanced Encryption Standard)
# AES は DES に代わって新しい標準暗号となった共通鍵暗号アルゴリズム

# aes-256-cbc -> 暗号化のアルゴリズムと暗号利用モードの指定
# -e          -> 暗号化する
# -pass       -> 鍵を指定、「pass:」とプリフィックスを指定する必要がある
# -in         -> 平文を指定
openssl aes-256-cbc -e -in input.txt -pass pass:password

# プロセス置換で平文を渡してみる
openssl aes-256-cbc -e -in <(echo 'apple') -pass pass:password

# 標準出力への表示が読めないので od でバイナリ出力してみる
openssl aes-256-cbc -e -in <(echo 'apple') -pass pass:password | od

# 暗号文をファイルに出力
openssl aes-256-cbc -e -in <(echo 'apple') -out output -pass pass:password

# 復号してみると「apple」がちゃんと表示される
openssl aes-256-cbc -d -in output -pass pass:password

# 暗号利用モード
# https://ja.wikipedia.org/wiki/暗号利用モード
